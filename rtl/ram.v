`include "isa.vh"
`timescale 1ns/1ps

`timescale 1ns/1ps

module ram(
    input clk,
    input rst,

    input mem_read,
    input mem_write,

    input [3:0] addr,
    input [7:0] data_in,

    output reg [7:0] data_out
);

reg [7:0] mem [0:15];
integer i;

// Write and Reset
always @(posedge clk)
begin
    if(rst)
    begin
        for(i=0;i<16;i=i+1)
            mem[i] <= 8'd0;
    end
    else if(mem_write)
    begin
        mem[addr] <= data_in;
    end
end

// Read
always @(*)
begin
    if(mem_read)
        data_out = mem[addr];
    else
        data_out = 8'd0;
end

endmodule