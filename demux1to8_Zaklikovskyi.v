module demux1to8 (
    input wire D,           // Input data signal
    input wire [2:0] S,     // Selector (address) bits
    input wire EN,          // Enable input (active low)
    output reg [7:0] Y      // 8-bit output bus
);

always @(*) begin
    if (EN) begin
        // If EN = 1, set all outputs to high-impedance state
        Y = 8'bzzzzzzzz;
    end else begin
        // Default: all outputs set to logic 0
        Y = 8'b00000000;
        // Route input D to the output selected by S
        Y[S] = D;
    end 
end

endmodule