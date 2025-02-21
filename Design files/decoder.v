`timescale 1ns / 1ps

module morse_decoder (
    input [7:0] morse_array,  // 8-bit Morse code input
    input new_input_ready,    // Signal indicating new Morse code input is ready
    output reg [6:0] seg_out  // 8-bit display output (8-bit for your specific needs)
);
    reg [6:0] previous_seg_out;
    always @(posedge new_input_ready) begin
        if (new_input_ready) begin
            case (morse_array)
                8'b00000110: seg_out = 7'b0000010;  // A: .-
                8'b10010101: seg_out = 7'b1100000;  // B: -...
                8'b10011001: seg_out = 7'b0110001;  // C: -.-.
                8'b00100101: seg_out = 7'b1000010;  // D: -..
                8'b00000001: seg_out = 7'b0110000;  // E: .
                8'b01011001: seg_out = 7'b0111000;  // F: ..-.
                8'b00101001: seg_out = 7'b0000100;  // G: --.
                8'b01010101: seg_out = 7'b1001000;  // H: ....
                8'b00000101: seg_out = 7'b1111001;  // I: ..
                8'b01101010: seg_out = 7'b1000111;  // J: .---
              //  8'b00100110: seg_out = 7'b0111000;  // K: -.-
                8'b01100101: seg_out = 7'b1110001;  // L: .-..
              //  8'b00001010: seg_out = 7'b0001001;  // M: -- 
              //  8'b00001001: seg_out = 7'b1101010;  // N: -. 
                8'b00101010: seg_out = 7'b0000001;  // O: --- 
                8'b01101001: seg_out = 7'b0011000;  // P: .--.
              //  8'b10100110: seg_out = 7'b0010000;  // Q: --.-
              //  8'b00011001: seg_out = 7'b1101011;  // R: .-.
                8'b00010101: seg_out = 7'b0100100;  // S: ...
                8'b00000010: seg_out = 7'b1110000;  // T: -
                8'b00010110: seg_out = 7'b1000001;  // U: ..-
              //  8'b01010110: seg_out = 7'b1000001;  // V: ...-
              //  8'b00011010: seg_out = 7'b1000001;  // W: .--
              //  8'b10010110: seg_out = 7'b1001000;  // X: -..-
                8'b10011010: seg_out = 7'b1000100;  // Y: -.-- 
                8'b10100101: seg_out = 7'b0010010;  // Z: --..
                default: seg_out = previous_seg_out;  // Default case, all segments off
            endcase
        end else begin
            seg_out = previous_seg_out;  // No new input is ready, turn off all segments
        end
    end
    always @(new_input_ready ) begin
        previous_seg_out <= seg_out;  // Store current seg_out for next time when needed
    end
endmodule



