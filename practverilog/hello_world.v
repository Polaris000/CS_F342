module Hello;
	initial
		begin
			$monitor("this is monitor");
			$display("abcdef");
			$write("Hello, World");
			$display("Newline!");
		end

endmodule

// only one monitor process runs at a time, they overwrite each other.
// display ->  new line
// write -> no newline character
// monitor prints whenver one of the signals changes
// strobe prints at end