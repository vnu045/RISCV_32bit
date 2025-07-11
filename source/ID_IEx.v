module ID_IEx  (input wire clk, reset, clear,
                input wire [31:0] RD1D, RD2D, PCD, 
                input wire [4:0] Rs1D, Rs2D, RdD, 
                input wire [31:0] ImmExtD, PCPlus4D,
                output reg [31:0] RD1E, RD2E, PCE, 
                output reg [4:0] Rs1E, Rs2E, RdE, 
                output reg [31:0] ImmExtE, PCPlus4E);

    always @( posedge clk or negedge reset ) begin
        if (!reset) begin
            RD1E <= 0;
            RD2E <= 0;
            PCE <= 0;
            Rs1E <= 0;
            Rs2E <= 0;
            RdE <= 0;
            ImmExtE <= 0;
            PCPlus4E <= 0;
        end

        else if (clear) begin
            RD1E <= 0;
            RD2E <= 0;
            PCE <= 0;
            Rs1E <= 0;
            Rs2E <= 0;
            RdE <= 0;
            ImmExtE <= 0;
            PCPlus4E <= 0;
        end
        else begin
            RD1E <= RD1D;
            RD2E <= RD2D;
            PCE <= PCD;
            Rs1E <= Rs1D;
            Rs2E <= Rs2D;
            RdE <= RdD;
            ImmExtE <= ImmExtD;
            PCPlus4E <= PCPlus4D;
        end

    end

endmodule