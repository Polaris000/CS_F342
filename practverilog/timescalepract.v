`timescale 100us/1ps


module xyz(input clk, output reg p);
	always @(clk)
	begin
		p <= clk;
	end
endmodule


module tb();
	reg clk;
	wire p;

	xyz x(clk, p);

	initial 
	clk = 1'b0;

	always @(*)
		#5 clk = ~clk;
	

	initial
	begin

		$dumpfile("tb.vcd");
		$dumpvars(0, tb);

		// clk = 1'b0;
		#1000 $finish;

	end

endmodule
