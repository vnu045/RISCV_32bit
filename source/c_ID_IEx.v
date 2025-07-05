module c_ID_IEx (input wire clk, reset, clear,
        input wire RegWriteD, MemWriteD, JumpD, BranchD, ALUSrcAD,
		input wire [1:0] ALUSrcBD,
        input wire [1:0] ResultSrcD, 
        input wire [3:0] ALUControlD,  
        output reg RegWriteE, MemWriteE, JumpE, BranchE,  ALUSrcAE,
		output reg [1:0] ALUSrcBE,
        output reg [1:0] ResultSrcE,
        output reg [3:0] ALUControlE);

always @( posedge clk or negedge reset ) begin

		if (!reset) begin
			RegWriteE <= 0;
			MemWriteE <= 0;
			JumpE <= 0;
			BranchE <= 0; 
			ALUSrcAE <= 0;
			ALUSrcBE <= 0;
			ResultSrcE <= 0;
			ALUControlE <= 0;          
		end

		else if (clear) begin
			RegWriteE <= 0;
			MemWriteE <= 0;
			JumpE <= 0;
			BranchE <= 0; 
			ALUSrcAE <= 0;
			ALUSrcBE <= 0;
			ResultSrcE <= 0;
			ALUControlE <= 0;    			
		end
		
		else begin
			RegWriteE <= RegWriteD;
			MemWriteE <= MemWriteD;
			JumpE <= JumpD;
			BranchE <= BranchD; 
			ALUSrcAE <= ALUSrcAD;
			ALUSrcBE <= ALUSrcBD;
			ResultSrcE <= ResultSrcD;
			ALUControlE <= ALUControlD;   
		end
		 
	 end
  
endmodule


    