module d_ff(q, d, clock, clear_);
	
	input d, clear_, clock;
	output q;
	reg q;
	
	always @ (negedge clock)
	begin
		if (!clear_)
			q <= 1'b0;
			
		else
			q <= d;
			
	end

endmodule