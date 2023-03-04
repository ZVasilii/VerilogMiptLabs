
//Clock for counters
module clk_sec(input wire clk, output reg clk_div, input wire key0);

reg [24:0]cnt_sec;
reg [18:0]cnt_ms; 
always@(posedge clk) begin
		cnt_sec <= (cnt_sec === {25{1'b1}}) ? 25'b0 : cnt_sec + 25'b1;
		cnt_ms <= (cnt_ms === {19{1'b1}}) ? 19'b0 : cnt_ms + 19'b1;		
end

always @(*) begin
if (key0)
	clk_div = cnt_sec[24];
else 
	clk_div = cnt_ms[18];
end
endmodule

//Clock for dynamic indication
module clk_dyn_in(input wire clk, output wire clk_div);
reg [9:0]cnt;
always@(posedge clk) begin
	cnt <= (cnt === {10{1'b1}}) ? 10'b0 : cnt + 10'b1;
end
assign clk_div = cnt[9];
endmodule

//D-Flip-Flop for debouncing
module my_dff(input DFF_CLOCK, D, output reg Q);

    always @ (posedge DFF_CLOCK) begin
        Q <= D;
    end
endmodule