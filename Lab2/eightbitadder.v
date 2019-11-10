`include "onebitadder.v"

module eightbitadder(cout, s, a, b);
	input [0:7] a, b;
	output cout;
	wire x[
	output [0:7]s;
	
	
	onebitadder o1(s[0], cin, a[0], b[0], 1'b0);

	onebitadder o2(s[1], cin, a[1], b[1], cin);

	onebitadder o3(s[2], cin, a[2], b[2], x);
	onebitadder o4(s[3], cin, a[3], b[3], x);	assign x = cin;
	onebitadder o5(s[4], cin, a[4], b[4], x);	assign x = cin;
	onebitadder o6(s[5], cin, a[5], b[5], x);	assign x = cin;
	onebitadder o7(s[6], cin, a[6], b[6], x);	assign x = cin;
	onebitadder o8(s[7], cout, a[7], b[7], x);	

endmodule

module testbench;

 reg [0:7]x,y;
 wire [0:7]s;
 wire c;
 
 eightbitadder fl(c,s,x,y);
 
 initial
 $monitor(,$time," x=%b , y=%b, s=%b, c=%b",x,y,s,c);
 
 initial
 begin
#0 x=8'b00000000;y=8'b11000000;
#4 x=8'b10000000;y=8'b11000000;
#4 x=8'b11000000;y=8'b11000000;
#4 x=8'b11100000;y=8'b11000000;
#4 x=8'b11000000;y=8'b11000000;
#4 x=8'b11000000;y=8'b11000000;
#4 x=8'b11000000;y=8'b11000000;
#4 x=8'b11000000;y=8'b11000000;
 end
endmodule
