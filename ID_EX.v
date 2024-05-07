module ID_EX (
    input wire RegWrite, MemtoReg,
    input wire MemWrite, MemRead,
    input wire ALUSrc, RegDst,
    input wire [1:0] ALUOp,
    input wire [31:0] PCplus4, ReadData1_in, ReadData2_in, SignExtendResult_in,
    input wire [14:0] regAddresss_in,
    input wire clk,
    output reg RegWriteOut, MemtoRegOut,
    output reg MemWriteOut, MemReadOut,
    output reg [1:0] ALUOpOut,
    output reg [31:0] PCplus4out, ReadData1_out, ReadData2_out, SignExtendResult_out,
    output reg [4:0] rsOut, rtOut, rdOut,
    output reg RegDstOut
);

    always @(posedge clk) begin
        PCplus4out <= PCplus4;
        ReadData1_out <= ReadData1_in;
        ReadData2_out <= ReadData2_in;
        SignExtendResult_out <= SignExtendResult_in;
        rsOut <= regAddresss_in[14:10];
        rtOut <= regAddresss_in[9:5];
        rdOut <= regAddresss_in[4:0];
        RegWriteOut <= RegWrite;
        MemtoRegOut <= MemtoReg;
        MemWriteOut <= MemWrite;
        MemReadOut <= MemRead;
        ALUOpOut <= ALUOp;
        RegDstOut <= RegDst;
    end

endmodule

