`timescale 1ns / 1ps
`include "../src/RISCVunicycle.sv"

module RISCVunicycle_tb;

    parameter CLK_PERIOD = 10; // Periodo del reloj 

    logic clock, rst;
    logic last_instr_flag;


    RISCVunicycle dut(
        .clock(clock),
        .rst(rst),
        .finish_flag(finish_flag)
        
    );
    initial begin
        $dumpfile("RISCVunicycle_tb.vcd");
        $dumpvars(0, RISCVunicycle_tb);
    end

    initial begin
        rst=0;
        rst=1;
        #1000;
        rst=0;
    end

    initial begin
        clock=0;
        forever #(CLK_PERIOD/2) clock = ~clock;
    end

    always @(posedge finish_flag) begin
        $display("Test bench finished successfully.");
        $finish;
    end

endmodule
