module imem(input wire [31:0] a, output wire [31:0] rd);
				
reg [31:0] rom[100:0];
initial begin
$readmemh("D:/altera/13.0sp1/Lab/riscv_git/126/riscv-proc-main(61.27) - Copy (4)/RISCV/instr1.hex",rom);
end
assign rd = rom[a[31:2]]; // word aligned
endmodule