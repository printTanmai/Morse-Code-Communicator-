`timescale 1ns / 1ps

module morse_top (
    input clk,
    input rst,
    input button,
    output [6:0] seg_out  // 7-segment display output
);
    // Internal signals
    wire [7:0] morse_array;
    wire [7:0] morse_arrayy;
    wire new_input_ready;

    // Instantiate the morse_input module
    morse_input input_module (
        .clk(clk),
        .rst(rst),
        .button(button),
        .morse_array(morse_array),
        .morse_arrayy(morse_arrayy),
        .new_input_ready(new_input_ready)
    );

    // Instantiate the morse_decoder module
    morse_decoder decoder_module (
        .morse_array(morse_arrayy),
        .new_input_ready(new_input_ready),
        .seg_out(seg_out)
    );

endmodule

