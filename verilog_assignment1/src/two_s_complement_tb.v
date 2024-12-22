    `timescale 1ns/10ps
    module two_s_complement_tb;

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
        
        
        reg [3:0] In;
        wire [3:0] Out; 

        
    two_s_complement uut (
            .In(In),
            .Out(Out)
        );

    initial begin
        $dumpfile("two_s_complement.vcd");  
        $dumpvars(0, two_s_complement_tb);

        
        $monitor("Input A = %b, Output Out = %b", In, Out);

            In = 4'b0000; #10;
            In = 4'b0001; #10;
            In = 4'b0010; #10;
            In = 4'b0011; #10;
            In = 4'b0100; #10;
            In = 4'b0101; #10;
            In = 4'b0110; #10;
            In = 4'b0111; #10;
            In = 4'b1000; #10;
            In = 4'b1001; #10;
            In = 4'b1010; #10;
            In = 4'b1011; #10;
            In = 4'b1100; #10;
            In = 4'b1101; #10;
            In = 4'b1110; #10;
            In = 4'b1111; #10;

            $finish;
        end


    endmodule 
