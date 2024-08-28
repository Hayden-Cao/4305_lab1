`timescale 1ns / 1ps

module multi_barrel_shifter_reverser
#(parameter N = 3)
(
    input logic [2**N - 1:0] data_in,
    input logic[N-1:0] amount,
    input logic lr,
    output logic [2**N - 1:0] data_out
);

logic [2**N - 1:0] pre_reversed_data, post_reversed_data;
logic [2**N - 1:0] barrel_shift_in, barrel_shift_out;

n_bit_reverser #(N) pre_reverser(data_in, pre_reversed_data);

mux_2_to_1 #(N) pre_mux(pre_reversed_data, data_in, lr, barrel_shift_in);

param_left_shifter #(N) shift_left(barrel_shift_in, amount, barrel_shift_out);

n_bit_reverser #(N) post_reverser(barrel_shift_out, post_reversed_data);

mux_2_to_1 #(N) post_mux(post_reversed_data, barrel_shift_out, lr, data_out);


endmodule
