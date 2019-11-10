module mux16_1(
	input [3:0] x,
	output [8:0] product);

	assign product = 25 * x;

endmodule


module d_ff(clk, reset, q, d);
	input clk, reset;
	input d;
	output reg q;

	always @(posedge clk or negedge reset) begin

		if (reset) 
			q <= d;
			
		else 
			begin
			q <= 1'b0;
			end
	end
endmodule


module accrst(clk, reset, accrst1, accrst2);
	input clk, reset;
	output accrst1, accrst2;

	wire [3:0] q;

	d_ff df1(clk, reset, q[0], ~q[0]);

	d_ff df2(q[0], reset, q[1], ~q[1]);

	d_ff df3(q[1], reset, accrst1, ~accrst1);

	d_ff df4(accrst1, reset, accrst2, ~accrst2);

endmodule


module addreg(
	input [8:0] product,
	input clk,
	input accrst1,
	input accrst2,
	output reg [12:0] y
	);

	always @(accrst2)
		y <= 13'b0000000000000;

	always @(posedge clk)
		if (accrst1)
			y = y + {4'b0,product};

endmodule

module inputtg(input clk,
			input reset,
			input [3:0] x,
			output [12:0] y);
	
	wire [8:0] product;
	wire accrst1, accrst2;
	mux16_1 mux (x, product);
	accrst acc(clk, reset, accrst1, accrst2);

	addreg addr(product, clk, accrst1, accrst2, y);

endmodule

module tb_intg();
    
    reg reset,clock;
    reg [3:0] x;
    wire [12:0] y;

    initial begin
            clock = 1'b0;
            reset = 1'b1;
            x = 4'd0;
        #16  reset = 1'b0;
        #8  x = 4'd10;
        #16 x = 4'd5;
        #16 x = 4'd12;
        #16 x = 4'd1;

        #16 x = 4'd13;
        #16 x = 4'd7;
        #16 x = 4'd9;
        #16 x = 4'd2;

        #16 x = 4'd11;
        #16 x = 4'd5;
        #16 x = 4'd4;
        #16 x = 4'd2;
        #200 $finish;
    end
    always
        #8 clock = ~clock;
    initial begin
        $dumpfile("file.vcd");
        $dumpvars;
    end

    inputtg circuit(.y(y), .reset(reset), .clk(clock), .x(x));
endmodule


/*
module tbmux();
	reg [3:0] x;
	wire [8:0] product;

	mux16_1 m1(x, product);

	initial begin
		$monitor("x: %d  ", x, "product = %d", product);

		#10 x=32'd4;
		#10 x=32'd7;

		#10 $finish;
	end
endmodule
*/
