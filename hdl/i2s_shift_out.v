/*
 * I2S shift out function.  Data interface is a FIFO, with fall-through
 * function.  Strobing the fifo_ack makes a new left/right data value available
 * on the input.  FIFO is assumed to be dual-clock.
 * Output is zero if not enabled.
 * New values will be read from FIFO only when fifo_ready.  If enabled, but not ready,
 * the last data sample will be repeated.
 */
module i2s_shift_out (
	
	input wire			f2h_clk,
	
	input				clk,				// Master clock, should be synchronous with bclk/lrclk
	input				reset_n,			// Asynchronous reset
	
	// cdc
	input		[31:0]	fifo_right_data,	// Fifo interface, right channel
	input		[31:0]	fifo_left_data,		// Fifo interface, left channel
	input				fifo_ready,			// Fifo ready (not empty)
	output wire			fifo_ack,			// Fifo read ack

	input				enable,				// Software enable
	input				bclk,				// I2S bclk
	input				lrclk,				// I2S lrclk (word clock)
	output				data_out			// Data out to DAC
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
	
	// bclk edges
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

	// I2S is one bclk delayed, so we wait for first bclk after each lrclk edge
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
	
	wire		[31:0]	fifo_right_data_w;	// Fifo interface, right channel
	wire		[31:0]	fifo_left_data_w;	// Fifo interface, left channel
	
	genvar i;
	
	generate
		for(i=0;i<32;i=i+1)begin : cdc_fifo_right_bits
			altera_std_synchronizer#(
				.depth		(2)
			)ccd_fifo_data_u(
				.clk		(clk),
				.reset_n	(1'b1),
				.din		(fifo_right_data[i]),
				.dout		(fifo_right_data_w[i])
			);
		end
		
		for(i=0;i<32;i=i+1)begin : cdc_fifo_left_bits		
			altera_std_synchronizer#(
				.depth		(2)
			)ccd_fifo_data_u(
				.clk		(clk),
				.reset_n	(1'b1),
				.din		(fifo_left_data[i]),
				.dout		(fifo_left_data_w[i])
			);
		end
	endgenerate
	
	// shift-register
	reg [31:0] shift_register;
	always @(posedge clk)
	begin
		if (~nrst_w | ~enable_w)
		begin
			shift_register <= 0;
		end else
		begin
			if (first_bclk_falling_after_lrclk_rising)
				shift_register <= fifo_right_data_w;
			else if (first_bclk_falling_after_lrclk_falling)
				shift_register <= fifo_left_data_w;
			else if (bclk_falling_edge)
				shift_register <= {shift_register[30:0], 1'b0};
		end
	end
	assign data_out = shift_register[31];
	
	wire	fifo_ready_w;
	
	altera_std_synchronizer#(
		.depth		(2)
	)ccd_fifo_ready_u(
		.clk		(clk),
		.reset_n	(1'b1),
		.din		(fifo_ready),
		.dout		(fifo_ready_w)
	);
	
	reg		fifo_ack_r;
	
	// fifo ack, one clock after right channel has been loaded to shift register
	always @(posedge clk)
	begin
		if (~nrst_w)
		begin
			fifo_ack_r <= 0;
		end
		else
		begin
			if (~enable_w | ~fifo_ready_w)
				fifo_ack_r <= 0;
			else
				fifo_ack_r <= first_bclk_falling_after_lrclk_rising;
		end
	end
	
	altera_std_synchronizer#(
		.depth		(2)
	)ccd_fifo_ack_u(
		.clk		(f2h_clk),
		.reset_n	(1'b1),
		.din		(fifo_ack_r),
		.dout		(fifo_ack)
	);

endmodule
