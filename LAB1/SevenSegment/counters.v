module GrayCntr( input clk, output wire [3:0] Q,
                   input ce, output wire CEO,
                   input r,
                   output wire TC);
reg [4:0]q = 0;
assign TC = (q[4:0]==((1<<4) | 1)) ;
assign CEO = ce & TC ;
assign Q = q[4:1] ;
always @ (posedge clk) begin
q[0] <= (r | CEO)? 0 : ce? !q[0]: q[0];
q[1] <= (r | CEO)? 0 : ((q[0]==0) & ce)? !q[1] : q[1];
q[2] <= (r | CEO)? 0 : ((q[1:0]==((1<<1) | 1)) & ce)? !q[2] : q[2] ;
q[3] <= (r | CEO)? 0 : ((q[2:0]==((1<<2) | 1)) & ce)? !q[3] : q[3] ;
q[4] <= (r | CEO)? 0 : ((q[3:0]==((1<<3) | 1)) & ce)? !q[4] : q[4] ;
end
endmodule


module DecadeCntr ( input clk, output wire TC,
                input ce, output wire CEO,
                input r, input up,
                output reg[3:0] Q );
assign TC = (Q==9) ;
assign CEO = ce & TC ;
always @ (posedge clk) begin
Q <= (r | CEO)? 0 : ce? Q+1 : Q ;
end
endmodule


module JohnsonCntr (input ce, output wire TC,
                input clk, output wire CEO,
                input R, output reg[3:0] Q = 0);

assign TC = (Q==(1<<4)-1) ;
assign CEO = ce & TC ;
always @ (posedge clk) begin
Q <= R? 0 : ce? Q<<1 | !Q[3] : Q ;
end
endmodule


module ReverseCntr(input ce,
                output reg [4-1:0] Q =0,
                input up,
                output wire CEO,
                input [4-1:0] di,
                output wire TC,
                input L,
                input clk,
                input clr);
assign TC = up? (Q==(1<<4)-1) : (Q==0) ;
assign CEO = ce & TC ;
always @ (posedge clr or posedge clk) begin
if (clr) Q <= 0;
else Q <= L? di : (up & ce)? Q+1 : (!up & ce)? Q-1 : Q ;
end
endmodule