module mar(
input clock,
input load,
input rst,
input wire[3:0]bus,
output reg[3:0]m_out);

always@(posedge clock or posedge rst)
   begin
       if(rst)
       m_out<=0;
       else if(load)
       m_out<=bus;
   end
endmodule