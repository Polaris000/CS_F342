`timescale 1s/1s

module regpract;

	reg reset;
	initial
	begin
		// $printtimescale($root.regpract);
		reset = 1'b1;
		$display("reset: %d", reset);
		#20 reset = 1'b0;
		$display("reset: %d", reset);
		#20 reset = 1'b1;
		$display("reset: %d", reset);
		#20 reset = 1'b0;
		$display("reset: %d", reset);
		#20 reset = 1'b1;
		$display("reset: %d", reset);
	end
endmodule


module testbench;
	
	regpract rg;

	always
	begin
		$monitor("reset: %d", reset);

		#20 reset = 1'b0;
		$display("reset: %d", reset);
		#20 reset = 1'b1;
		$display("reset: %d", reset);
		#20 reset = 1'b0;
		$display("reset: %d", reset);
		#20 reset = 1'b1;
		$display("reset: %d", reset);
	end

endmodule