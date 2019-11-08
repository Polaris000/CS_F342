module mux4to1_gate(out, in, sel);
input[0:3] in;
input[0:1] sel;
output out;

wire a,b,c,d,n2,a1,a2,a3,a4;

not n(n1,sel[1]);
not nn(n2,sel[0]);

and (a1,in[0],n1,n2);
and (a2,in[1],n2,sel[1]);
and (a3,in[2],sel[0],n1);
and (a4,in[3],sel[0],sel[1]);


or orl(out, a1, s2, a3, a4);
endmodule

module mux16to1(out, in, sel);

input [0:15] in;
input [0:3] sel;
output out;
wire [0:3] ma;

mux4to1_gate mux1(ma[0],in[0:3],sel[2:3]);
mux4to1_gate mux2(ma[1],in[4:7],sel[2:3]);
mux4to1_gate mux3(ma[2],in[8:11],sel[2:3]);
mux4to1_gate mux4(ma[3],in[12:15],sel[2:3]);
mux4to1_gate mux5(out,ma,sel[0:1]);

endmodule
