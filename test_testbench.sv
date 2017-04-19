module test_testbench();
	logic A, B;
	logic clk;

	always @ ( * ) begin
		clk = 1;
		#10;
		clk = 0;
		#10;
	end

	test dut (.A(A), .clk(clk), .B(B));

endmodule
