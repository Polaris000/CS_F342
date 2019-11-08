
module dff_seq_sync(d, clear_, clock, q);
	
	input d, clear_, clock;
	output q;
	reg q;
	
	always @ (posedge clock)
	begin
		if (!clear_)
			q <= 1'b0;
			
		else
			q <= d;
			
	end
	
endmodule

module dff_seq_async(d, clear_, clock , q);
	input d, clear_, clock;
	output q;
	reg q;
	
	always @ (negedge clear_ or posedge clock)
	begin
		if (!clear_)
			q <= 1'b0;
		else
			q <= d;
	end
endmodule

// testbench
module Testing;
	reg d, clk, rst;
	wire q;
	dff_seq_sync dff1 (d, clk, rst, q);
	// dff_seq_async dff2 (d, clk, rst, q);
	//Always at rising edge of clock display the signals
	always @(*)begin
		$display($time, , "d=%b, clk=%b, rst=%b, q=%b\n", d, clk, rst, q);
	end
	//Module to generate clock with period 10 time units
	initial begin
		forever begin
			clk=0;
			#5 clk=1;
			#5 clk=0;
			// # 5
			// clk = !clk;
		end
	end
	initial
		begin
		  $dumpfile("Testing.vcd");
		  $dumpvars(0,Testing);
			d=0; rst=1;
			#4		d=1; rst=0;
			#50		d=1; rst=1;
			#20		d=0; rst=0;
			#20 	$finish;
		end
endmodule
