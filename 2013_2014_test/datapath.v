module datapath(num, key, storevalue);

	input [3:0] num;
	input [3:0] key;

	output [7:0] storevalue;
	reg clk;

	always @(*)
	begin
		#5 clk = ~clk;
	end

	always @(posedge clk) begin
		if (rst) begin
			// reset
			
		end
		else if () begin
			
		end
	end