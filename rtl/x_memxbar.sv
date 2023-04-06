module x_memxbar(
   input    logic          i_clk,
   input    logic          i_rst,
   // Main
   input    logic          i_main_valid, 
   output   logic          o_main_accept, 
   input    logic          i_main_rd_n_wr,
   input    logic [18:0]   i_main_addr,   
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

   logic [2:0] sel;

   // Context select
   assign sel = i_main_addr[2:0];

   // Addr tree
   assign o_0_addr  = i_main_addr[18:3];  
   assign o_1_addr  = i_main_addr[18:3];  
   assign o_2_addr  = i_main_addr[18:3];  
   assign o_3_addr  = i_main_addr[18:3];  
   assign o_4_addr  = i_main_addr[18:3];  
   assign o_5_addr  = i_main_addr[18:3];  
   assign o_6_addr  = i_main_addr[18:3];  
   assign o_7_addr  = i_main_addr[18:3];  

   // Wdata tree
   assign o_0_wdata = i_main_wdata;  
   assign o_1_wdata = i_main_wdata;  
   assign o_2_wdata = i_main_wdata;  
   assign o_3_wdata = i_main_wdata;  
   assign o_4_wdata = i_main_wdata;  
   assign o_5_wdata = i_main_wdata;  
   assign o_6_wdata = i_main_wdata;  
   assign o_7_wdata = i_main_wdata;  

   // Valid select
   assign o_0_valid = i_main_valid & (sel == 'd0);  
   assign o_1_valid = i_main_valid & (sel == 'd1);  
   assign o_2_valid = i_main_valid & (sel == 'd2);  
   assign o_3_valid = i_main_valid & (sel == 'd3);  
   assign o_4_valid = i_main_valid & (sel == 'd4);  
   assign o_5_valid = i_main_valid & (sel == 'd5);  
   assign o_6_valid = i_main_valid & (sel == 'd6);  
   assign o_7_valid = i_main_valid & (sel == 'd7);  

   // Read not write tree
   assign o_0_rd_n_wr = i_main_rd_n_wr;  
   assign o_1_rd_n_wr = i_main_rd_n_wr;  
   assign o_2_rd_n_wr = i_main_rd_n_wr;  
   assign o_3_rd_n_wr = i_main_rd_n_wr;  
   assign o_4_rd_n_wr = i_main_rd_n_wr;  
   assign o_5_rd_n_wr = i_main_rd_n_wr;  
   assign o_6_rd_n_wr = i_main_rd_n_wr;  
   assign o_7_rd_n_wr = i_main_rd_n_wr;  

   // Temp hook up 0 only 
   assign o_main_accept = i_0_accept |
                          i_1_accept |
                          i_2_accept |
                          i_3_accept |
                          i_4_accept |
                          i_5_accept |
                          i_6_accept |
                          i_7_accept ;
   
   assign o_main_ready  = i_0_ready |
                          i_1_ready |
                          i_2_ready |
                          i_3_ready |
                          i_4_ready |
                          i_5_ready |
                          i_6_ready |
                          i_7_ready ;
  
   always_comb begin
      o_main_rdata = i_7_rdata;
      priority case(1'b1)
         i_6_ready:  o_main_rdata = i_6_rdata;
         i_5_ready:  o_main_rdata = i_5_rdata;
         i_4_ready:  o_main_rdata = i_4_rdata;
         i_3_ready:  o_main_rdata = i_3_rdata;
         i_2_ready:  o_main_rdata = i_2_rdata;
         i_1_ready:  o_main_rdata = i_1_rdata;
         i_0_ready:  o_main_rdata = i_0_rdata;
         default:;
      endcase
   end 

endmodule
