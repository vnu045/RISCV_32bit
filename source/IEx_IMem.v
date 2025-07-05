module IEx_IMem(input wire clk, reset,
                input wire [31:0] ALUResultE, WriteDataE, 
                input wire [4:0] RdE, 
                input wire [31:0] PCPlus4E,
                output reg [31:0] ALUResultM, WriteDataM,
                output reg [4:0] RdM, 
                output reg [31:0] PCPlus4M);

always @( posedge clk or negedge reset ) begin 
    if (!reset) begin
        ALUResultM <= 0;
        WriteDataM <= 0;
        RdM <= 0; 
        PCPlus4M <= 0;
    end

    else begin
        ALUResultM <= ALUResultE;
        WriteDataM <= WriteDataE;
        RdM <= RdE; 
        PCPlus4M <= PCPlus4E;        
    end
    
end

endmodule

