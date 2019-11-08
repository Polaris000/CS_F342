module oppract;
	integer a = 3;
	integer b = 4;
	integer c;

	initial
		begin

			// c  = a + b;
			$display("the value of c is: %d", c);
			a = a + 1;
			c = a ** b; 
			$display("the value of c is: %d", c);
		end
endmodule
