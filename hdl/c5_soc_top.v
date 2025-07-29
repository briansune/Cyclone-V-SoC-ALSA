

`timescale 1ns/1ns

module c5_soc_top(
	
	hps_io_hps_io_emac1_inst_TX_CLK,
	hps_io_hps_io_emac1_inst_TXD0,
	hps_io_hps_io_emac1_inst_TXD1,
	hps_io_hps_io_emac1_inst_TXD2,
	hps_io_hps_io_emac1_inst_TXD3,
	hps_io_hps_io_emac1_inst_RXD0,
	hps_io_hps_io_emac1_inst_MDIO,
	hps_io_hps_io_emac1_inst_MDC,
	hps_io_hps_io_emac1_inst_RX_CTL,
	hps_io_hps_io_emac1_inst_TX_CTL,
	hps_io_hps_io_emac1_inst_RX_CLK,
	hps_io_hps_io_emac1_inst_RXD1,
	hps_io_hps_io_emac1_inst_RXD2,
	hps_io_hps_io_emac1_inst_RXD3,
	hps_io_hps_io_sdio_inst_CMD,
	hps_io_hps_io_sdio_inst_D0,
	hps_io_hps_io_sdio_inst_D1,
	hps_io_hps_io_sdio_inst_CLK,
	hps_io_hps_io_sdio_inst_D2,
	hps_io_hps_io_sdio_inst_D3,
	hps_io_hps_io_usb1_inst_D0,
	hps_io_hps_io_usb1_inst_D1,
	hps_io_hps_io_usb1_inst_D2,
	hps_io_hps_io_usb1_inst_D3,
	hps_io_hps_io_usb1_inst_D4,
	hps_io_hps_io_usb1_inst_D5,
	hps_io_hps_io_usb1_inst_D6,
	hps_io_hps_io_usb1_inst_D7,
	hps_io_hps_io_usb1_inst_CLK,
	hps_io_hps_io_usb1_inst_STP,
	hps_io_hps_io_usb1_inst_DIR,
	hps_io_hps_io_usb1_inst_NXT,
	hps_io_hps_io_uart0_inst_RX,
	hps_io_hps_io_uart0_inst_TX,
	leds_export,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	
	// iis_mclk,
	iis_bclk,
	iis_lrclk,
	iis_dout
);

	output		hps_io_hps_io_emac1_inst_TX_CLK;
	output		hps_io_hps_io_emac1_inst_TXD0;
	output		hps_io_hps_io_emac1_inst_TXD1;
	output		hps_io_hps_io_emac1_inst_TXD2;
	output		hps_io_hps_io_emac1_inst_TXD3;
	input		hps_io_hps_io_emac1_inst_RXD0;
	inout		hps_io_hps_io_emac1_inst_MDIO;
	output		hps_io_hps_io_emac1_inst_MDC;
	input		hps_io_hps_io_emac1_inst_RX_CTL;
	output		hps_io_hps_io_emac1_inst_TX_CTL;
	input		hps_io_hps_io_emac1_inst_RX_CLK;
	input		hps_io_hps_io_emac1_inst_RXD1;
	input		hps_io_hps_io_emac1_inst_RXD2;
	input		hps_io_hps_io_emac1_inst_RXD3;
	inout		hps_io_hps_io_sdio_inst_CMD;
	inout		hps_io_hps_io_sdio_inst_D0;
	inout		hps_io_hps_io_sdio_inst_D1;
	output		hps_io_hps_io_sdio_inst_CLK;
	inout		hps_io_hps_io_sdio_inst_D2;
	inout		hps_io_hps_io_sdio_inst_D3;
	inout		hps_io_hps_io_usb1_inst_D0;
	inout		hps_io_hps_io_usb1_inst_D1;
	inout		hps_io_hps_io_usb1_inst_D2;
	inout		hps_io_hps_io_usb1_inst_D3;
	inout		hps_io_hps_io_usb1_inst_D4;
	inout		hps_io_hps_io_usb1_inst_D5;
	inout		hps_io_hps_io_usb1_inst_D6;
	inout		hps_io_hps_io_usb1_inst_D7;
	input		hps_io_hps_io_usb1_inst_CLK;
	output		hps_io_hps_io_usb1_inst_STP;
	input		hps_io_hps_io_usb1_inst_DIR;
	input		hps_io_hps_io_usb1_inst_NXT;
	input		hps_io_hps_io_uart0_inst_RX;
	output		hps_io_hps_io_uart0_inst_TX;
	output	[1:0]	leds_export;
	output	[13:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[31:0]	memory_mem_dq;
	inout	[3:0]	memory_mem_dqs;
	inout	[3:0]	memory_mem_dqs_n;
	output		memory_mem_odt;
	output	[3:0]	memory_mem_dm;
	input		memory_oct_rzqin;
	
	// output		iis_mclk;
	inout		iis_bclk;
	inout		iis_lrclk;
	output		iis_dout;
	
	
	(* keep *) 	wire	[63:0]	i2s_output_apb_0_playback_fifo_data;
	(* keep *) 	wire				i2s_output_apb_0_playback_fifo_read;
	(* keep *) 	wire				i2s_output_apb_0_playback_fifo_empty;
	(* keep *) 	wire				i2s_output_apb_0_playback_fifo_full;
	(* keep *) 	wire				i2s_output_apb_0_playback_fifo_clk;
	(* keep *) 	wire				i2s_output_apb_0_playback_dma_enable;
	(* keep *) 	wire				i2s_playback_enable;
	wire	[63:0]	i2s_output_apb_0_capture_fifo_data;
	wire				i2s_output_apb_0_capture_fifo_write;
	wire				i2s_output_apb_0_capture_fifo_empty;
	wire				i2s_output_apb_0_capture_fifo_full;
	wire				i2s_output_apb_0_capture_fifo_clk;
	wire				i2s_output_apb_0_capture_dma_enable;
	wire				i2s_capture_enable;
	wire				i2s_clkctrl_apb_0_ext_bclk;
	wire				i2s_clkctrl_apb_0_ext_playback_lrclk;
	wire				i2s_clkctrl_apb_0_ext_capture_lrclk;
	wire				i2s_clkctrl_apb_0_conduit_master_slave_mode;
	wire				i2s_clkctrl_apb_0_conduit_clk_sel_48_44;
	wire				i2s_clkctrl_apb_0_conduit_bclk;
	wire				i2s_clkctrl_apb_0_conduit_playback_lrclk;
	wire				i2s_clkctrl_apb_0_conduit_capture_lrclk;
	wire				i2s_clkctrl_apb_0_mclk_clk;
	
	(* keep *) 	wire				clock_bridge_0_out_clk_clk;
	(* keep *) 	wire				hps_0_h2f_reset_reset_n;
	(* keep *) 	wire				hps_0_h2f_reset_reset;
	
	(* keep *) 	wire				hps_0_f2h_dma_req0_dma_req;
	(* keep *) 	wire				hps_0_f2h_dma_req0_dma_single;
	(* keep *) 	wire				hps_0_f2h_dma_req0_dma_ack;
	
	wire				hps_0_f2h_dma_req1_dma_req;
	wire				hps_0_f2h_dma_req1_dma_single;
	wire				hps_0_f2h_dma_req1_dma_ack;
	
	wire				clock_bridge_48_out_clk_clk;
	wire				clock_bridge_44_out_clk_clk;
	
	wire				i2s_playback_fifo_ack;
	wire				i2s_capture_fifo_write;
	
    top u0 (
        .hps_io_hps_io_emac1_inst_TX_CLK ( hps_io_hps_io_emac1_inst_TX_CLK ), //   hps_io.hps_io_emac1_inst_TX_CLK
        .hps_io_hps_io_emac1_inst_TXD0   ( hps_io_hps_io_emac1_inst_TXD0 ),   //         .hps_io_emac1_inst_TXD0
        .hps_io_hps_io_emac1_inst_TXD1   ( hps_io_hps_io_emac1_inst_TXD1 ),   //         .hps_io_emac1_inst_TXD1
        .hps_io_hps_io_emac1_inst_TXD2   ( hps_io_hps_io_emac1_inst_TXD2 ),   //         .hps_io_emac1_inst_TXD2
        .hps_io_hps_io_emac1_inst_TXD3   ( hps_io_hps_io_emac1_inst_TXD3 ),   //         .hps_io_emac1_inst_TXD3
        .hps_io_hps_io_emac1_inst_RXD0   ( hps_io_hps_io_emac1_inst_RXD0 ),   //         .hps_io_emac1_inst_RXD0
        .hps_io_hps_io_emac1_inst_MDIO   ( hps_io_hps_io_emac1_inst_MDIO ),   //         .hps_io_emac1_inst_MDIO
        .hps_io_hps_io_emac1_inst_MDC    ( hps_io_hps_io_emac1_inst_MDC ),    //         .hps_io_emac1_inst_MDC
        .hps_io_hps_io_emac1_inst_RX_CTL ( hps_io_hps_io_emac1_inst_RX_CTL ), //         .hps_io_emac1_inst_RX_CTL
        .hps_io_hps_io_emac1_inst_TX_CTL ( hps_io_hps_io_emac1_inst_TX_CTL ), //         .hps_io_emac1_inst_TX_CTL
        .hps_io_hps_io_emac1_inst_RX_CLK ( hps_io_hps_io_emac1_inst_RX_CLK ), //         .hps_io_emac1_inst_RX_CLK
        .hps_io_hps_io_emac1_inst_RXD1   ( hps_io_hps_io_emac1_inst_RXD1 ),   //         .hps_io_emac1_inst_RXD1
        .hps_io_hps_io_emac1_inst_RXD2   ( hps_io_hps_io_emac1_inst_RXD2 ),   //         .hps_io_emac1_inst_RXD2
        .hps_io_hps_io_emac1_inst_RXD3   ( hps_io_hps_io_emac1_inst_RXD3 ),   //         .hps_io_emac1_inst_RXD3
        .hps_io_hps_io_sdio_inst_CMD     ( hps_io_hps_io_sdio_inst_CMD ),     //         .hps_io_sdio_inst_CMD
        .hps_io_hps_io_sdio_inst_D0      ( hps_io_hps_io_sdio_inst_D0 ),      //         .hps_io_sdio_inst_D0
        .hps_io_hps_io_sdio_inst_D1      ( hps_io_hps_io_sdio_inst_D1 ),      //         .hps_io_sdio_inst_D1
        .hps_io_hps_io_sdio_inst_CLK     ( hps_io_hps_io_sdio_inst_CLK ),     //         .hps_io_sdio_inst_CLK
        .hps_io_hps_io_sdio_inst_D2      ( hps_io_hps_io_sdio_inst_D2 ),      //         .hps_io_sdio_inst_D2
        .hps_io_hps_io_sdio_inst_D3      ( hps_io_hps_io_sdio_inst_D3 ),      //         .hps_io_sdio_inst_D3
        .hps_io_hps_io_usb1_inst_D0      ( hps_io_hps_io_usb1_inst_D0 ),      //         .hps_io_usb1_inst_D0
        .hps_io_hps_io_usb1_inst_D1      ( hps_io_hps_io_usb1_inst_D1 ),      //         .hps_io_usb1_inst_D1
        .hps_io_hps_io_usb1_inst_D2      ( hps_io_hps_io_usb1_inst_D2 ),      //         .hps_io_usb1_inst_D2
        .hps_io_hps_io_usb1_inst_D3      ( hps_io_hps_io_usb1_inst_D3 ),      //         .hps_io_usb1_inst_D3
        .hps_io_hps_io_usb1_inst_D4      ( hps_io_hps_io_usb1_inst_D4 ),      //         .hps_io_usb1_inst_D4
        .hps_io_hps_io_usb1_inst_D5      ( hps_io_hps_io_usb1_inst_D5 ),      //         .hps_io_usb1_inst_D5
        .hps_io_hps_io_usb1_inst_D6      ( hps_io_hps_io_usb1_inst_D6 ),      //         .hps_io_usb1_inst_D6
        .hps_io_hps_io_usb1_inst_D7      ( hps_io_hps_io_usb1_inst_D7 ),      //         .hps_io_usb1_inst_D7
        .hps_io_hps_io_usb1_inst_CLK     ( hps_io_hps_io_usb1_inst_CLK ),     //         .hps_io_usb1_inst_CLK
        .hps_io_hps_io_usb1_inst_STP     ( hps_io_hps_io_usb1_inst_STP ),     //         .hps_io_usb1_inst_STP
        .hps_io_hps_io_usb1_inst_DIR     ( hps_io_hps_io_usb1_inst_DIR ),     //         .hps_io_usb1_inst_DIR
        .hps_io_hps_io_usb1_inst_NXT     ( hps_io_hps_io_usb1_inst_NXT ),     //         .hps_io_usb1_inst_NXT
        .hps_io_hps_io_uart0_inst_RX     ( hps_io_hps_io_uart0_inst_RX ),     //         .hps_io_uart0_inst_RX
        .hps_io_hps_io_uart0_inst_TX     ( hps_io_hps_io_uart0_inst_TX ),     //         .hps_io_uart0_inst_TX
		
        .leds_export                     ( leds_export ),                     //     leds.export
		
        .memory_mem_a                    ( memory_mem_a ),                    //   memory.mem_a
        .memory_mem_ba                   ( memory_mem_ba ),                   //         .mem_ba
        .memory_mem_ck                   ( memory_mem_ck ),                   //         .mem_ck
        .memory_mem_ck_n                 ( memory_mem_ck_n ),                 //         .mem_ck_n
        .memory_mem_cke                  ( memory_mem_cke ),                  //         .mem_cke
        .memory_mem_cs_n                 ( memory_mem_cs_n ),                 //         .mem_cs_n
        .memory_mem_ras_n                ( memory_mem_ras_n ),                //         .mem_ras_n
        .memory_mem_cas_n                ( memory_mem_cas_n ),                //         .mem_cas_n
        .memory_mem_we_n                 ( memory_mem_we_n ),                 //         .mem_we_n
        .memory_mem_reset_n              ( memory_mem_reset_n ),              //         .mem_reset_n
        .memory_mem_dq                   ( memory_mem_dq ),                   //         .mem_dq
        .memory_mem_dqs                  ( memory_mem_dqs ),                  //         .mem_dqs
        .memory_mem_dqs_n                ( memory_mem_dqs_n ),                //         .mem_dqs_n
        .memory_mem_odt                  ( memory_mem_odt ),                  //         .mem_odt
        .memory_mem_dm                   ( memory_mem_dm ),                   //         .mem_dm
        .memory_oct_rzqin                ( memory_oct_rzqin ),                //         .oct_rzqin
		
		.hps_0_f2h_dma_req0_dma_req		 ( hps_0_f2h_dma_req0_dma_req ),
		.hps_0_f2h_dma_req0_dma_single	 ( hps_0_f2h_dma_req0_dma_single ),
		.hps_0_f2h_dma_req0_dma_ack		 ( hps_0_f2h_dma_req0_dma_ack ),
		.hps_0_f2h_dma_req1_dma_req		 ( hps_0_f2h_dma_req1_dma_req ),
		.hps_0_f2h_dma_req1_dma_single	 ( hps_0_f2h_dma_req1_dma_single ),
		.hps_0_f2h_dma_req1_dma_ack		 ( hps_0_f2h_dma_req1_dma_ack ),
		
		.i2s_playback_fifo_data		( i2s_output_apb_0_playback_fifo_data	),
		.i2s_playback_fifo_read		( i2s_output_apb_0_playback_fifo_read	),
		.i2s_playback_fifo_empty		( i2s_output_apb_0_playback_fifo_empty	),
		.i2s_playback_fifo_full		( i2s_output_apb_0_playback_fifo_full	),
		.i2s_playback_fifo_clk			( i2s_output_apb_0_playback_fifo_clk	),
		.i2s_playback_dma_req			( hps_0_f2h_dma_req0_dma_single			),
		.i2s_playback_dma_ack			( hps_0_f2h_dma_req0_dma_ack),
		.i2s_playback_dma_enable		( i2s_output_apb_0_playback_dma_enable	),
		.i2s_capture_fifo_data			( i2s_output_apb_0_capture_fifo_data	),
		.i2s_capture_fifo_write		( i2s_output_apb_0_capture_fifo_write	),
		.i2s_capture_fifo_empty		( i2s_output_apb_0_capture_fifo_empty	),
		.i2s_capture_fifo_full			( i2s_output_apb_0_capture_fifo_full	),
		.i2s_capture_fifo_clk			( i2s_output_apb_0_capture_fifo_clk		),
		.i2s_capture_dma_req			( hps_0_f2h_dma_req1_dma_single			),
		.i2s_capture_dma_ack			( hps_0_f2h_dma_req1_dma_ack				),
		.i2s_capture_dma_enable		( i2s_output_apb_0_capture_dma_enable	),

		.i2s_ext_bclk						( i2s_clkctrl_apb_0_ext_bclk				),
		.i2s_ext_playback_lrclk		( i2s_clkctrl_apb_0_ext_playback_lrclk	),
		.i2s_ext_capture_lrclk			( i2s_clkctrl_apb_0_ext_capture_lrclk	),
		.i2s_conduit_master_slave_mode( i2s_clkctrl_apb_0_conduit_master_slave_mode),
		.i2s_conduit_clk_sel_48_44	( i2s_clkctrl_apb_0_conduit_clk_sel_48_44),
		.i2s_conduit_bclk				( i2s_clkctrl_apb_0_conduit_bclk			),
		.i2s_conduit_playback_lrclk	( i2s_clkctrl_apb_0_conduit_playback_lrclk),
		.i2s_conduit_capture_lrclk	( i2s_clkctrl_apb_0_conduit_capture_lrclk),
		.i2s_mclk_clk							( i2s_clkctrl_apb_0_mclk_clk				),
		
        .h2f_clk_clk							( clock_bridge_0_out_clk_clk ),
        .h2f_nrst_reset_n						( hps_0_h2f_reset_reset_n ),
		
        .clk_44k_out_clk_clk					( clock_bridge_44_out_clk_clk ),
        .clk_48k_out_clk_clk					( clock_bridge_48_out_clk_clk )
    );
	
	// assign hps_0_h2f_reset_reset_n = ~hps_0_h2f_reset_reset;
	
	wire i2s_playback_fifo_ack48;
	wire i2s_data_out48;
	i2s_shift_out i2s_shift_out48(
		.reset_n							(hps_0_h2f_reset_reset_n),
		.clk								(clock_bridge_48_out_clk_clk),
		
		.fifo_right_data					(i2s_output_apb_0_playback_fifo_data[63:32]),
		.fifo_left_data						(i2s_output_apb_0_playback_fifo_data[31:0]),
		.fifo_ready							(~i2s_output_apb_0_playback_fifo_empty),
		.fifo_ack							(i2s_playback_fifo_ack48),
  
		.enable								(i2s_playback_enable),
		.bclk								(i2s_clkctrl_apb_0_conduit_bclk),
		.lrclk								(i2s_clkctrl_apb_0_conduit_playback_lrclk),
		.data_out							(i2s_data_out48)
	);
	wire i2s_playback_fifo_ack44;
	wire i2s_data_out44;
	i2s_shift_out i2s_shift_out44(
		.reset_n							(hps_0_h2f_reset_reset_n),
		.clk								(clock_bridge_44_out_clk_clk),
		
		.fifo_right_data					(i2s_output_apb_0_playback_fifo_data[63:32]),
		.fifo_left_data						(i2s_output_apb_0_playback_fifo_data[31:0]),
		.fifo_ready							(~i2s_output_apb_0_playback_fifo_empty),
		.fifo_ack							(i2s_playback_fifo_ack44),
  
		.enable								(i2s_playback_enable),
		.bclk								(i2s_clkctrl_apb_0_conduit_bclk),
		.lrclk								(i2s_clkctrl_apb_0_conduit_playback_lrclk),
		.data_out							(i2s_data_out44)
	);

	wire i2s_capture_fifo_write48;
	wire i2s_data_in48;
	wire [63:0] i2s_capture_fifo_data48;
	i2s_shift_in i2s_shift_in48(
		.reset_n							(hps_0_h2f_reset_reset_n),
		.clk								(clock_bridge_48_out_clk_clk),
		
		.fifo_right_data					(i2s_capture_fifo_data48[63:32]),
		.fifo_left_data						(i2s_capture_fifo_data48[31:0]),
		.fifo_ready							(~i2s_output_apb_0_capture_fifo_full),
		.fifo_write							(i2s_capture_fifo_write48),
  
		.enable								(i2s_capture_enable),
		.bclk								(i2s_clkctrl_apb_0_conduit_bclk),
		.lrclk								(i2s_clkctrl_apb_0_conduit_capture_lrclk),
		.data_in							(i2s_data_in48)
	);
	wire i2s_capture_fifo_write44;
	wire i2s_data_in44;
	wire [63:0] i2s_capture_fifo_data44;
	i2s_shift_in i2s_shift_in44(
		.reset_n							(hps_0_h2f_reset_reset_n),
		.clk								(clock_bridge_44_out_clk_clk),
		
		.fifo_right_data					(i2s_capture_fifo_data44[63:32]),
		.fifo_left_data						(i2s_capture_fifo_data44[31:0]),
		.fifo_ready							(~i2s_output_apb_0_capture_fifo_full),
		.fifo_write							(i2s_capture_fifo_write44),
  
		.enable								(i2s_capture_enable),
		.bclk								(i2s_clkctrl_apb_0_conduit_bclk),
		.lrclk								(i2s_clkctrl_apb_0_conduit_capture_lrclk),
		.data_in							(i2s_data_in44)
	);


	// Combinatorics
	// assign FPGA_AUDIO_MCLK = i2s_clkctrl_apb_0_mclk_clk;
	assign i2s_playback_enable = i2s_output_apb_0_playback_dma_enable & ~i2s_output_apb_0_playback_fifo_empty;
	assign i2s_capture_enable = i2s_output_apb_0_capture_dma_enable & ~i2s_output_apb_0_capture_fifo_full;

	// Mux and sync fifo read ack
	reg [2:0] i2s_playback_fifo_ack_synchro;
	assign i2s_playback_fifo_ack = i2s_clkctrl_apb_0_conduit_clk_sel_48_44 ?
		i2s_playback_fifo_ack44 : i2s_playback_fifo_ack48;
	always @(posedge clock_bridge_0_out_clk_clk or negedge hps_0_h2f_reset_reset_n)
		if (~hps_0_h2f_reset_reset_n)
			i2s_playback_fifo_ack_synchro <= 0;
		else
			i2s_playback_fifo_ack_synchro <= {i2s_playback_fifo_ack_synchro[1:0], i2s_playback_fifo_ack};
	assign i2s_output_apb_0_playback_fifo_read = i2s_playback_fifo_ack_synchro[2] & ~i2s_playback_fifo_ack_synchro[1];
	assign i2s_output_apb_0_playback_fifo_clk = clock_bridge_0_out_clk_clk;

	// Mux and sync fifo write
	reg [2:0] i2s_capture_fifo_write_synchro;
	assign i2s_capture_fifo_write = i2s_clkctrl_apb_0_conduit_clk_sel_48_44 ?
		i2s_capture_fifo_write44 : i2s_capture_fifo_write48;
	always @(posedge clock_bridge_0_out_clk_clk or negedge hps_0_h2f_reset_reset_n)
		if (~hps_0_h2f_reset_reset_n)
			i2s_capture_fifo_write_synchro <= 0;
		else
			i2s_capture_fifo_write_synchro <= {i2s_capture_fifo_write_synchro[1:0], i2s_capture_fifo_write};
	assign i2s_output_apb_0_capture_fifo_write = i2s_capture_fifo_write_synchro[2] & ~i2s_capture_fifo_write_synchro[1];
	assign i2s_output_apb_0_capture_fifo_clk = clock_bridge_0_out_clk_clk;

	// Mux capture data
	assign i2s_output_apb_0_capture_fifo_data = i2s_clkctrl_apb_0_conduit_clk_sel_48_44 ?
		i2s_capture_fifo_data48 : i2s_capture_fifo_data44;

	// Mux out
	assign iis_dout = i2s_clkctrl_apb_0_conduit_clk_sel_48_44 ? i2s_data_out44 : i2s_data_out48;

	// Audio input
	assign i2s_data_in44 = 1'b0;
	assign i2s_data_in48 = 1'b0;
	
	// Audio clocks inouts
	assign iis_bclk = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		i2s_clkctrl_apb_0_conduit_bclk : 1'bZ;
	assign iis_lrclk = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		i2s_clkctrl_apb_0_conduit_playback_lrclk : 1'bZ;
	// assign FPGA_AUDIO_ADCLRCK = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		// i2s_clkctrl_apb_0_conduit_capture_lrclk : 1'bZ;

	assign i2s_clkctrl_apb_0_ext_bclk = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		i2s_clkctrl_apb_0_conduit_bclk : iis_bclk;
	assign i2s_clkctrl_apb_0_ext_playback_lrclk = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		i2s_clkctrl_apb_0_conduit_playback_lrclk : iis_lrclk;
	assign i2s_clkctrl_apb_0_ext_capture_lrclk = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		i2s_clkctrl_apb_0_conduit_capture_lrclk : iis_lrclk;
	
	
endmodule
