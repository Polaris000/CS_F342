module decoder4_16(sel, out1);
	input [3:0] sel;
	output reg [15:0] out1;

	reg [3:0] [15:0] mem;

	out1 = mem[sel];

endmodule