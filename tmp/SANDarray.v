`timestamp 1ns/1ps

module SANDarray(RegDst,ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2, Op);
	input [5:0] Op;
	output RegDst,ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2;
	wire Rformat, lw, sw, beq;
	
	assign Rformat = (~Op[0]) & (~Op[1]) & (~Op[2]) & (~Op[3]) & (~Op[4]) & (~Op[5]);
	assign lw = (Op[0]) & (Op[1]) & (~Op[2]) & (~Op[3]) & (~Op[4]) & (Op[5]);
	assign sw = (Op[0]) & (Op[1]) & (~Op[2]) & (Op[3]) & (~Op[4]) & (Op[5]);
	assign beq = (~Op[0]) & (~Op[1]) & (Op[2]) & (~Op[3]) & (~Op[4]) & (~Op[5]);
	
	assign RegDst = Rformat;
	assign ALUsrc = lw | sw;
	assign MemtoReg = lw;
	assign RegWrite = Rformat | lw;
	assign MemRead = lw;
	assign MemWrite = sw;
	assign Branch = beq;
	assign ALUOp1 = Rformat;
	assign ALUOp2 = beq;
endmodule