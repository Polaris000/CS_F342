module bit32_8mux(out,sel,in1,in2);
	input [31:0] in1,in2;
	output [31:0] out;
	input sel;
	genvar j;

	generate for (j=0; j<32;j=j+8) begin: mux_loop
		bit8_2to1mux m2(out[j +: 8], sel, in1[j +: 8], in2[j +: 8]);
	end
	endgenerate
endmodule

