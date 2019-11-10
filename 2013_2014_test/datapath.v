module datapath(num, key, storevalue);

	input [3:0] num;
	input [3:0] key;
	input clk, enable, en;

	reg WC;

	wire [3:0] numout, numrotated, product;

	output [7:0] storevalue;

	reg1 r1(clk, en, num, numout);
	rotator rot(clk, enable, numout, numrotated);

	multiplier m1(numrotated, key, product);

	WC = 1;
	memory m(clk, WE, product, num, storevalue);

	WC = 0;
	decoder4_16 d(num, )

	always @(posedge clk) begin
		if (rst) begin
			// reset
			
		end
		else if () begin
			
		end
	end