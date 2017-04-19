module mux4_testbench();

      logic [31:0] 	A, B, C, D;
	  logic [1:0]	select;
	  logic [31:0] 	out;

	  reg [31:0] 	test [3:0];
	  reg [1:0]		selectVector [3:0];

	  logic clk;

	  integer passed = 1;

      mux4 dut (
		  			.A(A),
					.B(B),
					.C(C),
					.D(D),
					.select(select),
					.out(out)
                );

      always @ ( * ) begin
            clk = 1;
            #10;
            clk = 0;
            #10;

      end

	  initial begin
	  	test[0] = 32'd1;
		test[1] = 32'd2;
		test[2] = 32'd3;
		test[3] = 32'd4;

		selectVector[0] = 2'b11;
		selectVector[1] = 2'b10;
		selectVector[2] = 2'b01;
		selectVector[3] = 2'b00;
	  end

      initial begin
	  	A = 32'd1;
		B = 32'd2;
		C = 32'd3;
		D = 32'd4;

		for (int i = 0; i < 4; i = i + 1)
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
