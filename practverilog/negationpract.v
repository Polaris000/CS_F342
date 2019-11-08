module negationpract;

integer b;

initial begin
	b = 5;
	$display("b = %b", b);
	$display("b = %b", ~b);
end

endmodule