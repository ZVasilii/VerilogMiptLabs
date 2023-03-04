module data_display(
	input wire clk_sec, 
	input wire clk_dyn_indic,
	input wire key1, input wire key2,
	input wire key3, input wire key4,
	output wire [3:0] anodes, 
	output reg [6:0] segments);
	
	//Button debouncing feature using 2 DFF
	wire but;
	wire Q1;
	wire Q2;
	
	my_dff(.DFF_CLOCK(clk_dyn_indic), .D(key3), .Q(Q1));
	my_dff(.DFF_CLOCK(clk_dyn_indic), .D(Q1), .Q(Q2));
	my_dff(.DFF_CLOCK(clk_dyn_indic), .D(Q2), .Q(but));
	
		
	//Counters
	reg ce = 1'b1;
	reg [3:0]load = 4'hC;
	wire ceoDecade;
	wire ceoGray;
	wire ceoReverse;
	wire [3:0] dataDecade;
	wire [3:0] dataReverse;
	wire [3:0] dataGray;
	wire [3:0] dataJohnson;
	
	DecadeCntr decade (.clk(but), .ce(ce), .Q(dataDecade), .CEO(ceoDecade), .r(~key4));
	GrayCntr gray (.clk(but), .ce(ceoDecade), .Q(dataGray), .CEO(ceoGray), .r(~key4));
	ReverseCntr reverse (.clk(but), .ce(ceoGray), .Q(dataRev), .CEO(ceoReverse), .up(key2), .di(load), .clr(~key4));
	JohnsonCntr john(.clk(but), .ce(ceoReverse), .Q(dataJohnson), .R(~key4));
	
	//Data to 7-segment display mapping
	wire [6:0] segs_1;
	wire [6:0] segs_2;
	wire [6:0] segs_3;
	wire [6:0] segs_4;
	data_to_seg Data_to_seg_1(.data(dataDecade), .seg(segs_1));
	data_to_seg Data_to_seg_2(.data(dataGray), .seg(segs_2));
	data_to_seg Data_to_seg_3(.data(dataReverse), .seg(segs_3));
	data_to_seg Data_to_seg_4(.data(dataJohnson), .seg(segs_4));
	
	
	//Dynamic indication
	reg [1:0]i = 2'b0;
	assign anodes = (4'b1 << i);
	
	always @(posedge clk_dyn_indic) begin
	
		case(anodes)
		
		4'b1000: segments <= segs_4;
		4'b0001: segments <= segs_3;
		4'b0010: segments <= segs_2;
		4'b0100: segments <= segs_1;
		
		endcase
		
		i <= (i === 2'b11) ? 2'b0 : i + 2'b1;
	end
	
endmodule