module multiplier(op1, op2, product);
	input [3:0] op1, op2;
	output [7:0] product;

	assign product = op1 * op2;


endmodule