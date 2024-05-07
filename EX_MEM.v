module EX_MEM (
    input clk,
    input RegWrite, MemtoReg,
    input MemWrite, MemRead, 
    input [31:0] ALUresult, writedata,
    input [4:0] writeReg,
    input [31:0] PCPlus4Out_in,
    output reg RegWriteOut, MemtoRegOut, MemWriteOut, MemReadOut,
    output reg [31:0] ALUresultOut, writedataOut, PCPlus4Out_out,
    output reg [4:0] writeRegOut
);

always @(posedge clk) begin
    RegWriteOut <= RegWrite;
    MemtoRegOut <= MemtoReg;
    MemWriteOut <= MemWrite;
    MemReadOut <= MemRead;
    ALUresultOut <= ALUresult;
    writedataOut <= writedata;
    writeRegOut <= writeReg;
    PCPlus4Out_out <= PCPlus4Out_in;
end

endmodule
