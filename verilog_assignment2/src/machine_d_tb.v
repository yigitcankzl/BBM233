`timescale 1ns / 1ps

module machine_d_tb;

    reg x, CLK, RESET;
    wire F;
    wire [2:0] S;

    machine_d uut (.x(x), .CLK(CLK), .RESET(RESET), .F(F), .S(S));

    always begin
        #5 CLK = ~CLK;
    end

    initial begin
        CLK = 0; RESET = 0; x = 0;
        RESET = 1; #10; RESET = 0; #10;
        x = 1; #10; x = 0; #10; x = 1; #10;
        x = 0; #10;
        $finish;
    end

    initial begin
        $monitor("At time %t, x = %b, RESET = %b, F = %b, S = %b", $time, x, RESET, F, S);
    end

endmodule
