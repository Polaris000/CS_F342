module testbench_four_bit;
	reg a0, b0, a1, b1, a2, b2, a3, b3;
	wire o, xx, xxx;
	fourbitcomp m1(a0, b0, a1, b1, a2, b2, a3, b3, o, xx, xxx);
	initial
		begin

			$dumpfile("fourbitcomp.vcd");
			$dumpvars;
			$monitor(,$time," a0, b0, a1, b1, a2, b2, a3, b3, o, xx, xxx",a0, b0, a1, b1, a2, b2, a3, b3, o, xx, xxx);
			#0 a0=1'b0;b0=1'b1;a1=1'b0;b1=1'b1;a2=1'b0;b2=1'b1;a3=1'b0;b3=1'b1;
			#20 a0=1'b0;b0=1'b1;a1=1'b0;b1=1'b1;a2=1'b0;b2=1'b1;a3=1'b0;b3=1'b1;
			#50 a0=1'b0;b0=1'b1;a1=1'b0;b1=1'b1;a2=1'b0;b2=1'b1;a3=1'b0;b3=1'b1;
			#100 a0=1'b0;b0=1'b1;a1=1'b0;b1=1'b1;a2=1'b0;b2=1'b1;a3=1'b0;b3=1'b1;
			#150 a0=1'b0;b0=1'b1;a1=1'b0;b1=1'b1;a2=1'b0;b2=1'b1;a3=1'b0;b3=1'b1;
			#200 a0=1'b0;b0=1'b1;a1=1'b0;b1=1'b1;a2=1'b0;b2=1'b1;a3=1'b1;b3=1'b0;
			#300 $finish;
			
		end
endmodule