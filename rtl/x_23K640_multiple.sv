module x_23K640_multiple(
   input    logic          i_clk,
   input    logic          i_rst,
   // Application side - Requests 
   input    logic          i_valid,
   output   logic          o_accept,
   input    logic          i_rd_n_wr,
   input    logic [18:0]   i_addr,
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
   
   logic          advance;

   logic          s0_valid; 
   logic          s0_accept; 
   logic          s0_rd_n_wr;
   logic [15:0]   s0_addr;   
   logic [7:0]    s0_wdata;  
   logic          s0_ready;  
   logic [7:0]    s0_rdata;  

   logic          s1_valid; 
   logic          s1_accept; 
   logic          s1_rd_n_wr;
   logic [15:0]   s1_addr;   
   logic [7:0]    s1_wdata;  
   logic          s1_ready;  
   logic [7:0]    s1_rdata;  

   logic          s2_valid; 
   logic          s2_accept; 
   logic          s2_rd_n_wr;
   logic [15:0]   s2_addr;   
   logic [7:0]    s2_wdata;  
   logic          s2_ready;  
   logic [7:0]    s2_rdata;  

   logic          s3_valid; 
   logic          s3_accept; 
   logic          s3_rd_n_wr;
   logic [15:0]   s3_addr;   
   logic [7:0]    s3_wdata;  
   logic          s3_ready;  
   logic [7:0]    s3_rdata;  

   logic          s4_valid; 
   logic          s4_accept; 
   logic          s4_rd_n_wr;
   logic [15:0]   s4_addr;   
   logic [7:0]    s4_wdata;  
   logic          s4_ready;  
   logic [7:0]    s4_rdata;  

   logic          s5_valid; 
   logic          s5_accept; 
   logic          s5_rd_n_wr;
   logic [15:0]   s5_addr;   
   logic [7:0]    s5_wdata;  
   logic          s5_ready;  
   logic [7:0]    s5_rdata;  

   logic          s6_valid; 
   logic          s6_accept; 
   logic          s6_rd_n_wr;
   logic [15:0]   s6_addr;   
   logic [7:0]    s6_wdata;  
   logic          s6_ready;  
   logic [7:0]    s6_rdata;  

   logic          s7_valid; 
   logic          s7_accept; 
   logic          s7_rd_n_wr;
   logic [15:0]   s7_addr;   
   logic [7:0]    s7_wdata;  
   logic          s7_ready;  
   logic [7:0]    s7_rdata;  

   x_memxbar u_xbar(
      .i_clk            (i_clk         ),
      .i_rst            (i_rst         ),     
      // Main 
      .i_main_valid     (i_valid       ),
      .o_main_accept    (o_accept      ),
      .i_main_rd_n_wr   (i_rd_n_wr     ),
      .i_main_addr      (i_addr        ),
      .i_main_wdata     (i_wdata       ),
      .o_main_ready     (o_ready       ),
      .o_main_rdata     (o_rdata       ),
      // Context 0 
      .o_0_valid        (s0_valid       ),
      .i_0_accept       (s0_accept      ),
      .o_0_rd_n_wr      (s0_rd_n_wr     ),
      .o_0_addr         (s0_addr        ),
      .o_0_wdata        (s0_wdata       ),
      .i_0_ready        (s0_ready       ),
      .i_0_rdata        (s0_rdata       ),
      // Context 1 
      .o_1_valid        (s1_valid       ),
      .i_1_accept       (s1_accept      ),
      .o_1_rd_n_wr      (s1_rd_n_wr     ),
      .o_1_addr         (s1_addr        ),
      .o_1_wdata        (s1_wdata       ),
      .i_1_ready        (s1_ready       ),
      .i_1_rdata        (s1_rdata       ),
      // Context 2
      .o_2_valid        (s2_valid       ),
      .i_2_accept       (s2_accept      ),
      .o_2_rd_n_wr      (s2_rd_n_wr     ),
      .o_2_addr         (s2_addr        ),
      .o_2_wdata        (s2_wdata       ),
      .i_2_ready        (s2_ready       ),
      .i_2_rdata        (s2_rdata       ),
      // Context 3
      .o_3_valid        (s3_valid       ),
      .i_3_accept       (s3_accept      ),
      .o_3_rd_n_wr      (s3_rd_n_wr     ),
      .o_3_addr         (s3_addr        ),
      .o_3_wdata        (s3_wdata       ),
      .i_3_ready        (s3_ready       ),
      .i_3_rdata        (s3_rdata       ),
      // Context 4
      .o_4_valid        (s4_valid       ),
      .i_4_accept       (s4_accept      ),
      .o_4_rd_n_wr      (s4_rd_n_wr     ),
      .o_4_addr         (s4_addr        ),
      .o_4_wdata        (s4_wdata       ),
      .i_4_ready        (s4_ready       ),
      .i_4_rdata        (s4_rdata       ),
      // Context 5
      .o_5_valid        (s5_valid       ),
      .i_5_accept       (s5_accept      ),
      .o_5_rd_n_wr      (s5_rd_n_wr     ),
      .o_5_addr         (s5_addr        ),
      .o_5_wdata        (s5_wdata       ),
      .i_5_ready        (s5_ready       ),
      .i_5_rdata        (s5_rdata       ),
      // Context 6
      .o_6_valid        (s6_valid       ),
      .i_6_accept       (s6_accept      ),
      .o_6_rd_n_wr      (s6_rd_n_wr     ),
      .o_6_addr         (s6_addr        ),
      .o_6_wdata        (s6_wdata       ),
      .i_6_ready        (s6_ready       ),
      .i_6_rdata        (s6_rdata       ),
      // Context 7
      .o_7_valid        (s7_valid       ),
      .i_7_accept       (s7_accept      ),
      .o_7_rd_n_wr      (s7_rd_n_wr     ),
      .o_7_addr         (s7_addr        ),
      .o_7_wdata        (s7_wdata       ),
      .i_7_ready        (s7_ready       ),
      .i_7_rdata        (s7_rdata       )
   );
   
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
      .i_valid    (s0_valid    ),
      .o_accept   (s0_accept   ),
      .i_rd_n_wr  (s0_rd_n_wr  ),
      .i_addr     (s0_addr     ),
      .i_wdata    (s0_wdata    ),
      .o_ready    (s0_ready    ),
      .o_rdata    (s0_rdata    ),   
      .o_cs       (o_cs_0     ),
      .o_so       (o_so_0     ),
      .i_si       (i_si_0     )
   );

   x_23K640_data u_d_1(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (s1_valid    ),
      .o_accept   (s1_accept   ),
      .i_rd_n_wr  (s1_rd_n_wr  ),
      .i_addr     (s1_addr     ),
      .i_wdata    (s1_wdata    ),
      .o_ready    (s1_ready    ),
      .o_rdata    (s1_rdata    ),   
      .o_cs       (o_cs_1     ),
      .o_so       (o_so_1     ),
      .i_si       (i_si_1     )
   );

   x_23K640_data u_d_2(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (s2_valid    ),
      .o_accept   (s2_accept   ),
      .i_rd_n_wr  (s2_rd_n_wr  ),
      .i_addr     (s2_addr     ),
      .i_wdata    (s2_wdata    ),
      .o_ready    (s2_ready    ),
      .o_rdata    (s2_rdata    ),   
      .o_cs       (o_cs_2     ),
      .o_so       (o_so_2     ),
      .i_si       (i_si_2     )
   );

   x_23K640_data u_d_3(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (s3_valid    ),
      .o_accept   (s3_accept   ),
      .i_rd_n_wr  (s3_rd_n_wr  ),
      .i_addr     (s3_addr     ),
      .i_wdata    (s3_wdata    ),
      .o_ready    (s3_ready    ),
      .o_rdata    (s3_rdata    ),   
      .o_cs       (o_cs_3     ),
      .o_so       (o_so_3     ),
      .i_si       (i_si_3     )
   );

   x_23K640_data u_d_4(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (s4_valid    ),
      .o_accept   (s4_accept   ),
      .i_rd_n_wr  (s4_rd_n_wr  ),
      .i_addr     (s4_addr     ),
      .i_wdata    (s4_wdata    ),
      .o_ready    (s4_ready    ),
      .o_rdata    (s4_rdata    ),   
      .o_cs       (o_cs_4     ),
      .o_so       (o_so_4     ),
      .i_si       (i_si_4     )
   );

   x_23K640_data u_d_5(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (s5_valid    ),
      .o_accept   (s5_accept   ),
      .i_rd_n_wr  (s5_rd_n_wr  ),
      .i_addr     (s5_addr     ),
      .i_wdata    (s5_wdata    ),
      .o_ready    (s5_ready    ),
      .o_rdata    (s5_rdata    ),   
      .o_cs       (o_cs_5     ),
      .o_so       (o_so_5     ),
      .i_si       (i_si_5     )
   );

   x_23K640_data u_d_6(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (s6_valid    ),
      .o_accept   (s6_accept   ),
      .i_rd_n_wr  (s6_rd_n_wr  ),
      .i_addr     (s6_addr     ),
      .i_wdata    (s6_wdata    ),
      .o_ready    (s6_ready    ),
      .o_rdata    (s6_rdata    ),   
      .o_cs       (o_cs_6     ),
      .o_so       (o_so_6     ),
      .i_si       (i_si_6     )
   );

   x_23K640_data u_d_7(
      .i_clk      (i_clk      ),
      .i_rst      (i_rst      ),     
      .i_advance  (advance    ),
      .i_sck      (o_sck      ),
      .i_valid    (s7_valid    ),
      .o_accept   (s7_accept   ),
      .i_rd_n_wr  (s7_rd_n_wr  ),
      .i_addr     (s7_addr     ),
      .i_wdata    (s7_wdata    ),
      .o_ready    (s7_ready    ),
      .o_rdata    (s7_rdata    ),   
      .o_cs       (o_cs_7     ),
      .o_so       (o_so_7     ),
      .i_si       (i_si_7     )
   );

endmodule
