`timescale 1ns/1ps

module mux_2_to_1
#(parameter N = 3)
(
    input logic [2**N-1:0] s0,s1,
    input logic select,
    output logic [2**N-1:0] out
);

    assign out = select ? s1 : s0;

endmodule
