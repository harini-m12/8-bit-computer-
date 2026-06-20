`include "isa.v"

module control_unit(

    input clk,
    input rst,

    input [3:0] opcode,

    // PC
    output reg CE,
    output reg CO,

    // MAR
    output reg load,

    // RAM
    output reg mem_read,
    output reg mem_write,

    // IR
    output reg ii,

    // A Register
    output reg ai,
    output reg ao,

    // B Register
    output reg bi,
    output reg bo,

    // Output Register
    output reg oi,

    // Flag Register
    output reg f_en,

    // ALU
    output reg [2:0] sel_in

);

reg [2:0] t_cycle;

//----------------------------------
// T-Cycle Generator
//----------------------------------
always @(posedge clk or posedge rst)
begin
    if(rst)
        t_cycle <= 3'd0;
    else
    begin
        if(t_cycle == 3'd5)
            t_cycle = 3'd0;
        else
            t_cycle <= t_cycle + 1'b1;
    end
end

//----------------------------------
// Control Signal Generation
//----------------------------------
always @(*)
begin

    // Default values
    CE        = 1'b0;
    CO        = 1'b0;

    load      = 1'b0;

    mem_read  = 1'b0;
    mem_write = 1'b0;

    ii        = 1'b0;

    ai        = 1'b0;
    ao        = 1'b0;

    bi        = 1'b0;
    bo        = 1'b0;

    oi        = 1'b0;

    f_en      = 1'b0;

    sel_in    = 3'b000;

    case(t_cycle)

    //----------------------------------
    // T0 : PC -> MAR
    //----------------------------------
    3'd0:
    begin
        CO   = 1'b1;
        load = 1'b1;
    end

    //----------------------------------
    // T1 : PC++
    //----------------------------------
    3'd1:
    begin
        CE = 1'b1;
    end

    //----------------------------------
    // T2 : RAM -> IR
    //----------------------------------
    3'd2:
    begin
        mem_read = 1'b1;
        ii       = 1'b1;
    end

    //----------------------------------
    // T3 : Decode
    //----------------------------------
    3'd3:
    begin
        case(opcode)

            `LDA:
                load = 1'b1;

            `LDB:
                load = 1'b1;

            default:
                ;

        endcase
    end

    //----------------------------------
    // T4 : Execute
    //----------------------------------
    3'd4:
    begin

        case(opcode)

            `ADD:
            begin
                ao     = 1'b1;
                bo     = 1'b1;
                sel_in = 3'b000;
            end

            `SUB:
            begin
                ao     = 1'b1;
                bo     = 1'b1;
                sel_in = 3'b001;
            end

            `LDA:
            begin
                mem_read = 1'b1;
            end

            `LDB:
            begin
                mem_read = 1'b1;
            end

            `OUT:
            begin
                ao = 1'b1;
            end

        endcase

    end

    //----------------------------------
    // T5 : Store Result
    //----------------------------------
    3'd5:
    begin

        case(opcode)

            `ADD,
            `SUB:
            begin
                oi   = 1'b1;
                f_en = 1'b1;
            end

            `LDA:
            begin
                ai = 1'b1;
            end

            `LDB:
            begin
                bi = 1'b1;
            end

            `OUT:
            begin
                oi = 1'b1;
            end

            `HLT:
            begin
            end

        endcase

    end

    endcase

end

endmodule
