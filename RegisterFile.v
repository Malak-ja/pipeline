module RegisterFile (
    input         clk,
    input  [4:0]  RA,
    input  [4:0]  RB,
    input  [4:0]  RW,
    input         RegWrite,
    input  [31:0] BusW,
    output [31:0] BusA,
    output [31:0] BusB
);

    reg [31:0] regs [0:31]; // Register file with 32 registers

    always @(posedge clk) begin
        if (RegWrite) begin
            regs[RW] <= BusW; // Write operation
        end
    end

    assign BusA = regs[RA];
    assign BusB = regs[RB];

endmodule
