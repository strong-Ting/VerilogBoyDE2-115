module resetGen (
    input clk,
    output reg rst
);

reg [1:0] cnt = 2'd0;
always @(posedge clk) begin
   if(cnt == 2'd3) rst <= 1'd0;
   else begin
      cnt <= cnt + 2'd1;
      rst <= 1'd1;
   end 
end
    
endmodule