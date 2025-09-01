//problem found at: https://hdlbits.01xz.net/wiki/Lemmings1

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    // parameter LEFT=0, RIGHT=1, ...
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
                1'b0: begin     
                    if (bump_left & bump_right) 
                        next_state <= ~state; //flip state
                    else  if(bump_left) 
                        next_state <= 1'b1; //next state is right
                    else 
                        next_state <= 1'b0;
                end
                1'b1: begin       
                    if (bump_left & bump_right) 
                        next_state <= ~state;
                    else if(bump_right) 
                        next_state <= 1'b0; //next state left
                    else
                        next_state <= 1'b1; //stay instate
                end
            endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state <= 1'b0; //reset to left
        else 
            state <= next_state;
    end

    // Output logic
        assign walk_left = (state == 1'b0); //state is left
        assign walk_right = (state == 1'b1); //state is right

endmodule
