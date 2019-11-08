module mux3to1(out, sel, in1, in2, in3);
	input in1, in2, in3;
	input [1:0]sel;
	output out;

	assign out = sel[1] ? (sel[0] ? out : in3) : (sel[0] ? in2 : in1);
endmodule

module bit32_3to1mux(out,sel,in1,in2, in3);
	input [31:0] in1,in2, in3;
	output [31:0] out;
	input [1:0]sel;
	genvar j;

	generate for (j=0; j<32;j=j+1) begin: mux_loop
		mux3to1 m(out[j], sel, in1[j], in2[j], in3[j]);
	end
	endgenerate
endmodule

// module testbench;
// 	reg a,b,d;
// 	reg [1:0]s;
// 	wire f;
// 	mux3to1 m1(f, s, a, b, d);
// 	initial
// 		begin

// 			$dumpfile("testbench.vcd");
// 			$dumpvars(0, testbench);
// 			$monitor(,$time," a=%b, b=%b, d=%b, s=%b f=%b",a,b,d,s,f);
// 			#0 a=1'b0;b=1'b1; d=1'b1;
// 			#2 s=2'b10;
// 			#5 s=2'b00;
// 			#10 a=1'b0;b=1'b0;d=1'b1;
// 			#15 s=2'b11;
// 			#20 s=2'b10;
// 			#100 $finish;
			
// 		end
// endmodule