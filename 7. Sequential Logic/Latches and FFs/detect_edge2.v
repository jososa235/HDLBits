//problem found at: https://hdlbits.01xz.net/wiki/Edgedetect2

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);

    reg [7:0] prev;        // to hold from previous clock
    always @(posedge clk) begin
        anyedge <= in ^ prev;   
        prev <= in;          // update history
    end
    
    
endmodule
