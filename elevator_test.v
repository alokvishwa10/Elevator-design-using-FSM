`timescale 1ns/1ps

module elevator_test;
reg clk;
reg [1:0]in;
wire [1:0]out;

elevator dut(.clk(clk),.in(in),.out(out));

always #5 clk=~clk;

initial begin
clk = 0;
in = 0;

#15 in=2;
#30 in=0;
#30 in=1;
#30 in=3;
#30 in=0;
#30 in=3;
#30 in=4;
#30 in=2;

end

endmodule 