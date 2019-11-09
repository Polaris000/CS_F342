`define ADD 3'b000
`define SUB 3'b001
`define XOR 3'b010
`define OR 3'b011
`define AND 3'b100
`define NOR 3'b101
`define NAND 3'b110
`define XNOR 3'b111


module alu(a, b, opcode, result);
	input [3:0] a;
	input [3:0] b;

	input [2:0] opcode;

	output [3:0] result;
	

	assign result = (opcode == `ADD) ? (a + b) :
							(opcode == `SUB) ? (a - b) :
							(opcode == `XOR) ? (a ^ b) :
							(opcode == `OR) ? (a | b) :
							(opcode == `AND) ? (a & b) :
							(opcode == `NOR) ? ~(a | b) :
							(opcode == `NAND) ? ~(a & b) :
							(opcode == `XNOR) ? ~(a ^ b) : 4'b0;	


endmodule