`timescale 1ns / 1ps

module morse_decoder_tb;
    // Inputs
    reg [7:0] morse_array;  // 8-bit Morse code input
    reg new_input_ready;     // Signal indicating new Morse code input is ready

    // Outputs
    wire [6:0] seg_out;     // 7-segment output

    // Instantiate the morse_decoder module
    morse_decoder uut (
        .morse_array(morse_array),
        .new_input_ready(new_input_ready),
        .seg_out(seg_out)
    );

    // Initial block to apply test cases
    initial begin
        // Initialize inputs
        morse_array = 8'b0;
        new_input_ready = 0;

        // Apply test vectors
        // Test A: .-
        #10 morse_array = 8'b00000110;  // A Morse code
        new_input_ready = 1;
        #10 new_input_ready = 0;

        // Test B: -...
        #10 morse_array = 8'b10010101;  // B Morse code
        new_input_ready = 1;
        #10 new_input_ready = 0;

        // Test C: -.-.
        #10 morse_array = 8'b10011001;  // C Morse code
        new_input_ready = 1;
        #10 new_input_ready = 0;

        // Test D: -..
        #10 morse_array = 8'b00100101;  // D Morse code
        new_input_ready = 1;
        #10 new_input_ready = 0;

        // Test E: .
        #10 morse_array = 8'b00000001;  // E Morse code
        new_input_ready = 1;
        #10 new_input_ready = 0;

        // Test F: ..-.
        #10 morse_array = 8'b01011001;  // F Morse code
        new_input_ready = 1;
        #10 new_input_ready = 0;

        // Test G: --.
        #10 morse_array = 8'b00101001;  // G Morse code
        new_input_ready = 1;
        #10 new_input_ready = 0;

        // Test Z: --..
        #10 morse_array = 8'b10100101;  // Z Morse code
        new_input_ready = 1;
        #10 new_input_ready = 0;

        // Finish simulation
        #10 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t, morse_array: %b, seg_out: %b", $time, morse_array, seg_out);
    end

endmodule
