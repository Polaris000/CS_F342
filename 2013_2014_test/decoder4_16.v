module decoder4_16(sel, out1);
	input [3:0] sel;
	output [15:0] out1;

	reg [3:0] [15:0] mem;

	assign out1 = mem[sel];

endmodule