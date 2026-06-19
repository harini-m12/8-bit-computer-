module out_reg(
    input clk,
    input rst,
    input OI,
    input [7:0] bus_in,
    output reg [7:0] out_reg
);

always @(posedge clk)
begin
    if(rst)
        out_reg <= 8'b00000000;
    else if(OI)
        out_reg <= bus_in;
end

endmodule