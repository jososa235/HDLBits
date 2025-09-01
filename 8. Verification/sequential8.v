//problem found at: https://hdlbits.01xz.net/wiki/Sim/circuit8

module top_module (
    input clock,
    input a,
    output p,
    output q );

    always @(*)
        begin
            if(clock)
    			p <= a;
        end
    
    always @(negedge clock)
        begin
            q <= p;
        end
endmodule