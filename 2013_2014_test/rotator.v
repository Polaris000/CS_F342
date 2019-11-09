module shiftright(clk, enable, numout, numrotated);
	input clk, enable;
	input [3:0] numout;

	output reg [3:0] numrotated;

	always @(posedge clk) begin
		if (enable) begin
			// reset
			numrotated <= numout / 2;
			
		end
		else
			numrotated <= numrotated;
	end
endmodule

module rotator(clk, enable, numout, numrotated);

	input clk, enable;
	input [3:0] numout;

	output [3:0] numrotated;
	wire [3:0] numrotated_tmp;

	generate
		genvar i;
		
		shiftright shr1 (clk, enable, numout, numrotated_tmp);
		shiftright shr2 (clk, enable, numrotated_tmp, numrotated);

	endgenerate
endmodule