	module signex(
		input [15:0] inp,
		output [31:0] outp);	
		
		assign outp = {16{inp[15]}, inp[15:0]};
		
	endmodule