module alu(
    input [7:0] a_out,
    input [7:0] b_out,
    input [2:0] sel_in,

    output reg [7:0] alu_out,
    output reg carry,
    output reg zero
);

reg [8:0] temp;

always @(*)
begin
    carry = 1'b0;

    case(sel_in)

    3'b000: 
    begin
        temp = a_out + b_out;
        alu_out = temp[7:0];
        carry = temp[8];
    end

    3'b001: 
    begin
        temp = a_out - b_out;
        alu_out = temp[7:0];
        carry = temp[8];
    end

    3'b010: 
    begin
        alu_out = a_out ^ b_out;
    end

    3'b011: 
    begin
        alu_out = a_out & b_out;
    end

    3'b100: 
    begin
        temp = a_out + 1;
        alu_out = temp[7:0];
        carry = temp[8];
    end

    default:
    begin
        alu_out = 8'b00000000;
        carry = 1'b0;
    end

    endcase

    zero = (alu_out == 8'b00000000);

end

endmodule