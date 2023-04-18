module x_req_cpl_buf #(
   parameter p_depth = 2
)(
   input    logic          i_clk,
   input    logic          i_rst,
   // Buffered - Request
   input    logic          i_req_valid, 
   output   logic          o_req_accept, 
   input    logic          i_req_rd_n_wr,
   input    logic [15:0]   i_req_addr,   
   input    logic [7:0]    i_req_wdata, 
   input    logic [7:0]    i_req_tag,
   // Buffered - Completion
   output   logic          o_cpl_ready,  
   output   logic [7:0]    o_cpl_rdata,
   output   logic [7:0]    o_cpl_tag,
   input    logic          i_cpl_accept,
   // Unbuffered 
   output   logic          o_valid, 
   input    logic          i_accept,  
   output   logic          o_rd_n_wr, 
   output   logic [15:0]   o_addr,    
   output   logic [7:0]    o_wdata,   
   input    logic          i_ready,   
   input    logic [7:0]    i_rdata 
);

   logic [24:0]   r_req;
   logic [24:0]   w_req;

   logic          tag_valid;

   // Request buffer
   assign w_req = {
      i_req_rd_n_wr,
      i_req_addr,
      i_req_wdata};

   x_buf #( 
      .p_depth    (p_depth       ),
      .p_width    (25            )
   ) u_req (
      .i_clk      (i_clk         ),
      .i_rst      (i_rst         ),
      .i_valid    (i_req_valid   ),
      .i_data     (w_req         ),
      .o_accept   (o_req_accept  ),
      .o_valid    (o_valid       ),
      .o_data     (r_req         ),
      .i_accept   (i_accept      ) 
   );

   assign {
      o_rd_n_wr,
      o_addr,
      o_wdata
   } = r_req;
   
   // Tag read request buffer 
   assign tag_valid = i_req_valid &
                      o_req_accept &
                      i_req_rd_n_wr;

   x_buf #( 
      .p_depth    (p_depth       ),
      .p_width    (8             )
   ) u_tag (
      .i_clk      (i_clk         ),
      .i_rst      (i_rst         ),
      .i_valid    (i_req_valid   ),
      .i_data     (i_req_tag     ),
      .o_accept   (              ), // Must accept   - We have reqs
      .o_valid    (              ), // Must be valid - We habe cpls
      .o_data     (o_cpl_tag     ),
      .i_accept   (i_cpl_accept  ) 
   );

   // Completion buffer
   x_buf #( 
      .p_depth    (p_depth       ),
      .p_width    (8             )
   ) u_cpl (
      .i_clk      (i_clk         ),
      .i_rst      (i_rst         ),
      .i_valid    (i_ready       ),
      .i_data     (i_rdata       ),
      .o_accept   (              ), // Must Accept
      .o_valid    (o_cpl_ready   ),
      .o_data     (o_cpl_rdata   ),
      .i_accept   (i_cpl_accept  ) 
   );
    
endmodule

