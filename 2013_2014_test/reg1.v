module d_ff_sync(d, en, clock, q);
	
	input d, en, clock;
	output q;
	reg q;
	
	always @ (posedge clock)
	begin
		if (!en)
			q <= 1'b0;
			
		else
			q <= d;
			
	end
	
endmodule

module reg1(clk, en, numin, numout);
	
	input clk, en;
	input [3:0] numin;
	output reg [3:0] numout;


	generate
		genvar i;
		
		for (i = 0; i < 4; i = i + 1)
		begin: dff_loop
			d_ff_sync dff(numout[i], en, clk, numin[i]);
		end

	endgenerate
endmodule
