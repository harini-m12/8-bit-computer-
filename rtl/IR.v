module IR(
    input clock,
    input rst,
    input ii,
    input [7:0] bus_in,
    output [3:0] opcode,
    output [3:0] operand
);
reg [7:0] ir;
always @(posedge clock or posedge rst)
begin
    if(rst)
        ir <= 8'b00000000;
    else if(ii)
        ir <= bus_in;
end
assign opcode  = ir[7:4];
assign operand = ir[3:0];
endmodule