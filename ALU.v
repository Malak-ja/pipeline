module ALU (
    input  [31:0] in_A,
    input  [31:0] in_B,
    input  [3:0]  ALUControl,
    output reg [31:0] ALUResult,
    output reg zero
);

    // Internal wire
    reg [31:0] alu_result;

    // ALU operations
    always @* begin
        case (ALUControl)
            4'b0010: alu_result = in_A + in_B; // ADD
            4'b0110: alu_result = in_A - in_B; // SUB
            4'b0000: alu_result = in_A & in_B; // AND
            4'b0001: alu_result = in_A | in_B; // OR
            4'b0010: alu_result = in_A + in_B; // LOAD
            4'b0010: alu_result = in_A + in_B; // STORE
            default: alu_result = in_A + in_B; // Default to ADD
        endcase
    end

    // Branch instruction based on zero flag
    always @* begin
        if (ALUControl == 4'b0110) begin // BEQ (branch if equal)
            if (in_A == in_B) begin
                // Subtract the inputs and set zero flag based on result
                if ((in_A - in_B) == 0)
                    zero = 1; // If equal and result is 0, set zero flag to 1
                else
                    zero = 0; // If equal but result is not 0, set zero flag to 0
            end else begin
                // Inputs are not equal, so zero flag is set to 0
                zero = 0;
            end
        end
        // Add more branch instructions here if needed
    end

    // Assign ALU result
    always @* begin
        ALUResult <= alu_result;
    end

endmodule

