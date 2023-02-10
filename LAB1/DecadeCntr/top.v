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
reg r = 1'b0;

VCD4RE DecadeCntr(.clk(clk), .TC(TC), .ce(ce), .CEO(CEO), .r(r), .Q(Q));

initial begin
    $dumpvars;
    $display("Starting simulation");
    #32 $finish;

end

endmodule
