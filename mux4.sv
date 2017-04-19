module mux4 (A, B, C, D, select, out);
	parameter N = 32;

	input logic		[N-1:0]	A, B, C, D;
	input logic		[1:0]	select;

	output logic	[N-1:0]	out;

	/*
		Select:
			11 - A
			10 - B
			01 - C
			00 - D
	*/
	assign out = select[1] ? (select[0] ? A : B) : (select[0] ? C : D);

endmodule
