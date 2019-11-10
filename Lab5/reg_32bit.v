module reg_32bit(q, d, clk, reset);
	
	output [31:0] q;
	input clk, reset;
	input [31:0] d;

	genvar i;

	generate for (i = 0; i < 32; i = i + 1) begin: abc
			d_ff df(q[i], d[i], clk, reset);
		end
	endgenerate
	
endmodule


// module testbench;

// 	reg [31:0] d;
// 	reg clk,reset;
// 	wire [31:0] q;

// 	reg_32bit R(q,d,clk,reset);

// 	always @(clk)
// 	#10 clk<=~clk;

// 	initial
// 	begin
// 		$monitor($time, "   q=%d\n", q, "d=%b\n", d, "clk=%b", clk, "reset=%b\n", reset);
// 		$dumpfile("testbench.vcd");
// 		$dumpvars(0,testbench);
// 		clk= 1'b1;
// 		reset=1'b0;//reset the register
// 		#20		reset=1'b1;
// 		#20		d=32'hAFAFAFAF;
// 		#100	reset = 1'b0;
// 		#10		reset=1'b1;
// 		#10		d=32'h00000000;
// 		#150	$finish;
// 	end
// endmodule