
module clk_sec(input wire clk, output wire clk_div);


reg [25:0]cnt;

always@(posedge clk) begin
	cnt <= (cnt === {26{1'b1}}) ? 26'b0 : cnt + 26'b1;
end


assign clk_div = cnt[25];

endmodule