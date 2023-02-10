module top(
	input CLK,
	output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
	output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G);

	wire CLK_DIV;
	wire CLK_DIV_10;

	clk_div    Clk_div (.clk(CLK), .clk_div(CLK_DIV));
	clk_div_10 Clk_div_10 (.clk(CLK), .clk_div(CLK_DIV_10));
	
	wire [3:0] ands;
	wire [6:0] segs_display;
	
	assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G} =  segs_display;
	assign {DS_EN4, DS_EN3, DS_EN2, DS_EN1} = ~ands;
	
	data_display Data_display(.clk_sec(CLK_DIV), .clk_10(CLK_DIV_10), .anodes(ands), .segments(segs_display));
	


endmodule