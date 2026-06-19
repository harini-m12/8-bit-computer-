module pc(
input clk,
input rst,
input ce,
input cl,
input co,
input [3:0]addr_in,
input load,
output [3:0]bus_out, 
output reg [3:0] pc_count
);
always @(posedge clk)
begin
 if(rst)
    pc_count<=4'b0000;
else if(cl)
    pc_count<=addr_in;
else if(ce)
    pc_count<=pc_count+1'b1;
else
   pc_count<=pc_count;
end 
assign bus_out=(co)?pc_count:4'bzzzz;

endmodule