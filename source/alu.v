module alu(input wire [31:0] SrcA, 
			input wire [31:0] SrcB, 
			input wire [3:0] ALUControl , 
			output reg  [31:0] ALUResult, 
			output wire Zero, Sign);

wire [31:0] Sum, B;
wire Overflow;
assign B = (ALUControl[0] ? ~SrcB : SrcB);
cla32b cla0(SrcA, B, ALUControl[0],Sum);

//assign Sum = SrcA + (ALUControl[0] ? ~SrcB : SrcB) + ALUControl[0];  // sub using 1's complement
assign Overflow = ~(ALUControl[0] ^ SrcB[31] ^ SrcA[31]) & (SrcA[31] ^ Sum[31]) & (~ALUControl[1]);

assign Zero = ~(|ALUResult);
assign Sign = ALUResult[31];


always @(*)
		casex (ALUControl)
				4'b000x: ALUResult = Sum;				// sum or diff
				4'b0010: ALUResult = SrcA & SrcB;	// and
				4'b0011: ALUResult = SrcA | SrcB;	// or
				4'b0100: ALUResult = SrcA << SrcB;	// sll, slli
				4'b0101: ALUResult = {{30{1'b0}}, Overflow ^ Sum[31]}; //slt, slti
				4'b0110: ALUResult = SrcA ^ SrcB;   // Xor
				4'b0111: ALUResult = SrcA >> SrcB;  // shift wire
				4'b1000: ALUResult = ($unsigned(SrcA) < $unsigned(SrcB)); //sltu, stlui
				4'b1111: ALUResult = SrcA >>> SrcB; //shift arithmetic
				default: ALUResult = 32'bx;
		endcase


endmodule
		
	