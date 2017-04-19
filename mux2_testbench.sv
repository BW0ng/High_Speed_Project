module mux2_testbench();

      logic [31:0] 	A, B;
	  logic			select;
	  logic 		clk;
	  logic [31:0] 	out;

	  reg [31:0] 	test [1:0];
	  reg 			selectVector [1:0];



	  integer passed = 1;

      mux2 dut (
		  			.A(A),
					.B(B),
					.select(select),
					.out(out)
                );

	always @ ( * ) begin
		$display("Clocked");
		clk = 1;
		#10;
		clk = 0;
		#10;
	end

	initial begin
		test[0] = 32'd1;
		test[1] = 32'd2;

		selectVector[0] = 2'b1;
		selectVector[1] = 2'b0;
	end

	initial begin
		A = 32'd1;
		B = 32'd2;

		for (int i = 0; i < 2; i = i + 1)
			begin
				select = selectVector[i];

				$display("Select:  %b", select);
				#10;		// Giving the mux time to propogate
				$display("out:     %b", out);
				$display("Correct: %b", test[i]);
				$display("");
				#10;
			if (out != test[i])
				begin
				passed = 0;
				$display ("    -------------ERROR. A Mismatch Has Occured-----------");
				end
		end


		if (passed == 1)
			begin
				$display("");
				$display("");
				$display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
				$display("~      You succeeded!!!!!!!!!     ~");
				$display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			end
	end
endmodule

// End of testbench
