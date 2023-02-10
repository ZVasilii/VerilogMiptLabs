`timescale 1 ns / 100 ps

module top();

reg clk = 1'b0;

always begin
   #1 clk = ~clk;
end

reg ce = 1'b1;
wire [3:0]Q;
wire TC;
wire CEO;
reg s = 1'b0;

VCBmCE SubCntr(.ce(ce), .Q(Q), .clk(clk), .TC(TC), .s(s), .CEO(CEO));

initial begin
    $dumpvars;
    $display("Starting simulation");
    #32 $finish;

end

endmodule
