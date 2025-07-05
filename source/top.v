module top (input wire 			clk, reset, 
			output wire [31:0] 	WriteDataM,  DataAdrM, ReadDataM,
			output wire 			MemWriteM);
				
	wire [31:0] PCF, InstrF;
	
// instantiate processor and memories
	riscv_pip_27 rv( clk, reset, PCF, InstrF, MemWriteM, DataAdrM, WriteDataM, ReadDataM);
	imem imem(PCF, InstrF);
	data_menm_sys cache_data_system(clk, reset, MemWriteM, DataAdrM, WriteDataM, ReadDataM);

endmodule