`timescale 1ns / 1ps

module morse_top_tb;

    // Inputs
    reg clk;
    reg rst;
    reg button;

    // Outputs
    wire [6:0] seg_out;

    // Instantiate the morse_top module
    morse_top uut (
        .clk(clk),
        .rst(rst),
        .button(button),
        .seg_out(seg_out)
    );

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #2 clk = ~clk;  // 500 kHz clock (2ns period)
    end

    initial begin
        button = 0;
        rst = 1;
        #50 rst = 0;  // Reset pulse

        // Morse code for U (..-)
        // Dot (.) - U character part 1
        button = 1; 
        #6050 button = 0;  // Press for DOT_TIME (dot)

        // Dot (.) - U character part 2
        #6050 button = 1; 
        #6050 button = 0;  // Press for DOT_TIME (dot)

        // Dash (-) - U character part 3
        #6050 button = 1; 
        #15000 button = 0;  // Press for DASH_TIME (dash)
        #15000 ;
        // Char pause after U, ready for next character
        #6050 button = 1;  // Ready for next input (if any)

        // Morse code for I (..)
        // Dot (.) - I character part 1
        button = 1; 
        #6050 button = 0;  // Press for DOT_TIME (dot)

        // Dot (.) - I character part 2
        #6050 button = 1; 
        #6050 button = 0;  // Press for DOT_TIME (dot)
        
        #15000;

        // End of simulation
        #15000 $finish;  // Finish simulation after testing
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t, seg_out: %b", $time, seg_out);
    end

endmodule
