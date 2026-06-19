module b_reg(input clock,
input rst,
input bi,
input [7:0]bus_in,
output [7:0] b_out);
reg [7:0] b_reg;
always@(posedge clock or posedge rst)
begin
    if(rst)
       b_reg<=8'b00000000;
    else if(bi)
       b_reg<=bus_in;
end
assign b_out=b_reg;
endmodule