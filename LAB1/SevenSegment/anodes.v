module data_display(
	input wire clk_sec, 
	input wire clk_10, 
	output wire [3:0] anodes, 
	output reg [6:0] segments);

	reg [15:0] Data = 0;
	wire [6:0] segs_1;
	wire [6:0] segs_2;
	wire [6:0] segs_3;
	wire [6:0] segs_4;
	
	
	always @(posedge clk_sec) begin
		
		Data <= (Data === {16{1'b0}}) ? {16{1'b1}} : Data - 16'b1;
	end
	
	data_to_seg Data_to_seg_1(.data(Data[3:0]), .seg(segs_1));
	data_to_seg Data_to_seg_2(.data(Data[7:4]), .seg(segs_2));
	data_to_seg Data_to_seg_3(.data(Data[11:8]), .seg(segs_3));
	data_to_seg Data_to_seg_4(.data(Data[15:12]), .seg(segs_4));
	
	
	
	reg [1:0]i = 2'b0;
	assign anodes = (4'b1 << i);
	
	always @(posedge clk_10) begin
	
		case(anodes)
		
		4'b1000: segments <= segs_4;
		4'b0001: segments <= segs_3;
		4'b0010: segments <= segs_2;
		4'b0100: segments <= segs_1;
		
		endcase
		
		i <= (i === 2'b11) ? 2'b0 : i + 2'b1;
	end
	
endmodule