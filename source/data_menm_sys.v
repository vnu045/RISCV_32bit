// Name: Data Memory



module data_menm_sys(input wire clk, reset, we, 
		input wire [31:0] a, wd, 
		output wire [31:0] rd);
		
	reg [31:0] RAM[63:0]; // 64 x 32 bit memory
	assign rd = RAM[a[31:2]];     // read operation
	
	// 6 bit address enough to address the 64 locations in data memory
	
	always @(posedge clk or negedge reset)
	begin 
	if (!reset) RAM[a[31:2]] <= 32'd0;
	else 
		if (we) RAM[a[31:2]] <= wd;
	end
endmodule