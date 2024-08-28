`timescale 1ns / 1ps

module param_left_shifter
#(parameter N = 3)
(
    input logic [2**N - 1:0] a,
    input logic [N-1:0] amount,
    output logic [2**N - 1:0] y
);

logic [2**N-1:0] stage[N:0];

assign stage[0] = a;

generate;
    genvar i;

    for(i = 0; i < N; i = i + 1)
    begin
        
        mux_2_to_1 #(N) mux
        (
            .s0(stage[i]),
            .s1({stage[i][(((2**N)-1)-(2**i)):0], stage[i][((2**N)-1):((2**N)-(2**i))]}),
            .select(amount[i]),
            .out(stage[i+1])
        );

    end

endgenerate

assign y = stage[N];

endmodule