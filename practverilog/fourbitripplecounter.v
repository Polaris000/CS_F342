module ripplecounter(output[3:0] q, input clk, input clear_, t);
	
	TFF2 t1 (q[0], clk, clear_, t);
	TFF2 t2 (q[1], q[0], clear_, t);
	TFF2 t3 (q[2], q[1], clear_, t);
	TFF2 t4 (q[3], q[2], clear_, t);

endmodule

// tff built using dff and not gate
module TFF(q, clk, clear_);
	
	wire d;
	output q;
	input clk, clear_;

	DFF d1 (d, clear_, clk, q);

	not n1(d, q);

endmodule

// tff standalone
module TFF2(q, clock, clear_, t);
	input t, clear_, clock;
	output q;
	reg q;
	
	always @(negedge clock or negedge clear_) begin
		if (!clear_)
			q <= 1'b0;

		else begin
			if (!t) q <= q;
			else q <= !q;
			
		end
	end

endmodule

// dff with async clear_and negative edge clock
module DFF(d, clear_, clock , q);
	input d, clear_, clock;
	output q;
	reg q;
	
	always @ (negedge clear_ or negedge clock)
	begin
		if (!clear_)
			q <= 1'b0;
		else
			q <= d;
	end
endmodule


// test module
module testbench;
	
	reg clk, clear_, t=1;
	wire [3:0] q;

	ripplecounter r1(q, clk, clear_, t);

	initial
		clk = 1'b0;

	always
		#5 clk = ~clk;

	initial
	begin
			$dumpfile("testbench.vcd");
			$dumpvars(0,testbench);
		clear_ = 1'b0;
		# 15 clear_ = 1'b1;
		# 180 clear_ = 1'b0;
		# 10 clear_ = 1'b1;
		# 20 $finish;
	end

	initial
		$monitor ($time, " output q = %d, t=%b", q, t);

endmodule