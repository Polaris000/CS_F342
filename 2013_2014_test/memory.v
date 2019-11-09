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

module eightbitreg(clk, en, numin, numout);
	
	input clk, en;
	input [7:0] numin;
	output reg [7:0] numout;


	generate
		genvar i;
		
		for (i = 0; i < 8; i = i + 1)
		begin: dff_loop
			d_ff_sync dff(numin[i], en, clk, numout[i]);
		end

	endgenerate
endmodule

module memory(clk, WE, datatowrite, regsel, readdata);

	input WE;
	input [7:0] datatowrite;
	input [3:0] regsel;
	output [7:0] readdata;	
	reg [15:0][7:0] mem;

	// 16 eight-bit registers
	generate
		genvar i;
		for (i = 0; i < 16; i = i + 1)
		begin: memreg
			eightbitreg reg (clk, WE, datatowrite, mem[i]);

		end
	endgenerate

	always @(regsel and posedge clk)
	begin

		if (WE)
			mem[regsel] = datatowrite;

		else
			readdata = mem[regsel];

	end

endmodule
