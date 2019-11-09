module datamem(addr, data, reset, memwrite, memread, readdata);
	input [4:0] addr;
	input [31:0] data;
	input reset, memwrite, memread;

	output [31:0] readdata;
	reg [31:0][31:0] mem;

	integer j = 0;

	always @(memwrite or memread or reset)
	begin
		if (~memread)
			mem[addr] = data;

		else
			readdata = mem[addr];

		if (reset)
		begin
			for (j = 0; j < 32; j = j + 1)
			begin
				data[j] = 32'd0;
			end
		end
	end

endmodule

