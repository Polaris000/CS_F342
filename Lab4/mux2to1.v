module mux2to1(out,sel,in1,in2);
	input in1, in2, sel;
	output out;

	assign out = sel ? in2 : in1;
endmodule


module testbench;
	reg a,b,s;
	wire f;
	mux2to1 m1(f, s, a, b);
	initial
		begin

			$dumpfile("testbench.vcd");
			$dumpvars(0, testbench);
			$monitor(,$time," a=%b, b=%b, s=%b f=%b",a,b,s,f);
			#0 a=1'b0;b=1'b1;
			#2 s=1'b1;
			#5 s=1'b0;
			#10 a=1'b1;b=1'b0;
			#15 s=1'b1;
			#20 s=1'b0;
			#100 $finish;
			
		end
endmodule

