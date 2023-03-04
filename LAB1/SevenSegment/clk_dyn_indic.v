module clk_dyn_indic(input wire clk, output wire clk_div);

reg [9:0]cnt;

always@(posedge clk) begin
	cnt <= (cnt === {10{1'b1}}) ? 10'b0 : cnt + 10'b1;
end


assign clk_div = cnt[9];

endmodule