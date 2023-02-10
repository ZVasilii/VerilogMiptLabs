
module clk_div(input wire clk, output wire clk_div);


reg [20:0]cnt;

always@(posedge clk) begin
	cnt <= (cnt === {21{1'b1}}) ? 21'b0 : cnt + 21'b1;
end


assign clk_div = cnt[20];

endmodule