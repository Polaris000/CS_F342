module fulladder1bit(a, b, cin, cout, sum);
	input a, b, cin;
	output cout, sum;

	always @(a or b or cin)
	begin
		if (!cin)
		begin
			sum = a + b;
			if (sum == 0 and (a > 0 or b > 0))
				cout = 1;
			else
				cout = 0;


		end

		else
		begin
			

		end
	end