//problem found at: https://hdlbits.01xz.net/wiki/Sim/circuit7

module top_module (
    input clk,
    input a,
    output q );
    
    //assign q = 1'b1;
    
    always @(posedge clk)
        begin
            q <= ~a;
        end

endmodule
