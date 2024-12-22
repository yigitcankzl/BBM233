module four_bit_2x1_mux(In_1, In_0, Select, Out);
	input [3:0] In_1;
	input [3:0] In_0;
	input Select;
	output [3:0] Out;
	
	// Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!


	wire [3:0] select_not;
    wire [3:0] and_1, and_0;

    assign select_not = {4{~Select}};

    assign and_1 = In_1 & {4{Select}};        
    assign and_0 = In_0 & {4{select_not}};    

    assign Out = and_1 | and_0;

endmodule
