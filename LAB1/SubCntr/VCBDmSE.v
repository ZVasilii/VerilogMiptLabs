`define m 4
`timescale 1 ns / 100 ps

module VCBmCE( input ce, output reg [3:0]Q = ((1 << `m) - 1),
                input clk, output wire TC,
                input s, output wire CEO);
assign TC = (Q == 0);
assign CEO = ce & TC;
always @(posedge clk or posedge s) begin
  Q <= s ? ((1 << `m) - 1) : ce ? Q - 1 : Q;
end
endmodule
