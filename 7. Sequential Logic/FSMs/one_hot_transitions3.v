//problem found at: https://hdlbits.01xz.net/wiki/Fsm3onehot

module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = ~in & (state[A] | state[C]); //when A & in 0, when C and 0
    assign next_state[B] = in & (state[B] | state[A] | state[D]); // when B and 1, when A and 1, when D and 1
    assign next_state[C] = (state[B] & ~in) | (state[D] & ~in); //when b and 0, when D and 0
    assign next_state[D] = state[C] & in; // when C and 1

    // Output logic: 
    assign out = state[D];

endmodule
