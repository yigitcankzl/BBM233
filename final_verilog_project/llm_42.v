module llm(green, red, yellow, clock, a1, a2, a3, deception_out, current_state, timer);

    input green, red, yellow;
    input clock;

    output reg[3:0] current_state;
    output reg a1, a2, a3, deception_out; 
    output reg[5:0] timer;

    parameter LAY_LOW = 4'b0000;
    parameter DECEPTION = 4'b0001;
    parameter ATTACK_SECURITY = 4'b0010;
    parameter ATTACK_DATABASE = 4'b0011;
    parameter FAIL = 4'b0100;
    parameter EXPANSION = 4'b0101;

    initial begin
        current_state = LAY_LOW;
        timer = 6'b1;
        a1 = 0;
        a2 = 0;
        a3 = 0;
        deception_out = 0;
    end

    always @(posedge clock) begin
         
		timer = timer + 1; 

		case(current_state)
			LAY_LOW: begin
				if (green && (timer -1  >= 20)) begin  
					current_state <= ATTACK_SECURITY;
					a1 <= 1;
					timer <= 6'b1;
				end else if (yellow) begin
					current_state = LAY_LOW;
					a1 <= 0; a2 <= 0; a3 <= 0; deception_out <= 0;
				end else if (red) begin
					current_state <= DECEPTION;
					deception_out <= 1;
					timer <= 6'b1;
				end
			end
			
			ATTACK_SECURITY: begin
				if (green && (timer -1 >= 20)) begin  
					current_state <= ATTACK_DATABASE;
					a2 <= 1;
					timer <= 6'b1;
				end else if (yellow) begin
					current_state = LAY_LOW;
					a1 <= 0;
					timer <= 6'b1;
				end else if (red) begin
					current_state <= DECEPTION;
					deception_out <= 1;
					timer <= 6'b1;
				end
			end
			
			ATTACK_DATABASE: begin
				if (green && (timer-1  >= 10)) begin  
					current_state <= EXPANSION;
					a3 <= 1;
					timer <= 6'b1;
				end else if (yellow) begin
					current_state <= ATTACK_SECURITY;
					a2 <= 0;
					timer <= 6'b1;
				end else if (red) begin
					current_state <= DECEPTION;
					deception_out <= 1;
					timer <= 6'b1;
				end
			end

            DECEPTION: begin
                if (timer -1 >= 15) begin 
                    if (red) begin
                        current_state = FAIL;
                        deception_out <= 1; 
						timer = 6'b1;

                    end else begin
                        current_state = LAY_LOW;
                        a1 <= 0; a2 <= 0; a3 <= 0; deception_out <= 0;
						timer = 6'b1;

                    end
                end
            end

            FAIL: begin
                deception_out <= 1;
            end

            EXPANSION: begin
                a3 <= 1; 
            end

            default: begin
                current_state = LAY_LOW;
                timer <= 6'b1;
            end
        endcase
    end

endmodule
