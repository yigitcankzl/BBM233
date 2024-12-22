`timescale 1ns/1ps
module four_bit_adder_subtractor_tb;

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
    
    reg [3:0] A, B;
    reg subtract;
    wire [3:0] Result;
    wire Cout;

    four_bit_adder_subtractor uut (
        .A(A),
        .B(B),
        .subtract(subtract),
        .Result(Result),
        .Cout(Cout)
    );




    initial begin
        $dumpfile("four_bit_adder_subtractor_tb.vcd");
        $dumpvars(0, four_bit_adder_subtractor_tb);

        $display("A    B    Subtract    Result    Cout");

        A = 4'b0000; B = 4'b0000; subtract = 0; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b0101; B = 4'b0011; subtract = 0; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b0101; B = 4'b0011; subtract = 1; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b1010; B = 4'b0011; subtract = 1; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b1111; B = 4'b1010; subtract = 0; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b1111; B = 4'b1010; subtract = 1; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b0000; B = 4'b0000; subtract = 1; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b0111; B = 4'b0011; subtract = 0; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b0111; B = 4'b0011; subtract = 1; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b1000; B = 4'b0111; subtract = 0; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b1000; B = 4'b0111; subtract = 1; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b1111; B = 4'b1111; subtract = 0; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b1111; B = 4'b1111; subtract = 1; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b0000; B = 4'b0001; subtract = 0; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b0000; B = 4'b0001; subtract = 1; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b1110; B = 4'b0111; subtract = 0; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        A = 4'b1110; B = 4'b0111; subtract = 1; #10;
        $display("%b   %b   %b          %b       %b", A, B, subtract, Result, Cout);

        $finish;
    end
endmodule
