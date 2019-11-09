module generator(input [3:0] result, output parity);
	assign parity = result[0] ^ result[1] ^ result[2] ^ result[3];
endmodule