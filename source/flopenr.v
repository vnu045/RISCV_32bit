module flopenr (input wire clk, reset, en,
			input wire [31:0] d,
			output reg [31:0] q);
					
	always @(posedge clk or negedge reset)
		
		if (!reset) q <= 0;
		else if (en) q <= d;
	
endmodule