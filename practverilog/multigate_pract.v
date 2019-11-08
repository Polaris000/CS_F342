module multigate(input a, input b, input c, output d);

	or(d, a, b, c);

endmodule

module test;
	reg a, b, c;
	wire d;

	multigate m (a, b, c, d);

	initial begin 
				$monitor($time, " a=%b, b=%b, c=%b d=%b",a,b,c,d);
			#5 a=1'b0;b=1'b1;c=1'b1;
			#5 a=1'b1;b=1'b1;c=1'b1;
			#5 a=1'b1;b=1'b1;c=1'b0;
			#5 a=1'b0;b=1'b0;c=1'b0;
			#5 $finish;

		end
endmodule