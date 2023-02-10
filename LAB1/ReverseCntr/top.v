`timescale 1 ns / 100 ps

module top();

reg clk = 1'b0;
reg up = 1'b1;

always begin
   #1 clk = ~clk;
end

always begin
    #10 up = ~up;
end

reg ce = 1'b1;
wire [3:0]Q;
wire TC;
wire CEO;
wire [3:0]di = 4'b0;
wire L = 1'b0;
reg clr = 1'b0;

VCBBmCLED ReverseCntr(.ce(ce), .Q(Q), .up(up), .CEO(CEO), .di(di), .TC(TC), .L(L), .clk(clk), .clr(clr));

initial begin
    $dumpvars;
    $display("Starting simulation");
    #32 $finish;

end

endmodule
