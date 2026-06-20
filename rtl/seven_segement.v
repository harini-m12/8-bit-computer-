module seven_segement(
    input clk,
    input rst,
    input [7:0] bin,
    output reg [6:0] seg,
    output reg [2:0] an
);

wire [3:0] hundreds, tens, ones;
reg [15:0] refresh_count;
reg [1:0] digit_select;
reg [3:0] current_digit;

bin_to_bcd B1(
    .bin(bin),
    .hundreds(hundreds),
    .tens(tens),
    .ones(ones)
);

always @(posedge clk)
begin
    if(rst)
        refresh_count <= 16'd0;
    else
        refresh_count <= refresh_count + 1'b1;
end

always @(*)
begin
    digit_select = refresh_count[3:2]; 
end

always @(*)
begin
    case(digit_select)
        2'b00: begin
            an = 3'b110;          // ones ON
            current_digit = ones;
        end

        2'b01: begin
            an = 3'b101;          // tens ON
            current_digit = tens;
        end

        2'b10: begin
            an = 3'b011;          // hundreds ON
            current_digit = hundreds;
        end

        default: begin
            an = 3'b110;
            current_digit = ones;
        end
    endcase
end

always @(*)
begin
    case(current_digit)
        4'd0: seg = 7'b0000001;
        4'd1: seg = 7'b1001111;
        4'd2: seg = 7'b0010010;
        4'd3: seg = 7'b0000110;
        4'd4: seg = 7'b1001100;
        4'd5: seg = 7'b0100100;
        4'd6: seg = 7'b0100000;
        4'd7: seg = 7'b0001111;
        4'd8: seg = 7'b0000000;
        4'd9: seg = 7'b0000100;
        default: seg = 7'b1111111;
    endcase
end

endmodule


module bin_to_bcd(
    input [7:0] bin,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones
);

integer i;
reg [19:0] bcd;

always @(*)
begin
    bcd = 20'd0;
    bcd[7:0] = bin;

    for(i = 0; i < 8; i = i + 1)
    begin
        if(bcd[11:8] >= 5)
            bcd[11:8] = bcd[11:8] + 3;

        if(bcd[15:12] >= 5)
            bcd[15:12] = bcd[15:12] + 3;

        if(bcd[19:16] >= 5)
            bcd[19:16] = bcd[19:16] + 3;

        bcd = bcd << 1;
    end

    hundreds = bcd[19:16];
    tens     = bcd[15:12];
    ones     = bcd[11:8];
end

endmodule
