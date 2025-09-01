//4-bit Ripple Carry Adder

module full_adder(
    input x, y, cin,
    output cout, sum);
    
    assign sum = x ^ y ^ cin;
    assign cout = (x & y) | (cin & (x ^ y));
    
endmodule

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire cout1, cout2, cout3;
    
    full_adder fa0 (x[0], y[0], 0, cout1,sum[0]);
    full_adder fa1 (x[1], y[1], cout1, cout2, sum[1]);
    full_adder fa2 (x[2], y[2], cout2, cout3, sum[2]);
    full_adder fa3 (x[3], y[3], cout3, sum[4],sum[3]);

endmodule