module scdatapath(alu_output, pc, reset, clk);

endmodule






module TestBench;
	wire [31:0] ALU_output;
	reg [31:0] PC;
	reg reset,clk;
	SCDataPath SCDP(ALU_output,PC,reset,clk);

	initial
	begin
		$monitor("at time %0d IPC = %d, Reset = %d , CLK = %d ,
		ALU Output = %d",$time,start_pc,rst,clk, ALU_output);

		#0 clk = 0; PC = 5;
		#120 rst = 1;
		#400 $stop;
	end

	always
	begin
		#20 clk = ~clk;
	end
endmodule