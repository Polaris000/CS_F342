module pipeline(input [7:0] funccode,
				input [3:0] a, 
				input [3:0] b,
				output parity);

	wire [2: 0] opcode;
	wire [3:0] result;


	wire [3:0] a_p, b_p, result_p;
	wire [2:0] opcode_p;

	wire [10:0] IF_EXReg;
	wire [3:0] EX_PARReg;

	encoder e(funccode, opcode);

	assign IF_EXReg = {opcode, a, b};
	ifparser ifp (IF_EXReg, opcode_p, a_p, b_p);

	alu al (a_p, b_p, opcode_p, result);

	assign EX_PARReg = {result};
	exparser exp (EX_PARReg, result_p);

	generator g(result_p, parity);

endmodule



module testbench();
	
	reg [7:0] fncode;
	reg [3:0] srcA, srcB;
	
	wire parity;
	
	pipeline pc(fncode, srcA, srcB, parity);
	
	initial begin
		
				fncode = 8'b00000001;
				srcA   = 4'b0001;
				srcB   = 4'b0001;
		
		#100	fncode = 8'b00000010;
		#200	fncode = 8'b00000100;
		#300	fncode = 8'b00001000;
		#400	fncode = 8'b00010000;
		#500	fncode = 8'b00100000;
		#600	fncode = 8'b01000000;
		#700	fncode = 8'b10000000;
		
		#10 	$display("");
		
		#100	fncode = 8'b00000001;
				srcA   = 4'b0101;
				srcB   = 4'b1010;
		
		#100	fncode = 8'b00000010;
		#200	fncode = 8'b00000100;
		#300	fncode = 8'b00001000;
		#400	fncode = 8'b00010000;
		#500	fncode = 8'b00100000;
		#600	fncode = 8'b01000000;
		#700	fncode = 8'b10000000;
	end
	
	initial begin
		$monitor( "fncode : %b ",fncode, " srcA: %b ", srcA," srcB: %b ", srcB, " aluOut: %b ",pc.result, " parity: %b ", parity  );
	end
	
endmodule