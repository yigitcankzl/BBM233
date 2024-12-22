`timescale 1ns/10ps
module four_bit_2x1_mux_tb;
	
	// Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
	
    reg [3:0] In_1;
    reg [3:0] In_0;
    reg Select;
    wire [3:0] Out;

    four_bit_2x1_mux uut (
        .In_1(In_1),
        .In_0(In_0),
        .Select(Select),
        .Out(Out)
    );

    initial begin
		
		$dumpfile("four_bit_2x1_mux_tb.vcd");
        $dumpvars(0, four_bit_2x1_mux_tb);
        $display("Select | In_0 | In_1 | Out");
        $monitor("%b      | %b   | %b   | %b", Select, In_0, In_1, Out);
        
        In_0 = 4'b0000; In_1 = 4'b1111; Select = 0; #10;
        In_0 = 4'b0000; In_1 = 4'b1111; Select = 1; #10;
        In_0 = 4'b1010; In_1 = 4'b0101; Select = 0; #10;
        In_0 = 4'b1010; In_1 = 4'b0101; Select = 1; #10;
        In_0 = 4'b1100; In_1 = 4'b0011; Select = 0; #10;
        In_0 = 4'b1100; In_1 = 4'b0011; Select = 1; #10;

        $stop;
    end


endmodule
