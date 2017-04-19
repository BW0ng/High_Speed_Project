module regN_neg	(D, clk, Q);

	parameter N = 32;

	// Input
	input   [N-1:0]   D;
	input             clk;

	// Output
	output  [N-1:0]   Q;

	// register
	reg [N-1:0] Q = 32'b0;

	always @ ( negedge clk ) begin
		Q <= D;
	end
endmodule
