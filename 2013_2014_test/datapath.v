module datapath(num, key, storevalue);

	input [3:0] num;
	input [3:0] key;
	reg clk, enable, en;
	reg WE;


	  initial begin
	    #0  clk = 1'b1; en = 1'b1; enable=1'b1; WE = 1'b1;
	  end
	  always  begin
	    #2  clk = ~clk;
	  end

	wire [3:0] numout, numrotated;
	wire [7:0] product;
	wire [15:0] Addr;
	output [7:0] storevalue;

	reg1 r1(clk, en, num, numout);
	rotator rot(clk, enable, numout, numrotated);

	multiplier m1(numrotated, key, product);

	decoder4_16 mod5(num, Addr);
	memory mod6(WE, product, Addr, storevalue);

endmodule

module testbench;
  reg [3:0] Num, Key;
  wire  [7:0] StoredValue;
  datapath  mod(Num, Key, StoredValue);
  initial begin
    $monitor($time, " Number = %b, Key = %b, StoredValue = %b.", Num, Key, StoredValue);
    #0  Num = 4'b1000;  Key = 4'b1000;
    #20 Num = 4'b1001;  Key = 4'b1000;
    #20 Num = 4'b1100;  Key = 4'b1010;
    #20 Num = 4'b1011;  Key = 4'b1110;
    #50 $finish;
  end
endmodule