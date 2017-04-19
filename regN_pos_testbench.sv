module regN_pos_testbench();
	integer passed 		= 	1;
	integer num_tests 	= 	20;

	// Variables
	logic [31:0] 	D, Q;
	logic 			clk;

	// Test
	reg [31:0] 		test [20:0];

	regN_pos dut (
	  			.D(D),
				.clk(clk),
				.Q(Q)
	);

	always @ ( * ) begin
	    clk = 1;
	    #10;
	    clk = 0;
	    #10;
	end

	// initial begin
	// 		for (int i = 0; i < num_tests; i = i + 1)
	// 		begin
	// 		  	test[i] = $random;
	// 		end
	// end

	initial begin
		for (int i = 0; i < num_tests; i = i + 1)
			begin
				D = test[i];

				#20;		// Clocking the register
				$display("D:        %b", D);
				$display("Q:        %b", Q);
				$display("Correct:  %b", test[i]);

				$display("");

				if (Q != test[i])
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
