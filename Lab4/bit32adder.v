module bit32adder (cout, sum, in1, in2, cin);
	input [31:0] in1,in2;
	input cin;
	output cout;
	output [31:0]sum;
	
	// wire [0:4] x;
	
	assign {cout, sum} = in1 + in2 + cin;
	
	// genvar j;
	// integer i = 0;
	
	// //this is the variable that is be used in the generate
	// //block
	//  generate for (j=0; j<32;j=j+8) begin: mux_loop
	// 	//mux_loop is the name of the loop
		
	// 	eightbitadder mi(x[j/8+1], sum[j +: 8],in1[j +: 8],in2[j +: 8], x[j/8]);

	// 	//mux2to1 is instantiated every time it is called
	// end
	// endgenerate
	// assign cout = x[4];
	// module fulladder_32bit( output[31:0] sum, output cout, input [31:0] num1, input [31:0] num2, input cin );

endmodule


