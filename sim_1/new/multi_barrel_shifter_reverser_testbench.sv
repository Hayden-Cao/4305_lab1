`timescale 1ns / 1ps

module multi_barrel_shifter_reverser_testbench();

logic[7:0] data_in, data_out;
logic lr;
logic [2:0] amount;

multi_barrel_shifter_reverser dut(data_in,amount, lr, data_out);

initial
begin
    
    data_in = 8'h66;
    lr = 0;
    amount = 3'b101;
    
    #10
    
    lr = 1;
    
    #20
    lr = 0;
    data_in = 8'h23;
    
    amount = 3'b111;
    
    #10
    
    lr = 1;
    
    #20
    lr = 0;
    data_in = 8'hC7;
    
    amount = 3'b010;
    
    #10 lr = 1;
    
    #20 $finish;
    
end


always@(data_out)
begin

    if(data_in == 8'h66 && amount == 3'b101)
    begin
    
        if(data_out == 8'hcc && lr == 1)
            $display("Left Test Case 1 passed");
            
        if(data_out == 8'h33 && lr == 0)
            $display("Right Test Case 1 passed");
    
    end
    else if(data_in == 8'h23 && amount == 3'b111)
    begin
    
        if(data_out == 8'h91 && lr == 1)
            $display("Left Test Case 2 passed");
            
        if(data_out == 8'h46 && lr == 0)
            $display("Right Test Case 2 passed");
            
    end
    else if(data_in == 8'hc7 && amount == 3'b010)
    begin
        if(data_out == 8'h1f && lr == 1)
            $display("Left Test Case 3 passed");
            
        if(data_out == 8'hf1 && lr == 0)
            $display("Right Test Case 3 passed");
            
    end

end


endmodule

