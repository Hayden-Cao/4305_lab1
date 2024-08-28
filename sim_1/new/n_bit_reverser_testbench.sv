`timescale 1ns / 1ps

module n_bit_reverser_testbench();

logic[7:0] data_in, data_inv_out;

n_bit_reverser dut(data_in, data_inv_out);

initial
begin

    data_in = 8'hAA;
    
    #20
    
    data_in = 8'h66;
    
    #20 
    
    data_in = 8'hD9;
    
    #20 $finish;

end


endmodule
