`include "problem.v"

module testmux_16;

	reg[0:15] in;
	reg[0:3] sel;
	wire out;
	
	mux16to1 mux(out, in sel)l
	
	initial
		begin
			$monitor("in = %b| sel = %b | out = %b", in, sel, out);
		end
		
	initial	
		begin	
		in=16'b1000000000000000; sel=4'b0000;

		end
endmodule
