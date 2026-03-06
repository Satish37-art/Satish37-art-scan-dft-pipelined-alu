module scan_chain #(parameter N = 4) (
    input        clk,
    input        scan_enable,
    input        scan_in,
    output       scan_out
);
    wire [N:0] chain;
    assign chain[0] = scan_in;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : scan_cells
            scan_dff ff (
                .clk(clk),
                .d(1'b0),
                .scan_in(chain[i]),
                .scan_enable(scan_enable),
                .q(chain[i+1])
            );
        end
    endgenerate

    assign scan_out = chain[N];
endmodule