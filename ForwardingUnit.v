module ForwardingUnit (
    input [4:0] EX_MEM_rd,
    input [4:0] MEM_WB_rd,
    input [4:0] ID_EX_rs,
    input [4:0] ID_EX_rt,
    output reg [1:0] forward_A,
    output reg [1:0] forward_B
);



// Forwarding logic
always @* begin
    // Forward A
    if (EX_MEM_rd != 5'b00000 && EX_MEM_rd == ID_EX_rs) begin
        forward_A = 2'b10; // Forward from EX_MEM stage
    end else if (MEM_WB_rd != 5'b00000 && MEM_WB_rd == ID_EX_rs) begin
        forward_A = 2'b01; // Forward from MEM_WB stage
    end else begin
        forward_A = 2'b00; // No forwarding
    end
    
    // Forward B
    if (EX_MEM_rd != 5'b00000 && EX_MEM_rd == ID_EX_rt) begin
        forward_B = 2'b10; // Forward from EX_MEM stage
    end else if (MEM_WB_rd != 5'b00000 && MEM_WB_rd == ID_EX_rt) begin
        forward_B = 2'b01; // Forward from MEM_WB stage
    end else begin
        forward_B = 2'b00; // No forwarding
    end
end

endmodule