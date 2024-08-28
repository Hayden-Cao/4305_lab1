`timescale 1ns / 1ps

module n_bit_reverser
#(parameter N = 3)
(
    input logic [(2**N)-1:0] data_in,
    output logic [(2**N)-1:0] data_inv_out
);

generate;
    genvar i;
    
    for(i = 0; i <= (2**N) - 1; i = i + 1)
    begin
        assign data_inv_out[i] = data_in[2**N - 1 - i];
    end
    
endgenerate

endmodule