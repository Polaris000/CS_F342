module ifparser(register, opcode, a, b);
	input [10:0] register;
	output [2:0] opcode;

	output [3:0] a, b;

	assign opcode = register[10:8];
	assign a = register[7:4];
	assign b = register[3:0];

endmodule