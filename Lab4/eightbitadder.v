`include "onebitadder.v"

module eightbitadder(cout, s, a, b, cin);
	input [0:7] a, b;
	input cin;
	output cout;
	wire [0:7] x;
	output [0:7]s;
	
	
	onebitadder o1(s[0], x[1], a[0], b[0], cin);
	onebitadder o2(s[1], x[2], a[1], b[1], x[1]);
	onebitadder o3(s[2], x[3], a[2], b[2], x[2]);
	onebitadder o4(s[3], x[4], a[3], b[3], x[3]);	
	onebitadder o5(s[4], x[5], a[4], b[4], x[4]);	
	onebitadder o6(s[5], x[6], a[5], b[5], x[5]);	
	onebitadder o7(s[6], x[7], a[6], b[6], x[6]);
	onebitadder o8(s[7], cout, a[7], b[7], x[7]);	


endmodule

// module testbench;

//  reg [0:7]x,y;
//  wire [0:7]s;
//  wire c;
 
//  eightbitadder fl(c,s,x,y);
 
//  initial
//  $monitor(,$time," x=%b , y=%b, s=%b, c=%b",x,y,s,c);
 
//  initial
//  begin
// #0 x=8'b00000000;y=8'b11000000;
// #4 x=8'b10000000;y=8'b11000000;
// #4 x=8'b11000000;y=8'b11000000;
// #4 x=8'b11100000;y=8'b11000000;
// #4 x=8'b11000000;y=8'b11000000;
// #4 x=8'b11000000;y=8'b11000000;
// #4 x=8'b11000000;y=8'b11000000;
// #4 x=8'b11000000;y=8'b11000000;
//  end
// endmodule