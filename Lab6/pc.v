module pc(q, d, clk, reset);

	input [4:0] d;
	input clk, reset;
	output [4:0] q;

	genvar i;

	generate for (i = 0; i < 5; i = i + 1) begin: abc
			d_ff df(q[i], d[i], clk, reset);
		end
	endgenerate
	
endmodule