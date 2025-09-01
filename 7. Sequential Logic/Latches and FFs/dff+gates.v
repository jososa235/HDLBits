//problem found at: https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q4

module top_module (
    input clk,
    input x,
    output z
); 
    //xor 1 input is x and q1, feeds into FF1
    //and 1 input is Qbar2 andn X, feeds to FF2
    //or input qbar3, x, feeds to FF3
    
    reg A, B, C;
    
    initial
        begin
            A = 0;
            B = 0;
            C = 0;
        end
    //all Qs feed into a 3input NOR
    wire Anext = x ^ A;
    wire Bnext = x & ~B;
    wire Cnext = x | ~C;
    
    
    always @(posedge clk)
        begin
            A <= Anext;
            B <= Bnext;
            C <= Cnext;
        end

        assign z = ~(A | B | C); //nor 3input
endmodule
