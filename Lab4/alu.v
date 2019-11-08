module ALU(a, b, binvert, cin, op, res, cout);

	input [31:0] a, b;
	input [1:0] op;
	input cin;
	input binvert;
	output [31:0] res;
	output cout;
	wire [31:0] in1, in2, in3, bnew, out;

	assign bnew = binvert ? (~b) : b;

	bit32AND band (in1, a, bnew);

	bit32or bor(in2, a, bnew);

	bit32adder badd(cout, in3, a, bnew, cin);

	bit32_3to1mux mux2(out,op,in1,in2, in3);
	assign res = out;

endmodule

module tbALU();
	reg Binvert, Carryin;
	reg [1:0] Operation;
	reg [31:0] a,b;
	wire [31:0] Result;
	wire CarryOut;

	ALU alu(a,b,Binvert,Carryin,Operation,Result,CarryOut);

	initial
	begin
		$monitor("a:\t%b\nb:\t%b op: %b binvert: %b\nresult: %b\n", a, b, Operation, Binvert, Result);
		a=32'ha5a5a5a5;
		b=32'h5a5a5a5a;
		Operation=2'b00;
		Binvert=1'b0;
		Carryin=1'b0;	//must perform AND resulting in zero
		#100 Operation=2'b01; //OR
		#100 Operation=2'b10; //ADD
		#100 Binvert=1'b1;	//SUB
		#200 $finish;
	end
endmodule
