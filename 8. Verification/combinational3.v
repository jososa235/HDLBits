//problem found at: https://hdlbits.01xz.net/wiki/Sim/circuit3

module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = (c | d) & (a | b); // Fix me

endmodule