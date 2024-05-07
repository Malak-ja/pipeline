module PC (
    input clk,
    input rst,
    input [31:0] PC,
    output [31:0] pc_next
);

reg [31:0] pc_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        pc_reg <= 32'h00000000;
    end else begin
        pc_reg <= (rst) ? 32'h00000000 : PC;  // Reset PC if rst is high, else update PC with input value
    end
end

assign pc_next = pc_reg + 4;  // Increment PC by 4 bytes for next instruction

endmodule
