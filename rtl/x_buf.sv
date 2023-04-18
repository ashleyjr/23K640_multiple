module x_buf #(
   parameter p_depth = 2,
   parameter p_width = 1
)(
   input    logic                i_clk,
   input    logic                i_rst,
   input    logic                i_valid,
   input    logic [p_width-1:0]  i_data,
   output   logic                o_accept,
   output   logic                o_valid,
   output   logic [p_width-1:0]  o_data,
   input    logic                i_accept 
);

   localparam int                         p_dep = p_depth - 1;  
   localparam logic [$clog2(p_depth)-1:0] p_cmp = p_dep[$clog2(p_depth)-1:0];  

   logic                         full_en;
   logic                         full_d;
   logic                         full_q;

   logic                         rd_en;
   logic [$clog2(p_depth)-1:0]   rd_d;
   logic [$clog2(p_depth)-1:0]   rd_q;
 
   logic                         wr_en;
   logic [$clog2(p_depth)-1:0]   wr_d;
   logic [$clog2(p_depth)-1:0]   wr_q;  
  
   logic                         mem_en; 
   logic [p_width-1:0]           mem_q [0:p_depth-1];
 
   // Accept
   assign o_accept = ~full_q;

   // Write pointer
   assign wr_en = i_valid & o_accept;

   assign wr_d = (wr_q == p_cmp) ? 'd0 : (wr_q + 'd1);

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         wr_q <= 'd0;
      else if(wr_en)    wr_q <= wr_d;
   end
    
   // Read pointer
   assign rd_en = o_valid & i_accept; 

   assign rd_d = (rd_q == p_cmp) ? 'd0 : (rd_q + 'd1);

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         rd_q <= 'd0;
      else if(rd_en)    rd_q <= rd_d;
   end
    
   // Track full  
   assign full_en = rd_en | wr_en;

   assign full_d = (rd_q == wr_d) & ~rd_en & wr_en; 

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         full_q <= 'd0;
      else if(full_en)  full_q <= full_d;
   end
  
   // Buffer memory
   assign mem_en = o_accept;

   always_ff@(posedge i_clk or posedge i_rst) begin
      if(i_rst)         mem_q[wr_q] <= 'd0;
      else if(mem_en)   mem_q[wr_q] <= i_data;
   end

   assign o_data = mem_q[rd_q];


endmodule

