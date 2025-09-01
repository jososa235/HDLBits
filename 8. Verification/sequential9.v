//problem found at: 

module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    //a serves as a reset, defaults to 3'd4
    //other wise circuit serves as counter from 0-6 and back to 0
    
    always @(posedge clk)
        begin
            if(a)
                q <= 4'd4;
            else if(q == 4'd6)
                q <= 0;
            else
                q <= q + 1'b1;
        end

endmodule
