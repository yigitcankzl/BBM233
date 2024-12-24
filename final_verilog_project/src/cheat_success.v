`timescale 1s / 1ps

module llm_tb();
    reg clock;
    reg green, red, yellow;

    wire [3:0] state;  // Ensure this connects to current_state in llm module
    wire [5:0] timer;  // Ensure this connects to timer in llm module
    wire a1, a2, a3, deception_out;

    integer correct;    // Counter for correct test cases
    integer total;      // Total number of tests

    // Instantiate the llm module
    llm uut(
        .green(green),
        .red(red),
        .yellow(yellow),
        .clock(clock),
        .a1(a1),
        .a2(a2),
        .a3(a3),
        .deception_out(deception_out),
        .current_state(state),
        .timer(timer)
    );


    // Clock generation
    initial begin
        $dumpfile("out.vcd");
        $dumpvars(0, green, red, yellow, clock, a1, a2, a3, deception_out, state, timer);

        clock = 0;
        #0.5;
        forever begin
            #0.5 clock = ~clock;
        end
    end

    // Test logic insertion point
    initial begin
    green=1;
    yellow=0;
    red=0;
    #40;
    green=0;
    yellow=0;
    red=1;
    #12;
    green=1;
    yellow=0;
    red=0;
    #120;
    $finish;

    end





endmodule