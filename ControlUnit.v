module ControlUnit (
    input [5:0] opcode,
    output reg RegDst,
    output reg [1:0] ALUOp,
    output reg ALUSrc,
    output reg Branch,
    output reg MemRead,
    output reg MemWrite,
    output reg RegWrite,
    output reg MemtoReg
);

// Default values
initial begin
    RegDst = 1'b0;
    ALUOp = 2'b00;
    ALUSrc = 1'b0;
    Branch = 1'b0;
    MemRead = 1'b0;
    MemWrite = 1'b0;
    RegWrite = 1'b0;
    MemtoReg = 1'b0;
end

// Control signals based on opcode
always @* begin
    case (opcode)
        // R-type instructions
        6'b000000: begin
            RegDst = 1'b1;
            ALUOp = 2'b10;
            ALUSrc = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            MemtoReg = 1'b0;
        end
        // Load instruction
        6'b100011: begin
            RegDst = 1'b0;
            ALUOp = 2'b00;
            ALUSrc = 1'b1;
            Branch = 1'b0;
            MemRead = 1'b1;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            MemtoReg = 1'b1;
        end
        // Store instruction
        6'b101011: begin
            RegDst = 1'bX;
            ALUOp = 2'b00;
            ALUSrc = 1'b1;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b1;
            RegWrite = 1'b0;
            MemtoReg = 1'bX;
        end
        // Branch instruction
        6'b000100: begin
            RegDst = 1'bX;
            ALUOp = 2'b01;
            ALUSrc = 1'b0;
            Branch = 1'b1;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b0;
            MemtoReg = 1'bX;
        end
    endcase
end

endmodule
