module t_flipflop_sync(t, clear_, clock, q);
	input t, clear_, clock;
	output q;
	reg q;
	
	always @(posedge clock)
	begin
		if (!clear_)
			q <= 1'b0;

		else
		begin
			if (!t)
				q <= q;
			else
				q <= !q;
		end
	end
endmodule


module t_flipflop_async(t, clear_, clock, q);
	input t, clear_, clock;
	output q;
	reg q;
	
	always @(posedge clock or negedge clear_) begin
		if (!clear_)
			q <= 1'b0;

		else begin
			if (!t) q <= q;
			else q <= !q;
			
		end
	end
endmodule


module test;
	reg t, clk, rst;
	wire q;
	t_flipflop_async t1 (t, rst, clk, q);

	//Always at rising edge of clock display the signals
	always @(*) 
	begin
		$display($time, , "t=%b, clk=%b, rst=%b, q=%b\n", t, clk, rst, q);
	end
	//Module to generate clock with period 10 time units
	initial begin
		forever begin
					clk=0;
			#5 		clk=1;
			#5 		clk=0;
		end
	end
	initial
		begin
					t=1; rst=0;
			#5		t=1; rst=1;
			#5		t=1; rst=1;
			#5		t=1; rst=1;
			#5		t=1; rst=1;
			#5		t=1; rst=1;
			#5		t=1; rst=1;
			#5 	$finish;
		end
endmodule
