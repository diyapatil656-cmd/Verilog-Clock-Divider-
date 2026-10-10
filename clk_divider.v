// clk_divider.v
// A variable clock divider that cuts down an input clock frequency by a fixed factor.

module clk_divider (
    input      clk_in,   // Fast Master Input Clock (e.g., 50MHz)
    input      rst_n,    // Active-low asynchronous reset
    output reg clk_out   // Slow Divided Output Clock
);

    // Divides by 4: Out toggles every 2 input clock cycles.
    // Adjust the count limit parameter below to change the output speed.
    parameter DIVIDE_LIMIT = 32'd2; 
    
    reg [31:0] counter;

    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 32'd0;
            clk_out <= 1'b0; // Default clock line low
        end else begin
            if (counter >= (DIVIDE_LIMIT - 1)) begin
                counter <= 32'd0;
                clk_out <= ~clk_out; // Toggle output clock bit to create square wave
            end else begin
                counter <= counter + 1'b1;
            end
        end
    end

endmodule
