module a_reg(
    input clock,
    input rst,
    input ai,
    input ao,
    input [7:0] bus_in,
    output[7:0]a_out,
    output[7:0]bus_out
);
reg [7:0] a_reg;

always @(posedge clock or posedge rst)
begin
   if(rst)
     a_reg<=8'b00000000;
   else if(ai)
     a_reg<=bus_in;
end
assign a_out=a_reg;
assign bus_out=(ao)?a_out:8'hz;
endmodule
