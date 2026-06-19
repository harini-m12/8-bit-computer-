module flagreg(
    input clock,rst,
    input fen,
    input carry,zero,
    output carryflag,zeroflag
);
reg carry_reg;
reg zero_reg;
always@(posedge clock or posedge rst)
      begin
        if(rst)
        begin
           carry_reg<=1'b0;
           zero_reg<= 1'b0;
        end   
        else if(fen)
        begin
           carry_reg<=carry;
           zero_reg<=zero;
        end   
      end
assign carryflag=carry_reg;
assign zeroflag=zero_reg;
endmodule