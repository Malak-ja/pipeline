module ALUCONTROL(clk, ALUControl, ALUOp, funct);

input clk;
input [1:0] ALUOp;
input [5:0] funct;
output [3:0] ALUControl;

assign ALUControl = 	
         (ALUOp == 2'b00) ? 4'b0010:
			(ALUOp == 2'b00) ? 4'b0010:
			(ALUOp == 2'b01) ? 4'b0110:
			(ALUOp == 2'b10) ? 
				((funct == 6'b100000) ? 4'b0010:
				 (funct == 6'b100010) ? 4'b0110:
             (funct == 6'b100101) ? 4'b0001: 
				 (funct == 6'b100100) ? 4'b0000:4'bxxxx): 4'bxxxx;
				 

endmodule
