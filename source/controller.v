module controller(input wire clk, reset,
						input wire [6:0] op,
						input wire [2:0] funct3,
						input wire funct7b5,
						input wire ZeroE,
						input wire SignE,
						input wire FlushE,
						output wire ResultSrcE0,
						output wire [1:0] ResultSrcW,
						output wire MemWriteM,
						output wire PCJalSrcE, PCSrcE, ALUSrcAE, 
						output wire [1:0] ALUSrcBE,
						output wire RegWriteM, RegWriteW,
						output wire [2:0] ImmSrcD,
						output wire [3:0] ALUControlE);

wire [1:0] ALUOpD;
wire [1:0] ResultSrcD, ResultSrcE, ResultSrcM;
wire [3:0] ALUControlD;
wire BranchD, BranchE, MemWriteD, MemWriteE, JumpD, JumpE;
wire ZeroOp, ALUSrcAD, RegWriteD, RegWriteE;
wire [1:0] ALUSrcBD;
wire SignOp;
wire BranchOp;

// main decoder
maindec md(op, ResultSrcD, MemWriteD, BranchD, ALUSrcAD, ALUSrcBD, RegWriteD, JumpD, ImmSrcD, ALUOpD);

// alu decoder
aludec ad(op[5], funct3, funct7b5, ALUOpD, ALUControlD);


c_ID_IEx c_pipreg0(clk, reset, FlushE, RegWriteD, MemWriteD, JumpD, BranchD, ALUSrcAD, ALUSrcBD, ResultSrcD, ALUControlD, 
										RegWriteE, MemWriteE, JumpE, BranchE, ALUSrcAE, ALUSrcBE, ResultSrcE, ALUControlE);
assign ResultSrcE0 = ResultSrcE[0];

c_IEx_IM c_pipreg1(clk, reset, RegWriteE, MemWriteE, ResultSrcE, RegWriteM,  MemWriteM, ResultSrcM);

c_IM_IW c_pipreg2 (clk, reset, RegWriteM, ResultSrcM, RegWriteW, ResultSrcW);


assign ZeroOp = ZeroE ^ funct3[0]; // Complements Zero flag for BNE Instruction
assign SignOp = (SignE ^ funct3[0]) ; //Complements Sign for BGE

//mux2 BranchSrc (ZeroOp, SignOp, funct3[2], BranchOp); // fix this later
assign BranchOp = funct3[2] ? (SignOp) : (ZeroOp); 
assign PCSrcE = (BranchE & BranchOp) | JumpE;
assign PCJalSrcE = (op == 7'b1100111) ? 1 : 0; // jalr


endmodule