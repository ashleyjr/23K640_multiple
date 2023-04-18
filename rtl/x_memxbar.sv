module x_memxbar#(
   parameter p_depth = 2
)(
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
   
   logic       req_tag_en;
   logic [7:0] req_tag_d;
   logic [7:0] req_tag_q;
   
   logic       cpl_tag_en;
   logic [7:0] cpl_tag_d;
   logic [7:0] cpl_tag_q;

   logic [7:0] cpl_tag_0;
   logic [7:0] cpl_tag_1;
   logic [7:0] cpl_tag_2;
   logic [7:0] cpl_tag_3;
   logic [7:0] cpl_tag_4;
   logic [7:0] cpl_tag_5;
   logic [7:0] cpl_tag_6;
   logic [7:0] cpl_tag_7;
   
   logic [2:0] sel;

   logic req_valid_0; 
   logic req_valid_1;
   logic req_valid_2;
   logic req_valid_3;
   logic req_valid_4;
   logic req_valid_5;
   logic req_valid_6;
   logic req_valid_7;
 
   logic req_accept_0; 
   logic req_accept_1;
   logic req_accept_2;
   logic req_accept_3;
   logic req_accept_4;
   logic req_accept_5;
   logic req_accept_6;
   logic req_accept_7;
      
   logic cpl_ready_0; 
   logic cpl_ready_1;
   logic cpl_ready_2;
   logic cpl_ready_3;
   logic cpl_ready_4;
   logic cpl_ready_5;
   logic cpl_ready_6;
   logic cpl_ready_7;
 
   logic cpl_accept_0; 
   logic cpl_accept_1;
   logic cpl_accept_2;
   logic cpl_accept_3;
   logic cpl_accept_4;
   logic cpl_accept_5;
   logic cpl_accept_6;
   logic cpl_accept_7;

   logic [7:0] cpl_rdata_0;
   logic [7:0] cpl_rdata_1;
   logic [7:0] cpl_rdata_2;
   logic [7:0] cpl_rdata_3;
   logic [7:0] cpl_rdata_4;
   logic [7:0] cpl_rdata_5;
   logic [7:0] cpl_rdata_6;
   logic [7:0] cpl_rdata_7;
   
   // Context select
   assign sel = i_main_addr[2:0];
   
   // Valid select
   assign req_valid_0 = i_main_valid & (sel == 'd0);  
   assign req_valid_1 = i_main_valid & (sel == 'd1);  
   assign req_valid_2 = i_main_valid & (sel == 'd2);  
   assign req_valid_3 = i_main_valid & (sel == 'd3);  
   assign req_valid_4 = i_main_valid & (sel == 'd4);  
   assign req_valid_5 = i_main_valid & (sel == 'd5);  
   assign req_valid_6 = i_main_valid & (sel == 'd6);  
   assign req_valid_7 = i_main_valid & (sel == 'd7);  

   // Accept
   assign o_main_accept = 
      req_accept_0| 
      req_accept_1|
      req_accept_2|
      req_accept_3|
      req_accept_4|
      req_accept_5|
      req_accept_6|
      req_accept_7;
     
   // Read ready when tag match
   assign cpl_accept_0 = cpl_ready_0 & (cpl_tag_0 == cpl_tag_q); 
   assign cpl_accept_1 = cpl_ready_1 & (cpl_tag_1 == cpl_tag_q);   
   assign cpl_accept_2 = cpl_ready_2 & (cpl_tag_2 == cpl_tag_q); 
   assign cpl_accept_3 = cpl_ready_3 & (cpl_tag_3 == cpl_tag_q); 
   assign cpl_accept_4 = cpl_ready_4 & (cpl_tag_4 == cpl_tag_q); 
   assign cpl_accept_5 = cpl_ready_5 & (cpl_tag_5 == cpl_tag_q); 
   assign cpl_accept_6 = cpl_ready_6 & (cpl_tag_6 == cpl_tag_q); 
   assign cpl_accept_7 = cpl_ready_7 & (cpl_tag_7 == cpl_tag_q); 
   assign o_main_ready = 
      cpl_accept_0|
      cpl_accept_1|
      cpl_accept_2|
      cpl_accept_3|
      cpl_accept_4|
      cpl_accept_5|
      cpl_accept_6|
      cpl_accept_7;

   // Read mux selected by tag 
   always_comb begin
      o_main_rdata = cpl_rdata_0;
      priority case(cpl_tag_q)
         cpl_tag_1:  o_main_rdata = cpl_rdata_1;
         cpl_tag_2:  o_main_rdata = cpl_rdata_2;
         cpl_tag_3:  o_main_rdata = cpl_rdata_3;
         cpl_tag_4:  o_main_rdata = cpl_rdata_4;
         cpl_tag_5:  o_main_rdata = cpl_rdata_5;
         cpl_tag_6:  o_main_rdata = cpl_rdata_6;
         cpl_tag_7:  o_main_rdata = cpl_rdata_7;
         default:;
      endcase
   end 

   // Request tag counter
   assign req_tag_en = o_main_accept & i_main_rd_n_wr;

   assign req_tag_d = req_tag_q + 'd1;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)            req_tag_q <= 'd0;
      else if(req_tag_en)  req_tag_q <= req_tag_d;
   end

   // Completion tag counter
   assign cpl_tag_en = o_main_ready;

   assign cpl_tag_d = cpl_tag_q + 'd1;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)            cpl_tag_q <= 'd0;
      else if(cpl_tag_en)  cpl_tag_q <= cpl_tag_d;
   end
   
   // Request and completion buffers
   x_req_cpl_buf#(
      .p_depth       (p_depth             )
   ) u_buf_0 (
      .i_clk         (i_clk               ),
      .i_rst         (i_rst               ),
      // Requests
      .i_req_valid   (req_valid_0         ), 
      .o_req_accept  (req_accept_0        ), 
      .i_req_rd_n_wr (i_main_rd_n_wr),
      .i_req_addr    (i_main_addr[18:3]   ),   
      .i_req_wdata   (i_main_wdata        ), 
      .i_req_tag     (req_tag_q           ),
      // Completions
      .o_cpl_ready   (cpl_ready_0         ),  
      .o_cpl_rdata   (cpl_rdata_0         ),
      .o_cpl_tag     (cpl_tag_0           ),
      .i_cpl_accept  (cpl_accept_0        ),
      // SRAM Side
      .o_valid       (o_0_valid           ), 
      .i_accept      (i_0_accept          ),  
      .o_rd_n_wr     (o_0_rd_n_wr         ), 
      .o_addr        (o_0_addr            ),    
      .o_wdata       (o_0_wdata           ),   
      .i_ready       (i_0_ready           ),   
      .i_rdata       (i_0_rdata           )
   );
 
   x_req_cpl_buf#(
      .p_depth       (p_depth             )
   ) u_buf_1 (
      .i_clk         (i_clk               ),
      .i_rst         (i_rst               ),
      // Requests
      .i_req_valid   (req_valid_1         ), 
      .o_req_accept  (req_accept_1        ), 
      .i_req_rd_n_wr (i_main_rd_n_wr      ),
      .i_req_addr    (i_main_addr[18:3]   ),   
      .i_req_wdata   (i_main_wdata        ), 
      .i_req_tag     (req_tag_q           ),
      // Completions
      .o_cpl_ready   (cpl_ready_1         ),  
      .o_cpl_rdata   (cpl_rdata_1         ),
      .o_cpl_tag     (cpl_tag_1           ),
      .i_cpl_accept  (cpl_accept_1        ),
      // SRAM Side
      .o_valid       (o_1_valid           ), 
      .i_accept      (i_1_accept          ),  
      .o_rd_n_wr     (o_1_rd_n_wr         ), 
      .o_addr        (o_1_addr            ),    
      .o_wdata       (o_1_wdata           ),   
      .i_ready       (i_1_ready           ),   
      .i_rdata       (i_1_rdata           )
   );  

   x_req_cpl_buf#(
      .p_depth       (p_depth             )
   ) u_buf_2 (
      .i_clk         (i_clk               ),
      .i_rst         (i_rst               ),
      // Requests
      .i_req_valid   (req_valid_2         ), 
      .o_req_accept  (req_accept_2        ), 
      .i_req_rd_n_wr (i_main_rd_n_wr      ),
      .i_req_addr    (i_main_addr[18:3]   ),   
      .i_req_wdata   (i_main_wdata        ), 
      .i_req_tag     (req_tag_q           ),
      // Completions
      .o_cpl_ready   (cpl_ready_2         ),  
      .o_cpl_rdata   (cpl_rdata_2         ),
      .o_cpl_tag     (cpl_tag_2           ),
      .i_cpl_accept  (cpl_accept_2        ),
      // SRAM Side
      .o_valid       (o_2_valid           ), 
      .i_accept      (i_2_accept          ),  
      .o_rd_n_wr     (o_2_rd_n_wr         ), 
      .o_addr        (o_2_addr            ),    
      .o_wdata       (o_2_wdata           ),   
      .i_ready       (i_2_ready           ),   
      .i_rdata       (i_2_rdata           )
   );

   x_req_cpl_buf#(
      .p_depth       (p_depth             )
   ) u_buf_3 (
      .i_clk         (i_clk               ),
      .i_rst         (i_rst               ),
      // Requests
      .i_req_valid   (req_valid_3         ), 
      .o_req_accept  (req_accept_3        ), 
      .i_req_rd_n_wr (i_main_rd_n_wr      ),
      .i_req_addr    (i_main_addr[18:3]   ),   
      .i_req_wdata   (i_main_wdata        ), 
      .i_req_tag     (req_tag_q           ),
      // Completions
      .o_cpl_ready   (cpl_ready_3         ),  
      .o_cpl_rdata   (cpl_rdata_3         ),
      .o_cpl_tag     (cpl_tag_3           ),
      .i_cpl_accept  (cpl_accept_3        ),
      // SRAM Side
      .o_valid       (o_3_valid           ), 
      .i_accept      (i_3_accept          ),  
      .o_rd_n_wr     (o_3_rd_n_wr         ), 
      .o_addr        (o_3_addr            ),    
      .o_wdata       (o_3_wdata           ),   
      .i_ready       (i_3_ready           ),   
      .i_rdata       (i_3_rdata           )
   );

   x_req_cpl_buf#(
      .p_depth       (p_depth             )
   ) u_buf_4 (
      .i_clk         (i_clk               ),
      .i_rst         (i_rst               ),
      // Requests
      .i_req_valid   (req_valid_4         ), 
      .o_req_accept  (req_accept_4        ), 
      .i_req_rd_n_wr (i_main_rd_n_wr),
      .i_req_addr    (i_main_addr[18:3]   ),   
      .i_req_wdata   (i_main_wdata        ), 
      .i_req_tag     (req_tag_q           ),
      // Completions
      .o_cpl_ready   (cpl_ready_4         ),  
      .o_cpl_rdata   (cpl_rdata_4         ),
      .o_cpl_tag     (cpl_tag_4           ),
      .i_cpl_accept  (cpl_accept_4        ),
      // SRAM Side
      .o_valid       (o_4_valid           ), 
      .i_accept      (i_4_accept          ),  
      .o_rd_n_wr     (o_4_rd_n_wr         ), 
      .o_addr        (o_4_addr            ),    
      .o_wdata       (o_4_wdata           ),   
      .i_ready       (i_4_ready           ),   
      .i_rdata       (i_4_rdata           )
   );

   x_req_cpl_buf#(
      .p_depth       (p_depth             )
   ) u_buf_5 (
      .i_clk         (i_clk               ),
      .i_rst         (i_rst               ),
      // Requests
      .i_req_valid   (req_valid_5         ), 
      .o_req_accept  (req_accept_5        ), 
      .i_req_rd_n_wr (i_main_rd_n_wr      ),
      .i_req_addr    (i_main_addr[18:3]   ),   
      .i_req_wdata   (i_main_wdata        ), 
      .i_req_tag     (req_tag_q           ),
      // Completions
      .o_cpl_ready   (cpl_ready_5         ),  
      .o_cpl_rdata   (cpl_rdata_5         ),
      .o_cpl_tag     (cpl_tag_5           ),
      .i_cpl_accept  (cpl_accept_5        ),
      // SRAM Side
      .o_valid       (o_5_valid           ), 
      .i_accept      (i_5_accept          ),  
      .o_rd_n_wr     (o_5_rd_n_wr         ), 
      .o_addr        (o_5_addr            ),    
      .o_wdata       (o_5_wdata           ),   
      .i_ready       (i_5_ready           ),   
      .i_rdata       (i_5_rdata           )
   );

   x_req_cpl_buf#(
      .p_depth       (p_depth             )
   ) u_buf_6 (
      .i_clk         (i_clk               ),
      .i_rst         (i_rst               ),
      // Requests
      .i_req_valid   (req_valid_6         ), 
      .o_req_accept  (req_accept_6        ), 
      .i_req_rd_n_wr (i_main_rd_n_wr      ),
      .i_req_addr    (i_main_addr[18:3]   ),   
      .i_req_wdata   (i_main_wdata        ), 
      .i_req_tag     (req_tag_q           ),
      // Completions
      .o_cpl_ready   (cpl_ready_6         ),  
      .o_cpl_rdata   (cpl_rdata_6         ),
      .o_cpl_tag     (cpl_tag_6           ),
      .i_cpl_accept  (cpl_accept_6        ),
      // SRAM Side
      .o_valid       (o_6_valid           ), 
      .i_accept      (i_6_accept          ),  
      .o_rd_n_wr     (o_6_rd_n_wr         ), 
      .o_addr        (o_6_addr            ),    
      .o_wdata       (o_6_wdata           ),   
      .i_ready       (i_6_ready           ),   
      .i_rdata       (i_6_rdata           )
   );

   x_req_cpl_buf#(
      .p_depth       (p_depth             )
   ) u_buf_7 (
      .i_clk         (i_clk               ),
      .i_rst         (i_rst               ),
      // Requests
      .i_req_valid   (req_valid_7         ), 
      .o_req_accept  (req_accept_7        ), 
      .i_req_rd_n_wr (i_main_rd_n_wr      ),
      .i_req_addr    (i_main_addr[18:3]   ),   
      .i_req_wdata   (i_main_wdata        ), 
      .i_req_tag     (req_tag_q           ),
      // Completions
      .o_cpl_ready   (cpl_ready_7         ),  
      .o_cpl_rdata   (cpl_rdata_7         ),
      .o_cpl_tag     (cpl_tag_7           ),
      .i_cpl_accept  (cpl_accept_7        ),
      // SRAM Side
      .o_valid       (o_7_valid           ), 
      .i_accept      (i_7_accept          ),  
      .o_rd_n_wr     (o_7_rd_n_wr         ), 
      .o_addr        (o_7_addr            ),    
      .o_wdata       (o_7_wdata           ),   
      .i_ready       (i_7_ready           ),   
      .i_rdata       (i_7_rdata           )
   );

endmodule
