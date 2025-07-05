module c_IEx_IM (input wire clk, reset,
                input wire RegWriteE, MemWriteE,
                input wire [1:0] ResultSrcE,  
                output reg RegWriteM, MemWriteM,
                output reg [1:0] ResultSrcM);

    always @( posedge clk or negedge reset ) begin
        if (!reset) begin
            RegWriteM <= 0;
            MemWriteM <= 0;
            ResultSrcM <= 0;
        end
        else begin
            RegWriteM <= RegWriteE;
            MemWriteM <= MemWriteE;
            ResultSrcM <= ResultSrcE; 
        end
        
    end

endmodule