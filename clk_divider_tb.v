// clk_divider_tb.v
// Testbench to visualize and verify clock division matching parameters

`timescale 1ns / 1ps

module clk_divider_tb;

    reg clk_in;
    reg rst_n;
    wire clk_out;

    // Instantiate Unit Under Test (Override division factor to 4 for simulation visibility)
    clk_divider #( .DIVIDE_LIMIT(32'd2) ) uut (
        .clk_in(clk_in),
        .rst_n(rst_n),
        .clk_out(clk_out)
    );

    // Generate Fast Input Clock (10ns period = 100MHz master source)
    always #5 clk_in = ~clk_in;

    initial begin
        // Initialize Control Pins
        clk_in = 0;
        rst_n  = 0;

        // Release reset pulse after 15ns
        #15;
        rst_n = 1;

        // Monitor clock pins toggling transitions over standard timeline logs
        $monitor("Time=%0dns | Reset=%b | Input Master Clock=%b | Divided Output Clock=%b", 
                 $time, rst_n, clk_in, clk_out);

        // Run simulation long enough to observe multiple full slow clock pulse periods
        #100;

        $finish;
    end

endmodule
