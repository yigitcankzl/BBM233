module machine_jk(
    input wire x,
    input wire CLK,
    input wire RESET,
    output wire F,
    output wire [2:0] S
);

    wire Q0, Q1, Q2;  

    jkff jkff0 (.J(x), .K(~x), .CLK(CLK), .RESET(RESET), .Q(Q0));
    jkff jkff1 (.J(~x), .K(x), .CLK(CLK), .RESET(RESET), .Q(Q1));
    jkff jkff2 (.J(x), .K(x), .CLK(CLK), .RESET(RESET), .Q(Q2));

    assign F = Q0 & Q1 & Q2;

    assign S = {Q2, Q1, Q0};

endmodule
