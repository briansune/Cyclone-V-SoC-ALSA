/*
 * I2S shift in function.  Data interface is a FIFO.  FIFO is assumed to be dual-clock.
 * There will be no writes if not enabled.
 * New values will be written to FIFO only when fifo_ready.  If enabled, but not ready,
 * the last data sample will be dropped.
 */
module i2s_shift_in (
	
	input wire			f2h_clk,
	
	input				clk,				// Master clock, should be synchronous with bclk/lrclk
	input				reset_n,			// Asynchronous reset
	
	output reg	[31:0]	fifo_right_data,	// Fifo interface, right channel
	output reg	[31:0]	fifo_left_data,		// Fifo interface, left channel
	input				fifo_ready,			// Fifo ready (not full)
	output reg			fifo_write,			// Fifo write strobe, write only when l+r received

	input				enable,				// Software enable
	input				bclk,				// I2S bclk
	input				lrclk,				// I2S lrclk (word clock)
	input				data_in				// Data in from ADC
);
	
	wire	nrst_w;
	
	altera_std_synchronizer#(
		.depth		(3)
	)ccd_srst_u0(
		.clk		(clk),
		.reset_n	(1'b1),
		.din		(reset_n),
		.dout		(nrst_w)
	);
	
	wire	bclk_w;
	wire	lrclk_w;
	
	altera_std_synchronizer#(
		.depth		(2)
	)ccd_bclk_u(
		.clk		(clk),
		.reset_n	(1'b1),
		.din		(bclk),
		.dout		(bclk_w)
	);
	
	altera_std_synchronizer#(
		.depth		(2)
	)ccd_lrclk_u(
		.clk		(clk),
		.reset_n	(1'b1),
		.din		(lrclk),
		.dout		(lrclk_w)
	);
	
	// bclk edge
	reg bclk_delayed;
	always @(posedge clk)
	begin
		if (~nrst_w)
		begin
			bclk_delayed <= 0;
		end
		else
		begin
			bclk_delayed <= bclk_w;
		end
	end
	wire bclk_rising_edge = bclk_w & ~bclk_delayed;
	wire bclk_falling_edge = ~bclk_w & bclk_delayed;
		
	// lrclk edges
	reg lrclk_delayed;
	always @(posedge clk)
	begin
		if (~nrst_w)
		begin
			lrclk_delayed <= 0;
		end
		else
		begin
			lrclk_delayed <= lrclk_w;
		end
	end
	wire lrclk_rising_edge = lrclk_w & ~lrclk_delayed;
	wire lrclk_falling_edge = ~lrclk_w & lrclk_delayed;

	// I2S is one bclk delayed, so detect falling egde of first (complete) bclk after each lrclk edge
	reg [1:0] first_bclk_falling_after_lrclk_rising_r;
	always @(posedge clk)
	begin
		if (~nrst_w)
		begin
			first_bclk_falling_after_lrclk_rising_r <= 0;
		end
		else
		begin
			if (lrclk_rising_edge)
				first_bclk_falling_after_lrclk_rising_r <= 2'b01;
			else if (first_bclk_falling_after_lrclk_rising_r == 2'b01 && bclk_rising_edge)
				first_bclk_falling_after_lrclk_rising_r <= 2'b10;
			else if (first_bclk_falling_after_lrclk_rising_r == 2'b10 && bclk_falling_edge)
				first_bclk_falling_after_lrclk_rising_r <= 2'b11;
			else if (first_bclk_falling_after_lrclk_rising_r == 2'b11)
				first_bclk_falling_after_lrclk_rising_r <= 2'b00;
		end
	end
	wire first_bclk_falling_after_lrclk_rising = first_bclk_falling_after_lrclk_rising_r == 2'b11;
	
	reg [1:0] first_bclk_falling_after_lrclk_falling_r;
	always @(posedge clk)
	begin
		if (~nrst_w)
		begin
			first_bclk_falling_after_lrclk_falling_r <= 0;
		end
		else
		begin
			if (lrclk_falling_edge)
				first_bclk_falling_after_lrclk_falling_r <= 2'b01;
			else if (first_bclk_falling_after_lrclk_falling_r == 2'b01 && bclk_rising_edge)
				first_bclk_falling_after_lrclk_falling_r <= 2'b10;
			else if (first_bclk_falling_after_lrclk_falling_r == 2'b10 && bclk_falling_edge)
				first_bclk_falling_after_lrclk_falling_r <= 2'b11;
			else if (first_bclk_falling_after_lrclk_falling_r == 2'b11)
				first_bclk_falling_after_lrclk_falling_r <= 2'b00;
		end
	end
	wire first_bclk_falling_after_lrclk_falling = first_bclk_falling_after_lrclk_falling_r == 2'b11;
	
	wire enable_w;
	
	altera_std_synchronizer#(
		.depth		(2)
	)ccd_enable_u(
		.clk		(clk),
		.reset_n	(1'b1),
		.din		(enable),
		.dout		(enable_w)
	);
	
	// shift-register
	reg [31:0] shift_register;
	always @(posedge clk)
	begin
		if (~nrst_w)
		begin
			shift_register <= 0;
		end
		else
		begin
			if (~enable_w)
				shift_register <= 0;
			else if (bclk_rising_edge)
				shift_register <= {shift_register[30:0], data_in};
		end
	end
	
	reg	[31:0]	fifo_right_data_r;	// Fifo interface, right channel
	reg	[31:0]	fifo_left_data_r;		// Fifo interface, left channel
	
	// Load output register
	always @(posedge clk)
	begin
		if (~nrst_w | ~enable_w)
		begin
			fifo_right_data_r <= 0;
			fifo_left_data_r <= 0;
		end
		else
		begin
			if (first_bclk_falling_after_lrclk_rising)
				fifo_left_data_r <= shift_register;
			else if (first_bclk_falling_after_lrclk_falling)
				fifo_right_data_r <= shift_register;
		end				
	end
	
	genvar i;
	
	generate
		for(i=0;i<32;i=i+1)begin : cdc_left_bits
			altera_std_synchronizer#(
				.depth		(2)
			)ccd_fifo_data_u(
				.clk		(f2h_clk),
				.reset_n	(1'b1),
				.din		(fifo_left_data_r[i]),
				.dout		(fifo_left_data[i])
			);
		end
		
		for(i=0;i<32;i=i+1)begin : cdc_right_bits
			altera_std_synchronizer#(
				.depth		(2)
			)ccd_fifo_data_u(
				.clk		(f2h_clk),
				.reset_n	(1'b1),
				.din		(fifo_right_data_r[i]),
				.dout		(fifo_right_data[i])
			);
		end
	endgenerate
	
	wire	fifo_ready_w;
	
	altera_std_synchronizer#(
		.depth		(2)
	)ccd_fifo_ready_u(
		.clk		(clk),
		.reset_n	(1'b1),
		.din		(fifo_ready),
		.dout		(fifo_ready_w)
	);
	
	reg		fifo_write_r;
	
	// fifo write strobe, one clock after right channel has been loaded to output register
	always @(posedge clk)
	begin
		if (~nrst_w)
		begin
			fifo_write_r <= 0;
		end
		else
		begin
			if (~enable_w | ~fifo_ready_w)
				fifo_write_r <= 0;
			else
				fifo_write_r <= first_bclk_falling_after_lrclk_falling;
		end
	end
	
	altera_std_synchronizer#(
		.depth		(2)
	)ccd_fifo_write_u(
		.clk		(f2h_clk),
		.reset_n	(1'b1),
		.din		(fifo_write_r),
		.dout		(fifo_write)
	);

endmodule
