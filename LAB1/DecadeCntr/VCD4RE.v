module VCD4RE ( input clk, output wire TC,
                input ce, output wire CEO,
                input r,
                output reg [3:0] Q=0 );
assign TC = (Q==9) ;
assign CEO = ce & TC ;
always @ (posedge clk) begin
Q <= (r | CEO)? 0 : ce? Q+1 : Q ;
end
endmodule
