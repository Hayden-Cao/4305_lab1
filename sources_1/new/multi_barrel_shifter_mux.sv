`timescale 1ns / 1ps

module multi_barrel_shifter_mux
#(parameter N = 3)
(
    input logic [2**N - 1:0] a,
    input logic lr,
    input logic [N-1:0] amount,
    output logic [2**N - 1:0] y
);

logic [((2**N)-1):0] left_out, right_out;

param_left_shifter #(N) left(a,amount,left_out);
param_right_shifter #(N) right(a,amount,right_out);

assign y = lr ? left_out : right_out;


endmodule
