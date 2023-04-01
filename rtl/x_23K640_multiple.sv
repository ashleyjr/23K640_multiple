module x_23K640_multiple(
   input    logic          i_clk,
   input    logic          i_rst,
   // Application side - Requests 
   input    logic          i_valid,
   output   logic          o_accept,
   input    logic          i_rd_n_wr,
   input    logic [15:0]   i_addr,
   input    logic [7:0]    i_wdata,
   // Application side - Completions
   output   logic          o_ready,
   output   logic [7:0]    o_rdata,
   // SPI SRAM side - SCK
   output   logic          o_sck,
   // SPI SRAM side - 0
   output   logic          o_cs_0,
   output   logic          o_so_0,
   input    logic          i_si_0,
   // SPI SRAM side - 1
   output   logic          o_cs_1,
   output   logic          o_so_1,
   input    logic          i_si_1,
   // SPI SRAM side - 2
   output   logic          o_cs_2,
   output   logic          o_so_2,
   input    logic          i_si_2,
   // SPI SRAM side - 3
   output   logic          o_cs_3,
   output   logic          o_so_3,
   input    logic          i_si_3,
   // SPI SRAM side - 4
   output   logic          o_cs_4,
   output   logic          o_so_4,
   input    logic          i_si_4,
   // SPI SRAM side - 5
   output   logic          o_cs_5,
   output   logic          o_so_5,
   input    logic          i_si_5,
   // SPI SRAM side - 6
   output   logic          o_cs_6,
   output   logic          o_so_6,
   input    logic          i_si_6,
   // SPI SRAM side - 7
   output   logic          o_cs_7,
   output   logic          o_so_7,
   input    logic          i_si_7
);
   logic advance;

   x_23K640_sck u_s(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .o_advance  (advance    ),
      .o_sck      (o_sck      )
   );
   
   x_23K640_data u_d_0(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (),
      .o_accept   (),
      .i_rd_n_wr  (),
      .i_addr     (),
      .i_wdata    (),
      .o_ready    (),
      .o_rdata    (),   
      .o_cs       (o_cs_0     ),
      .o_so       (o_so_0     ),
      .i_si       (i_si_0     )
   );

   x_23K640_data u_d_1(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (),
      .o_accept   (),
      .i_rd_n_wr  (),
      .i_addr     (),
      .i_wdata    (),
      .o_ready    (),
      .o_rdata    (),   
      .o_cs       (o_cs_1     ),
      .o_so       (o_so_1     ),
      .i_si       (i_si_1     )
   );

   x_23K640_data u_d_2(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (),
      .o_accept   (),
      .i_rd_n_wr  (),
      .i_addr     (),
      .i_wdata    (),
      .o_ready    (),
      .o_rdata    (),   
      .o_cs       (o_cs_2     ),
      .o_so       (o_so_2     ),
      .i_si       (i_si_2     )
   );

   x_23K640_data u_d_3(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (),
      .o_accept   (),
      .i_rd_n_wr  (),
      .i_addr     (),
      .i_wdata    (),
      .o_ready    (),
      .o_rdata    (),   
      .o_cs       (o_cs_3     ),
      .o_so       (o_so_3     ),
      .i_si       (i_si_3     )
   );

   x_23K640_data u_d_4(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (),
      .o_accept   (),
      .i_rd_n_wr  (),
      .i_addr     (),
      .i_wdata    (),
      .o_ready    (),
      .o_rdata    (),   
      .o_cs       (o_cs_4     ),
      .o_so       (o_so_4     ),
      .i_si       (i_si_4     )
   );

   x_23K640_data u_d_5(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (),
      .o_accept   (),
      .i_rd_n_wr  (),
      .i_addr     (),
      .i_wdata    (),
      .o_ready    (),
      .o_rdata    (),   
      .o_cs       (o_cs_5     ),
      .o_so       (o_so_5     ),
      .i_si       (i_si_5     )
   );

   x_23K640_data u_d_6(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (),
      .o_accept   (),
      .i_rd_n_wr  (),
      .i_addr     (),
      .i_wdata    (),
      .o_ready    (),
      .o_rdata    (),   
      .o_cs       (o_cs_6     ),
      .o_so       (o_so_6     ),
      .i_si       (i_si_6     )
   );

   x_23K640_data u_d_7(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (),
      .o_accept   (),
      .i_rd_n_wr  (),
      .i_addr     (),
      .i_wdata    (),
      .o_ready    (),
      .o_rdata    (),   
      .o_cs       (o_cs_7     ),
      .o_so       (o_so_7     ),
      .i_si       (i_si_7     )
   );

endmodule
