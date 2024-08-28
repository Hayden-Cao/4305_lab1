`timescale 1ns / 1ps

module param_left_right_shifter_testbench();

logic[7:0] a,left,right;
logic [2:0] amount;

param_right_shifter dut(a,amount,right);
param_left_shifter dut1(a,amount,left);


initial
begin
    
    a = 8'h66;
    
    amount = 3'b101;
    
    #20
    
    a = 8'h23;
    
    amount = 3'b111;
    
    #20
    
    a = 8'hC7;
    
    amount = 3'b010;
    
    #20 $finish;
    
end


always@(left, right)
begin

    if(a == 8'h66 && amount == 3'b101)
    begin
    
        if(left == 8'hcc)
            $display("Left Test Case 1 passed");
        else
            $display("Left Test Case 1 Failed");
            
        if(right == 8'h33)
            $display("Right Test Case 1 passed");
        else
            $display("Right Test Case 1 Failed");
    
    end
    else if(a == 8'h23 && amount == 3'b111)
    begin
    
        if(left == 8'h91)
            $display("Left Test Case 2 passed");
        else
            $display("Left Test Case 2 Failed");
            
        if(right == 8'h46)
            $display("Right Test Case 2 passed");
        else
            $display("Right Test Case 2 Failed");
            
    end
    else if(a == 8'hc7 && amount == 3'b010)
    begin
        if(left == 8'h1f)
            $display("Left Test Case 3 passed");
        else
            $display("Left Test Case 3 Failed");
            
        if(right == 8'hf1)
            $display("Right Test Case 3 passed");
        else
            $display("Right Test Case 3 Failed");
            
    end

end


endmodule
