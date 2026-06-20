// isa.v
`define NOP 4'b0000
`define ADD 4'b0001
`define SUB 4'b0010
`define LDA 4'b0011
`define LDB 4'b0100
`define OUT 4'b0101
// JMP is 0b1011, JC=1100, JZ=1101, INC=1110
`define STA 4'b1000
`define XOR 4'b1001
`define AND 4'b1010
`define JMP 4'b1011
`define JC  4'b1100
`define JZ  4'b1101
`define INC 4'b1110
`define HLT 4'b0111
