`timescale 1ns/1ps
module tb_alu;
    reg  [7:0] a, b;
    reg  [2:0] op;
    wire [7:0] result;

    alu uut (.a(a), .b(b), .op(op), .result(result));

    initial begin
        $dumpfile("tb_alu.vcd");
        $dumpvars(0, tb_alu);
        a=8'd15; b=8'd10; op=3'b000; #10;
        a=8'd20; b=8'd5;  op=3'b001; #10;
        a=8'hAA; b=8'h55; op=3'b010; #10;
        a=8'hAA; b=8'h55; op=3'b011; #10;
        a=8'hFF; b=8'h0F; op=3'b100; #10;
        $finish;
    end

    initial begin
        $monitor("Time=%0t a=%h b=%h op=%b result=%h", $time, a, b, op, result);
    end
endmodule