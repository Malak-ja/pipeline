module DataMemory (
    input clk,
    input Memwrite, // Signal to control memory write operation
    input Memread,  // Signal to control memory read operation
    input  [31:0] addr,
    input  [31:0] data_in,
    output reg [31:0] data_out
);

    reg [31:0] mem [0:63]; // Data memory with 64 locations

    always @(posedge clk) begin
        if (Memwrite) begin
            // Write operation: Write data_in to mem at addr
            mem[addr] <= data_in;
        end
        if (Memread) begin
            // Read operation: Read data from mem at addr and assign to data_out
            data_out <= mem[addr];
        end
    end

endmodule
