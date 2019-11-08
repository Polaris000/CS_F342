module bit32AND (out,in1,in2);
	input [31:0] in1,in2;
	output [31:0] out;
	assign out = in1 &in2;
endmodule

// module tb32bitand;
// 	reg [31:0] IN1,IN2;
// 	wire [31:0] OUT;
// 	bit32AND a1 (OUT,IN1,IN2);
// 	initial
// 	begin
// 		$monitor("in1 %B \nin2 %B \nout: %B\n", IN1, IN2, OUT);
// 		IN1=32'hA5A5;
// 		IN2=32'h5A5A;
// 		#100 IN1=32'h5A5A;
// 		#400 $finish;
// 	end
// endmodule