module mux2to1(out,sel,in1,in2);
	input in1, in2, sel;
	output out;

	assign out = sel ? in2 : in1;
endmodule


module fourbitmux2to1(out, sel, in1, in2);
	input [3:0] in1, in2;
	input sel;
	output [3:0] out;

	genvar j;

	generate
		for (j = 0; j < 4; j = j + 1)
		begin: muxloop
			mux2to1 m(out[j], sel, in1[j], in2[j]);
		end

	endgenerate
endmodule


module testbench;
	reg [3:0] a,b;
	reg s;
	wire [3:0] f;
	fourbitmux2to1 m1(f, s, a, b);
	initial
		begin

			$dumpfile("testbench.vcd");
			$dumpvars(0, testbench);
			$monitor(,$time," a=%b, b=%b, s=%b f=%b",a,b,s,f);
			#0 a=4'b0000;b=4'b1111;
			#2 s=1'b1;
			#5 s=1'b0;
			#10 a=4'b0101;b=4'b1010;
			#15 s=1'b1;
			#20 s=1'b0;
			#100 $finish;
			
		end
endmodule