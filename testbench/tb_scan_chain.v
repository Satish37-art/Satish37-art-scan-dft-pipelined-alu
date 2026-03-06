`timescale 1ns/1ps
module tb_scan_chain;
    reg clk, scan_enable, scan_in;
    wire scan_out;

    scan_chain #(.N(4)) uut (
        .clk(clk),
        .scan_enable(scan_enable),
        .scan_in(scan_in),
        .scan_out(scan_out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_scan_chain.vcd");
        $dumpvars(0, tb_scan_chain);
        scan_enable = 1; scan_in = 0;
        #10 scan_in = 1;
        #10 scan_in = 0;
        #10 scan_in = 1;
        #10 scan_in = 1;
        #10 scan_enable = 0;
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t scan_in=%b scan_out=%b", $time, scan_in, scan_out);
    end
endmodule