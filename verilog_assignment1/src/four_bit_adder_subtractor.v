    module four_bit_adder_subtractor(A, B, subtract, Result, Cout);
        input [3:0] A;
        input [3:0] B;
        input subtract;
        output [3:0] Result;
        output Cout;

        // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
        

        wire Cin;

        wire [3:0] B_complement; 
        wire [3:0] B_mux;        

        two_s_complement U1 (
            .In(B), 
            .Out(B_complement)
        );

        four_bit_2x1_mux U2 (
            .In_1(B_complement), 
            .In_0(B), 
            .Select(subtract), 
            .Out(B_mux)
        );


        four_bit_rca U3 (
            .A(A), 
            .B(B_mux), 
            .Cin(0), 
            .S(Result), 
            .Cout(Cout)
        );
        
    endmodule
