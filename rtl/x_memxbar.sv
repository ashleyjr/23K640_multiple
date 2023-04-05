module x_memxbar(
   input    logic          i_clk,
   input    logic          i_rst,
   // Main
   input    logic          i_main_valid, 
   output   logic          o_main_accept, 
   input    logic          i_main_rd_n_wr,
   input    logic [15:0]   i_main_addr,   
   input    logic [7:0]    i_main_wdata,  
   output   logic          o_main_ready,  
   output   logic [7:0]    o_main_rdata, 
   // Context 0 
   output   logic          o_0_valid, 
   input    logic          i_0_accept,  
   output   logic          o_0_rd_n_wr, 
   output   logic [15:0]   o_0_addr,    
   output   logic [7:0]    o_0_wdata,   
   input    logic          i_0_ready,   
   input    logic [7:0]    i_0_rdata,  
   // Context 1
   output   logic          o_1_valid, 
   input    logic          i_1_accept,  
   output   logic          o_1_rd_n_wr, 
   output   logic [15:0]   o_1_addr,    
   output   logic [7:0]    o_1_wdata,   
   input    logic          i_1_ready,   
   input    logic [7:0]    i_1_rdata,  
   // Context 2
   output   logic          o_2_valid, 
   input    logic          i_2_accept,  
   output   logic          o_2_rd_n_wr, 
   output   logic [15:0]   o_2_addr,    
   output   logic [7:0]    o_2_wdata,   
   input    logic          i_2_ready,   
   input    logic [7:0]    i_2_rdata,  
   // Context 3
   output   logic          o_3_valid, 
   input    logic          i_3_accept,  
   output   logic          o_3_rd_n_wr, 
   output   logic [15:0]   o_3_addr,    
   output   logic [7:0]    o_3_wdata,   
   input    logic          i_3_ready,   
   input    logic [7:0]    i_3_rdata,  
   // Context 4
   output   logic          o_4_valid, 
   input    logic          i_4_accept,  
   output   logic          o_4_rd_n_wr, 
   output   logic [15:0]   o_4_addr,    
   output   logic [7:0]    o_4_wdata,   
   input    logic          i_4_ready,   
   input    logic [7:0]    i_4_rdata,  
   // Context 5
   output   logic          o_5_valid, 
   input    logic          i_5_accept,  
   output   logic          o_5_rd_n_wr, 
   output   logic [15:0]   o_5_addr,    
   output   logic [7:0]    o_5_wdata,   
   input    logic          i_5_ready,   
   input    logic [7:0]    i_5_rdata,  
   // Context 6
   output   logic          o_6_valid, 
   input    logic          i_6_accept,  
   output   logic          o_6_rd_n_wr, 
   output   logic [15:0]   o_6_addr,    
   output   logic [7:0]    o_6_wdata,   
   input    logic          i_6_ready,   
   input    logic [7:0]    i_6_rdata,  
   // Context 7
   output   logic          o_7_valid, 
   input    logic          i_7_accept,  
   output   logic          o_7_rd_n_wr, 
   output   logic [15:0]   o_7_addr,    
   output   logic [7:0]    o_7_wdata,   
   input    logic          i_7_ready,   
   input    logic [7:0]    i_7_rdata
);

   // Temp hook up 0 only 
   assign o_0_valid     = i_main_valid; 
   assign o_0_rd_n_wr   = i_main_rd_n_wr; 
   assign o_0_addr      = i_main_addr;    
   assign o_0_wdata     = i_main_wdata;
   assign o_main_accept = i_0_accept;
   assign o_main_ready  = i_0_ready;
   assign o_main_rdata  = i_0_rdata;
  
   // Tie off 1 to 7
   assign o_1_valid     = 'd0; 
   assign o_1_rd_n_wr   = 'd0; 
   assign o_1_addr      = 'd0;    
   assign o_1_wdata     = 'd0;  
   assign o_2_valid     = 'd0;  
   assign o_2_rd_n_wr   = 'd0; 
   assign o_2_addr      = 'd0;    
   assign o_2_wdata     = 'd0; 
   assign o_3_valid     = 'd0;  
   assign o_3_rd_n_wr   = 'd0; 
   assign o_3_addr      = 'd0;    
   assign o_3_wdata     = 'd0; 
   assign o_4_valid     = 'd0;  
   assign o_4_rd_n_wr   = 'd0; 
   assign o_4_addr      = 'd0;    
   assign o_4_wdata     = 'd0; 
   assign o_5_valid     = 'd0;  
   assign o_5_rd_n_wr   = 'd0; 
   assign o_5_addr      = 'd0;    
   assign o_5_wdata     = 'd0; 
   assign o_6_valid     = 'd0;  
   assign o_6_rd_n_wr   = 'd0; 
   assign o_6_addr      = 'd0;    
   assign o_6_wdata     = 'd0; 
   assign o_7_valid     = 'd0;  
   assign o_7_rd_n_wr   = 'd0; 
   assign o_7_addr      = 'd0;    
   assign o_7_wdata     = 'd0;

endmodule
