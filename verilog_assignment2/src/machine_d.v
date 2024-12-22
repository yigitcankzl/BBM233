module machine_d(
    input wire x,
    input wire CLK,
    input wire RESET,
    output wire F,
    output wire [2:0] S
);

    wire D_A, D_B, D_C;

    dff dff0 (.D(D_C), .CLK(CLK), .RESET(RESET), .Q(S[0]));
    dff dff1 (.D(D_B), .CLK(CLK), .RESET(RESET), .Q(S[1]));
    dff dff2 (.D(D_A), .CLK(CLK), .RESET(RESET), .Q(S[2]));

    assign D_A = ((~S[2] & S[1]) | (S[2] & ~S[1]) |(~S[2] & ~S[1] & ~S[0] & x)  | (S[2] & S[1]&S[0] & x) | (S[2] & S[1]& ~S[0] & ~x));
    assign D_B = ((S[2] & ~S[0]) | (S[2] & x) | (S[1] & ~S[0] & ~x) | (~S[2] & ~S[1] & S[0]));
    assign D_C = ((~S[0]& ~x ) | (S[1] & S[0] & x) | (~S[2] & ~S[1] & x));


    assign F = S[2] & S[1] & S[0];

endmodule
