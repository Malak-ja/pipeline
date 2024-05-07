module InstructionMemory(
    input clock,
    input [31:0] address,
    output reg [31:0] inst
);

    reg [31:0] Mem [0:127];
    
    initial begin
        // Initialize memory with sample instructions
        Mem[0]  = 32'h01095020; // add $t2 $t0 $t1
        Mem[1]  = 32'h0AC0A000; // sw $t2 0($zero) // Hazard here
        Mem[2]  = 32'h01495822; // sub $t3 $t2 $t1 // Hazard here
        Mem[3]  = 32'h1168FFFC; // beq $t3 $t0 -4  // Hazard here
        Mem[4]  = 32'h0AC0A000; // sw $t2 0($zero)
        // Add more instructions as needed...
    end
    
    always @(posedge clock) begin
        inst <= Mem[address[31:2]];
    end

endmodule
