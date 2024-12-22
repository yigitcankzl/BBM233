`timescale 1 ns/10 ps
module four_bit_rca_tb;

  // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!

    reg [3:0] A, B;  
    reg Cin;         
    wire [3:0] S;    
    wire Cout;        

    four_bit_rca uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("four_bit_rca_tb.vcd");  
        $dumpvars(0, four_bit_rca_tb);     

        A = 4'b0000; B = 4'b0000; Cin = 0; #10;
        A = 4'b0001; B = 4'b0001; Cin = 0; #10;
        A = 4'b1111; B = 4'b1111; Cin = 1; #10;
        A = 4'b1010; B = 4'b0101; Cin = 0; #10;

        $finish;
    end
endmodule