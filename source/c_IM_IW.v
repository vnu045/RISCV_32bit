module c_IM_IW (input wire clk, reset, 
                input wire RegWriteM, 
                input wire [1:0] ResultSrcM, 
                output reg RegWriteW, 
                output reg [1:0] ResultSrcW);

    always @( posedge clk or negedge reset ) begin
        if (!reset) begin
            RegWriteW <= 0;
            ResultSrcW <= 0;           
        end

        else begin
            RegWriteW <= RegWriteM;
            ResultSrcW <= ResultSrcM; // lol this wasted 1 hour
        end

    end

endmodule