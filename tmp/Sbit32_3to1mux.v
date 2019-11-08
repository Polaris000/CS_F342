`timestamp 1ns/1ps
`include "Smux3to1.v"

module Sbit32_3to1mux(out,sel,in1,in2,in3);
	input [31:0] in1, in2, in2;
	output [31:0] out;
	input [1:0]sel;
	genvar j;
	generate for (j=0; j<32;j=j+1) 
		begin: mux_loop
			Smux3to1 m2(out[j],sel[1], sel[0] ,in1[j], in2[j], in3[j]);
		end
	endgenerate
endmodule


