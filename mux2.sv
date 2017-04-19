module mux2 (A, B, select, out);
	parameter N = 32;

	input logic 	[N-1:0] 	A, B;
	input logic					select;

	output logic	[N-1:0]		out;

	assign out = select ? A : B;

endmodule
