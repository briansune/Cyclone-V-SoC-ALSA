`timescale 1ns/1ns

module c5_soc_top(
	
	inout wire			iis_in_din,
	inout wire			iis_in_bclk,
	inout wire			iis_in_lrclk,
	
	inout wire			iis_bclk,
	inout wire			iis_lrclk,
	output wire			iis_dout,
	
	output wire        hps_io_emac1_inst_TX_CLK, //            hps_io.hps_io_emac1_inst_TX_CLK
	output wire        hps_io_emac1_inst_TXD0,   //                  .hps_io_emac1_inst_TXD0
	output wire        hps_io_emac1_inst_TXD1,   //                  .hps_io_emac1_inst_TXD1
	output wire        hps_io_emac1_inst_TXD2,   //                  .hps_io_emac1_inst_TXD2
	output wire        hps_io_emac1_inst_TXD3,   //                  .hps_io_emac1_inst_TXD3
	input  wire        hps_io_emac1_inst_RXD0,   //                  .hps_io_emac1_inst_RXD0
	inout  wire        hps_io_emac1_inst_MDIO,   //                  .hps_io_emac1_inst_MDIO
	output wire        hps_io_emac1_inst_MDC,    //                  .hps_io_emac1_inst_MDC
	input  wire        hps_io_emac1_inst_RX_CTL, //                  .hps_io_emac1_inst_RX_CTL
	output wire        hps_io_emac1_inst_TX_CTL, //                  .hps_io_emac1_inst_TX_CTL
	input  wire        hps_io_emac1_inst_RX_CLK, //                  .hps_io_emac1_inst_RX_CLK
	input  wire        hps_io_emac1_inst_RXD1,   //                  .hps_io_emac1_inst_RXD1
	input  wire        hps_io_emac1_inst_RXD2,   //                  .hps_io_emac1_inst_RXD2
	input  wire        hps_io_emac1_inst_RXD3,   //                  .hps_io_emac1_inst_RXD3
	inout  wire        hps_io_qspi_inst_IO0,     //                  .hps_io_qspi_inst_IO0
	inout  wire        hps_io_qspi_inst_IO1,     //                  .hps_io_qspi_inst_IO1
	inout  wire        hps_io_qspi_inst_IO2,     //                  .hps_io_qspi_inst_IO2
	inout  wire        hps_io_qspi_inst_IO3,     //                  .hps_io_qspi_inst_IO3
	output wire        hps_io_qspi_inst_SS0,     //                  .hps_io_qspi_inst_SS0
	output wire        hps_io_qspi_inst_CLK,     //                  .hps_io_qspi_inst_CLK
	inout  wire        hps_io_sdio_inst_CMD,     //                  .hps_io_sdio_inst_CMD
	output wire        hps_io_sdio_inst_PWREN,   //                  .hps_io_sdio_inst_PWREN
	inout  wire        hps_io_sdio_inst_D0,      //                  .hps_io_sdio_inst_D0
	inout  wire        hps_io_sdio_inst_D1,      //                  .hps_io_sdio_inst_D1
	output wire        hps_io_sdio_inst_CLK,     //                  .hps_io_sdio_inst_CLK
	inout  wire        hps_io_sdio_inst_D2,      //                  .hps_io_sdio_inst_D2
	inout  wire        hps_io_sdio_inst_D3,      //                  .hps_io_sdio_inst_D3
	inout  wire        hps_io_usb1_inst_D0,      //                  .hps_io_usb1_inst_D0
	inout  wire        hps_io_usb1_inst_D1,      //                  .hps_io_usb1_inst_D1
	inout  wire        hps_io_usb1_inst_D2,      //                  .hps_io_usb1_inst_D2
	inout  wire        hps_io_usb1_inst_D3,      //                  .hps_io_usb1_inst_D3
	inout  wire        hps_io_usb1_inst_D4,      //                  .hps_io_usb1_inst_D4
	inout  wire        hps_io_usb1_inst_D5,      //                  .hps_io_usb1_inst_D5
	inout  wire        hps_io_usb1_inst_D6,      //                  .hps_io_usb1_inst_D6
	inout  wire        hps_io_usb1_inst_D7,      //                  .hps_io_usb1_inst_D7
	input  wire        hps_io_usb1_inst_CLK,     //                  .hps_io_usb1_inst_CLK
	output wire        hps_io_usb1_inst_STP,     //                  .hps_io_usb1_inst_STP
	input  wire        hps_io_usb1_inst_DIR,     //                  .hps_io_usb1_inst_DIR
	input  wire        hps_io_usb1_inst_NXT,     //                  .hps_io_usb1_inst_NXT
	output wire        hps_io_spim0_inst_CLK,    //                  .hps_io_spim0_inst_CLK
	output wire        hps_io_spim0_inst_MOSI,   //                  .hps_io_spim0_inst_MOSI
	input  wire        hps_io_spim0_inst_MISO,   //                  .hps_io_spim0_inst_MISO
	output wire        hps_io_spim0_inst_SS0,    //                  .hps_io_spim0_inst_SS0
	input  wire        hps_io_uart0_inst_RX,     //                  .hps_io_uart0_inst_RX
	output wire        hps_io_uart0_inst_TX,     //                  .hps_io_uart0_inst_TX
	input  wire        hps_io_uart1_inst_RX,     //                  .hps_io_uart1_inst_RX
	output wire        hps_io_uart1_inst_TX,     //                  .hps_io_uart1_inst_TX
	inout  wire        hps_io_i2c0_inst_SDA,     //                  .hps_io_i2c0_inst_SDA
	inout  wire        hps_io_i2c0_inst_SCL,     //                  .hps_io_i2c0_inst_SCL
	inout  wire        hps_io_i2c1_inst_SDA,     //                  .hps_io_i2c1_inst_SDA
	inout  wire        hps_io_i2c1_inst_SCL,     //                  .hps_io_i2c1_inst_SCL
	input  wire        hps_io_can0_inst_RX,      //                  .hps_io_can0_inst_RX
	output wire        hps_io_can0_inst_TX,      //                  .hps_io_can0_inst_TX
	input  wire        hps_io_can1_inst_RX,      //                  .hps_io_can1_inst_RX
	output wire        hps_io_can1_inst_TX,      //                  .hps_io_can1_inst_TX
	inout  wire        hps_io_gpio_inst_GPIO00,  //                  .hps_io_gpio_inst_GPIO00
	inout  wire        hps_io_gpio_inst_GPIO09,  //                  .hps_io_gpio_inst_GPIO09
	inout  wire        hps_io_gpio_inst_GPIO28,  //                  .hps_io_gpio_inst_GPIO28
	inout  wire        hps_io_gpio_inst_GPIO44,  //                  .hps_io_gpio_inst_GPIO44
	inout  wire        hps_io_gpio_inst_GPIO48,  //                  .hps_io_gpio_inst_GPIO48
	inout  wire        hps_io_gpio_inst_GPIO65,  //                  .hps_io_gpio_inst_GPIO65
	inout  wire        hps_io_gpio_inst_GPIO66,  //                  .hps_io_gpio_inst_GPIO66
	output wire [15:0] mem_a,                    //            memory.mem_a
	output wire [2:0]  mem_ba,                   //                  .mem_ba
	output wire        mem_ck,                   //                  .mem_ck
	output wire        mem_ck_n,                 //                  .mem_ck_n
	output wire        mem_cke,                  //                  .mem_cke
	output wire        mem_cs_n,                 //                  .mem_cs_n
	output wire        mem_ras_n,                //                  .mem_ras_n
	output wire        mem_cas_n,                //                  .mem_cas_n
	output wire        mem_we_n,                 //                  .mem_we_n
	output wire        mem_reset_n,              //                  .mem_reset_n
	inout  wire [31:0] mem_dq,                   //                  .mem_dq
	inout  wire [3:0]  mem_dqs,                  //                  .mem_dqs
	inout  wire [3:0]  mem_dqs_n,                //                  .mem_dqs_n
	output wire        mem_odt,                  //                  .mem_odt
	output wire [3:0]  mem_dm,                   //                  .mem_dm
	input  wire        oct_rzqin                 //                  .oct_rzqin
);
	
	wire        hps_0_i2c2_out_data;      //        hps_0_i2c2.out_data
	wire        hps_0_i2c2_sda;           //                  .sda
	wire        hps_0_i2c2_clk_clk;       //    hps_0_i2c2_clk.clk
	wire        hps_0_i2c2_scl_in_clk;    // hps_0_i2c2_scl_in.clk
	
	wire		axi3_clk;
	
	wire		h2f_nrst;
	wire		h2f_clk0;
	
	wire         aclk_44k;
	wire         aclk_48k;
	
	wire				hps_0_f2h_dma_req0_dma_req;
	wire				hps_0_f2h_dma_req0_dma_single;
	wire				hps_0_f2h_dma_req0_dma_ack;
	
	wire				hps_0_f2h_dma_req1_dma_req;
	wire				hps_0_f2h_dma_req1_dma_single;
	wire				hps_0_f2h_dma_req1_dma_ack;
	
	wire	[63:0]		i2s_output_apb_0_playback_fifo_data;
	wire				i2s_output_apb_0_playback_fifo_read;
	wire				i2s_output_apb_0_playback_fifo_empty;
	wire				i2s_output_apb_0_playback_fifo_full;
	wire				i2s_output_apb_0_playback_fifo_clk;
	wire				i2s_output_apb_0_playback_dma_enable;
	wire				i2s_playback_enable;
	
	wire	[63:0]		i2s_output_apb_0_capture_fifo_data;
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
	
	ddr3_5128x4 u0 (
		.hps_io_hps_io_emac1_inst_TX_CLK ( hps_io_emac1_inst_TX_CLK ), //            hps_io.hps_io_emac1_inst_TX_CLK
		.hps_io_hps_io_emac1_inst_TXD0   ( hps_io_emac1_inst_TXD0 ),   //                  .hps_io_emac1_inst_TXD0
		.hps_io_hps_io_emac1_inst_TXD1   ( hps_io_emac1_inst_TXD1 ),   //                  .hps_io_emac1_inst_TXD1
		.hps_io_hps_io_emac1_inst_TXD2   ( hps_io_emac1_inst_TXD2 ),   //                  .hps_io_emac1_inst_TXD2
		.hps_io_hps_io_emac1_inst_TXD3   ( hps_io_emac1_inst_TXD3 ),   //                  .hps_io_emac1_inst_TXD3
		.hps_io_hps_io_emac1_inst_RXD0   ( hps_io_emac1_inst_RXD0 ),   //                  .hps_io_emac1_inst_RXD0
		.hps_io_hps_io_emac1_inst_MDIO   ( hps_io_emac1_inst_MDIO ),   //                  .hps_io_emac1_inst_MDIO
		.hps_io_hps_io_emac1_inst_MDC    ( hps_io_emac1_inst_MDC ),    //                  .hps_io_emac1_inst_MDC
		.hps_io_hps_io_emac1_inst_RX_CTL ( hps_io_emac1_inst_RX_CTL ), //                  .hps_io_emac1_inst_RX_CTL
		.hps_io_hps_io_emac1_inst_TX_CTL ( hps_io_emac1_inst_TX_CTL ), //                  .hps_io_emac1_inst_TX_CTL
		.hps_io_hps_io_emac1_inst_RX_CLK ( hps_io_emac1_inst_RX_CLK ), //                  .hps_io_emac1_inst_RX_CLK
		.hps_io_hps_io_emac1_inst_RXD1   ( hps_io_emac1_inst_RXD1 ),   //                  .hps_io_emac1_inst_RXD1
		.hps_io_hps_io_emac1_inst_RXD2   ( hps_io_emac1_inst_RXD2 ),   //                  .hps_io_emac1_inst_RXD2
		.hps_io_hps_io_emac1_inst_RXD3   ( hps_io_emac1_inst_RXD3 ),   //                  .hps_io_emac1_inst_RXD3
		.hps_io_hps_io_qspi_inst_IO0     ( hps_io_qspi_inst_IO0 ),     //                  .hps_io_qspi_inst_IO0
		.hps_io_hps_io_qspi_inst_IO1     ( hps_io_qspi_inst_IO1 ),     //                  .hps_io_qspi_inst_IO1
		.hps_io_hps_io_qspi_inst_IO2     ( hps_io_qspi_inst_IO2 ),     //                  .hps_io_qspi_inst_IO2
		.hps_io_hps_io_qspi_inst_IO3     ( hps_io_qspi_inst_IO3 ),     //                  .hps_io_qspi_inst_IO3
		.hps_io_hps_io_qspi_inst_SS0     ( hps_io_qspi_inst_SS0 ),     //                  .hps_io_qspi_inst_SS0
		.hps_io_hps_io_qspi_inst_CLK     ( hps_io_qspi_inst_CLK ),     //                  .hps_io_qspi_inst_CLK
		.hps_io_hps_io_sdio_inst_CMD     ( hps_io_sdio_inst_CMD ),     //                  .hps_io_sdio_inst_CMD
		.hps_io_hps_io_sdio_inst_PWREN   ( hps_io_sdio_inst_PWREN ),   //                  .hps_io_sdio_inst_PWREN
		.hps_io_hps_io_sdio_inst_D0      ( hps_io_sdio_inst_D0 ),      //                  .hps_io_sdio_inst_D0
		.hps_io_hps_io_sdio_inst_D1      ( hps_io_sdio_inst_D1 ),      //                  .hps_io_sdio_inst_D1
		.hps_io_hps_io_sdio_inst_CLK     ( hps_io_sdio_inst_CLK ),     //                  .hps_io_sdio_inst_CLK
		.hps_io_hps_io_sdio_inst_D2      ( hps_io_sdio_inst_D2 ),      //                  .hps_io_sdio_inst_D2
		.hps_io_hps_io_sdio_inst_D3      ( hps_io_sdio_inst_D3 ),      //                  .hps_io_sdio_inst_D3
		.hps_io_hps_io_usb1_inst_D0      ( hps_io_usb1_inst_D0 ),      //                  .hps_io_usb1_inst_D0
		.hps_io_hps_io_usb1_inst_D1      ( hps_io_usb1_inst_D1 ),      //                  .hps_io_usb1_inst_D1
		.hps_io_hps_io_usb1_inst_D2      ( hps_io_usb1_inst_D2 ),      //                  .hps_io_usb1_inst_D2
		.hps_io_hps_io_usb1_inst_D3      ( hps_io_usb1_inst_D3 ),      //                  .hps_io_usb1_inst_D3
		.hps_io_hps_io_usb1_inst_D4      ( hps_io_usb1_inst_D4 ),      //                  .hps_io_usb1_inst_D4
		.hps_io_hps_io_usb1_inst_D5      ( hps_io_usb1_inst_D5 ),      //                  .hps_io_usb1_inst_D5
		.hps_io_hps_io_usb1_inst_D6      ( hps_io_usb1_inst_D6 ),      //                  .hps_io_usb1_inst_D6
		.hps_io_hps_io_usb1_inst_D7      ( hps_io_usb1_inst_D7 ),      //                  .hps_io_usb1_inst_D7
		.hps_io_hps_io_usb1_inst_CLK     ( hps_io_usb1_inst_CLK ),     //                  .hps_io_usb1_inst_CLK
		.hps_io_hps_io_usb1_inst_STP     ( hps_io_usb1_inst_STP ),     //                  .hps_io_usb1_inst_STP
		.hps_io_hps_io_usb1_inst_DIR     ( hps_io_usb1_inst_DIR ),     //                  .hps_io_usb1_inst_DIR
		.hps_io_hps_io_usb1_inst_NXT     ( hps_io_usb1_inst_NXT ),     //                  .hps_io_usb1_inst_NXT
		.hps_io_hps_io_spim0_inst_CLK    ( hps_io_spim0_inst_CLK ),    //                  .hps_io_spim0_inst_CLK
		.hps_io_hps_io_spim0_inst_MOSI   ( hps_io_spim0_inst_MOSI ),   //                  .hps_io_spim0_inst_MOSI
		.hps_io_hps_io_spim0_inst_MISO   ( hps_io_spim0_inst_MISO ),   //                  .hps_io_spim0_inst_MISO
		.hps_io_hps_io_spim0_inst_SS0    ( hps_io_spim0_inst_SS0 ),    //                  .hps_io_spim0_inst_SS0
		.hps_io_hps_io_uart0_inst_RX     ( hps_io_uart0_inst_RX ),     //                  .hps_io_uart0_inst_RX
		.hps_io_hps_io_uart0_inst_TX     ( hps_io_uart0_inst_TX ),     //                  .hps_io_uart0_inst_TX
		.hps_io_hps_io_uart1_inst_RX     ( hps_io_uart1_inst_RX ),     //                  .hps_io_uart1_inst_RX
		.hps_io_hps_io_uart1_inst_TX     ( hps_io_uart1_inst_TX ),     //                  .hps_io_uart1_inst_TX
		.hps_io_hps_io_i2c0_inst_SDA     ( hps_io_i2c0_inst_SDA ),     //                  .hps_io_i2c0_inst_SDA
		.hps_io_hps_io_i2c0_inst_SCL     ( hps_io_i2c0_inst_SCL ),     //                  .hps_io_i2c0_inst_SCL
		.hps_io_hps_io_i2c1_inst_SDA     ( hps_io_i2c1_inst_SDA ),     //                  .hps_io_i2c1_inst_SDA
		.hps_io_hps_io_i2c1_inst_SCL     ( hps_io_i2c1_inst_SCL ),     //                  .hps_io_i2c1_inst_SCL
		.hps_io_hps_io_can0_inst_RX      ( hps_io_can0_inst_RX ),      //                  .hps_io_can0_inst_RX
		.hps_io_hps_io_can0_inst_TX      ( hps_io_can0_inst_TX ),      //                  .hps_io_can0_inst_TX
		.hps_io_hps_io_can1_inst_RX      ( hps_io_can1_inst_RX ),      //                  .hps_io_can1_inst_RX
		.hps_io_hps_io_can1_inst_TX      ( hps_io_can1_inst_TX ),      //                  .hps_io_can1_inst_TX
		.hps_io_hps_io_gpio_inst_GPIO00  ( hps_io_gpio_inst_GPIO00 ),  //                  .hps_io_gpio_inst_GPIO00
		.hps_io_hps_io_gpio_inst_GPIO09  ( hps_io_gpio_inst_GPIO09 ),  //                  .hps_io_gpio_inst_GPIO09
		.hps_io_hps_io_gpio_inst_GPIO28  ( hps_io_gpio_inst_GPIO28 ),  //                  .hps_io_gpio_inst_GPIO28
		.hps_io_hps_io_gpio_inst_GPIO44  ( hps_io_gpio_inst_GPIO44 ),  //                  .hps_io_gpio_inst_GPIO44
		.hps_io_hps_io_gpio_inst_GPIO48  ( hps_io_gpio_inst_GPIO48 ),  //                  .hps_io_gpio_inst_GPIO48
		.hps_io_hps_io_gpio_inst_GPIO65  ( hps_io_gpio_inst_GPIO65 ),  //                  .hps_io_gpio_inst_GPIO65
		.hps_io_hps_io_gpio_inst_GPIO66  ( hps_io_gpio_inst_GPIO66 ),  //                  .hps_io_gpio_inst_GPIO66
		.memory_mem_a                    ( mem_a ),                    //            memory.mem_a
		.memory_mem_ba                   ( mem_ba ),                   //                  .mem_ba
		.memory_mem_ck                   ( mem_ck ),                   //                  .mem_ck
		.memory_mem_ck_n                 ( mem_ck_n ),                 //                  .mem_ck_n
		.memory_mem_cke                  ( mem_cke ),                  //                  .mem_cke
		.memory_mem_cs_n                 ( mem_cs_n ),                 //                  .mem_cs_n
		.memory_mem_ras_n                ( mem_ras_n ),                //                  .mem_ras_n
		.memory_mem_cas_n                ( mem_cas_n ),                //                  .mem_cas_n
		.memory_mem_we_n                 ( mem_we_n ),                 //                  .mem_we_n
		.memory_mem_reset_n              ( mem_reset_n ),              //                  .mem_reset_n
		.memory_mem_dq                   ( mem_dq ),                   //                  .mem_dq
		.memory_mem_dqs                  ( mem_dqs ),                  //                  .mem_dqs
		.memory_mem_dqs_n                ( mem_dqs_n ),                //                  .mem_dqs_n
		.memory_mem_odt                  ( mem_odt ),                  //                  .mem_odt
		.memory_mem_dm                   ( mem_dm ),                   //                  .mem_dm
		.memory_oct_rzqin                ( oct_rzqin ),                //                  .oct_rzqin
		.hps_0_i2c2_scl_in_clk    ( hps_0_i2c2_scl_in_clk ),    // hps_0_i2c2_scl_in.clk
		.hps_0_i2c2_clk_clk       ( hps_0_i2c2_clk_clk ),       //    hps_0_i2c2_clk.clk
		.hps_0_i2c2_out_data      ( hps_0_i2c2_out_data ),      //        hps_0_i2c2.out_data
		.hps_0_i2c2_sda           ( hps_0_i2c2_sda ),           //                  .sda
		
		.h2f_clk0_clk             ( h2f_clk0 ),              //    h2f_clk0.clk
		.h2f_nrst_reset_n         ( h2f_nrst ),         //    h2f_nrst.reset_n
		
		.clk44_clk								( aclk_44k ),
		.clk48_clk								( aclk_48k ),
		
		.hps_0_f2h_dma_req0_dma_req		 			( hps_0_f2h_dma_req0_dma_req ),
		.hps_0_f2h_dma_req0_dma_single	 			( hps_0_f2h_dma_req0_dma_single ),
		.hps_0_f2h_dma_req0_dma_ack		 			( hps_0_f2h_dma_req0_dma_ack ),
		.hps_0_f2h_dma_req1_dma_req		 			( hps_0_f2h_dma_req1_dma_req ),
		.hps_0_f2h_dma_req1_dma_single	 			( hps_0_f2h_dma_req1_dma_single ),
		.hps_0_f2h_dma_req1_dma_ack		 			( hps_0_f2h_dma_req1_dma_ack ),
		
		.i2s_playback_fifo_data					( i2s_output_apb_0_playback_fifo_data	),
		.i2s_playback_fifo_read					( i2s_output_apb_0_playback_fifo_read	),
		.i2s_playback_fifo_empty				( i2s_output_apb_0_playback_fifo_empty	),
		.i2s_playback_fifo_full					( i2s_output_apb_0_playback_fifo_full	),
		.i2s_playback_fifo_clk					( i2s_output_apb_0_playback_fifo_clk	),
		.i2s_playback_dma_req					( hps_0_f2h_dma_req0_dma_single			),
		.i2s_playback_dma_ack					( hps_0_f2h_dma_req0_dma_ack),
		.i2s_playback_dma_enable				( i2s_output_apb_0_playback_dma_enable	),
		.i2s_capture_fifo_data					( i2s_output_apb_0_capture_fifo_data	),
		.i2s_capture_fifo_write					( i2s_output_apb_0_capture_fifo_write	),
		.i2s_capture_fifo_empty					( i2s_output_apb_0_capture_fifo_empty	),
		.i2s_capture_fifo_full					( i2s_output_apb_0_capture_fifo_full	),
		.i2s_capture_fifo_clk					( i2s_output_apb_0_capture_fifo_clk		),
		.i2s_capture_dma_req					( hps_0_f2h_dma_req1_dma_single			),
		.i2s_capture_dma_ack					( hps_0_f2h_dma_req1_dma_ack				),
		.i2s_capture_dma_enable					( i2s_output_apb_0_capture_dma_enable	),

		.i2s_ext_bclk							( i2s_clkctrl_apb_0_ext_bclk				),
		.i2s_ext_playback_lrclk					( i2s_clkctrl_apb_0_ext_playback_lrclk	),
		.i2s_ext_capture_lrclk					( i2s_clkctrl_apb_0_ext_capture_lrclk	),
		.i2s_conduit_master_slave_mode			( i2s_clkctrl_apb_0_conduit_master_slave_mode),
		.i2s_conduit_clk_sel_48_44				( i2s_clkctrl_apb_0_conduit_clk_sel_48_44),
		.i2s_conduit_bclk						( i2s_clkctrl_apb_0_conduit_bclk			),
		.i2s_conduit_playback_lrclk				( i2s_clkctrl_apb_0_conduit_playback_lrclk),
		.i2s_conduit_capture_lrclk				( i2s_clkctrl_apb_0_conduit_capture_lrclk),
		.i2s_mclk_clk							( i2s_clkctrl_apb_0_mclk_clk				)
		
	);
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	wire				i2s_playback_fifo_ack;
	wire				i2s_capture_fifo_write;
	
	wire i2s_playback_fifo_ack48;
	wire i2s_data_out48;
	
	i2s_shift_out i2s_shift_out48(
		.reset_n							(h2f_nrst),
		.f2h_clk							(h2f_clk0),
		.clk								(aclk_48k),
		
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
		.reset_n							(h2f_nrst),
		.f2h_clk							(h2f_clk0),
		.clk								(aclk_44k),
		
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
		.reset_n							(h2f_nrst),
		.f2h_clk							(h2f_clk0),
		.clk								(aclk_48k),
		
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
		.reset_n							(h2f_nrst),
		.f2h_clk							(h2f_clk0),
		.clk								(aclk_44k),
		
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
	// assign iis_mclk = i2s_clkctrl_apb_0_mclk_clk;
	assign i2s_playback_enable = i2s_output_apb_0_playback_dma_enable & ~i2s_output_apb_0_playback_fifo_empty;
	assign i2s_capture_enable = i2s_output_apb_0_capture_dma_enable & ~i2s_output_apb_0_capture_fifo_full;
	
	// Mux and sync fifo read ack
	assign i2s_playback_fifo_ack = i2s_clkctrl_apb_0_conduit_clk_sel_48_44 ?
		i2s_playback_fifo_ack44 : i2s_playback_fifo_ack48;
	
	reg i2s_playback_fifo_ack_synchro;
	
	always @(posedge h2f_clk0 or negedge h2f_nrst) begin
		if (~h2f_nrst) i2s_playback_fifo_ack_synchro <= 0;
		else i2s_playback_fifo_ack_synchro <= i2s_playback_fifo_ack;
	end
	
	assign i2s_output_apb_0_playback_fifo_read = i2s_playback_fifo_ack_synchro & ~i2s_playback_fifo_ack;
	assign i2s_output_apb_0_playback_fifo_clk = h2f_clk0;

	// Mux and sync fifo write
	assign i2s_capture_fifo_write = i2s_clkctrl_apb_0_conduit_clk_sel_48_44 ?
		i2s_capture_fifo_write44 : i2s_capture_fifo_write48;
	
	reg i2s_capture_fifo_write_synchro;
	
	always @(posedge h2f_clk0 or negedge h2f_nrst) begin
		if (~h2f_nrst) i2s_capture_fifo_write_synchro <= 0;
		else i2s_capture_fifo_write_synchro <= i2s_capture_fifo_write;
	end
	
	assign i2s_output_apb_0_capture_fifo_write = i2s_capture_fifo_write_synchro & ~i2s_capture_fifo_write;
	
	assign i2s_output_apb_0_capture_fifo_clk = h2f_clk0;

	// Mux capture data
	assign i2s_output_apb_0_capture_fifo_data = i2s_clkctrl_apb_0_conduit_clk_sel_48_44 ?
		i2s_capture_fifo_data44 : i2s_capture_fifo_data48;
	
	// Mux out
	assign iis_dout = i2s_clkctrl_apb_0_conduit_clk_sel_48_44 ? i2s_data_out44 : i2s_data_out48;

	// Audio input
	assign i2s_data_in44 = iis_in_din;
	assign i2s_data_in48 = iis_in_din;
	
	// =============================================================================================
	// Audio clocks inouts
	// =============================================================================================
	assign iis_bclk = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		i2s_clkctrl_apb_0_conduit_bclk : 1'bZ;
	assign iis_lrclk = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		i2s_clkctrl_apb_0_conduit_playback_lrclk : 1'bZ;
	// =============================================================================================
	assign iis_in_bclk = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		i2s_clkctrl_apb_0_conduit_bclk : 1'bZ;
	assign iis_in_lrclk = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		i2s_clkctrl_apb_0_conduit_capture_lrclk : 1'bZ;
	// =============================================================================================
	assign i2s_clkctrl_apb_0_ext_bclk = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		i2s_clkctrl_apb_0_conduit_bclk : iis_bclk;
	assign i2s_clkctrl_apb_0_ext_playback_lrclk = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		i2s_clkctrl_apb_0_conduit_playback_lrclk : iis_lrclk;
	assign i2s_clkctrl_apb_0_ext_capture_lrclk = i2s_clkctrl_apb_0_conduit_master_slave_mode ?
		i2s_clkctrl_apb_0_conduit_capture_lrclk : iis_lrclk;
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
endmodule
