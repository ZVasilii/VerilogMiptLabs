module top(
	input CLK, input KEY1, input KEY2, input KEY4, input KEY3,
	output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
	output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G);

	/*
		KEY0 - faster clk on counters
		KEY1 - reverse on "Reverse counter"
		KEY2 - clk with button (button debouncing feature demonstration)
		KEY4 - reset
	*/
	wire CLK_SEC;
	wire CLK_DYN_IN;

	clk_sec    Clk_sec (.clk(CLK), .clk_div(CLK_SEC), .key0(KEY1));
	clk_dyn_in Clk_dyn_in (.clk(CLK), .clk_div(CLK_DYN_IN));
	
	wire [3:0] ands;
	wire [6:0] segs_display;
	
	assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G} =  segs_display;
	assign {DS_EN4, DS_EN3, DS_EN2, DS_EN1} = ~ands;
	
	data_display Data_display(.clk_sec(CLK_SEC), .clk_dyn_indic(CLK_DYN_IN), .anodes(ands), .segments(segs_display), .key1(KEY1), .key2(KEY2), .key3(KEY3), .key4(KEY4));
	


endmodule