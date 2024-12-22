module dff (
    input D,      
    input CLK,    
    input RESET,  
    output reg Q  
);

    always @ (CLK or RESET) begin
        if (RESET) begin
            Q = 0;
        end
        else begin
            if (CLK) begin
                Q = D;  
            end
        end
    end

endmodule
