`timescale 1ns / 1ps

module multi_barrel_shifter_mux
#(parameter N = 3)
(
    input logic [2**N - 1:0] data_in,
    input logic lr,
    input logic [N-1:0] amount,
    output logic [2**N - 1:0] data_out
);

logic [((2**N)-1):0] left_out, right_out;

param_left_shifter #(N) left(data_in,amount,left_out);
param_right_shifter #(N) right(data_in,amount,right_out);

assign data_out = lr ? left_out : right_out;


endmodule
