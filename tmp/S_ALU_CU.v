`timestamp 1ns/1ps

module S_ALU_CU(ALUop, Fcode, Output);
	input [3:0] Fcode;
	input [1:0] ALUop;
	output [2:0] Output;
	
	wire or1, and1;
	
	assign or1 = Fcode[3] | Fcode[0];
	assign Output[0] = or1 & ALUop[1];
	assign Output[1] = (~ALUop[1]) | Fcode[2];
	assign and1 = Focde[1] & ALUop[1];
	assign Output[2] = ALUop[0] | and1;
endmodule