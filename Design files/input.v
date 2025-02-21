`timescale 1ns / 1ps

module morse_input(
    input clk,
    input rst,
    input button,
    output reg [7:0] morse_array,
    output reg [7:0] morse_arrayy,
    output reg new_input_ready
);
    // Parameters
    parameter UNIT_TIME = 2000;
    parameter DOT_TIME = UNIT_TIME;
    parameter DASH_TIME = 4 * UNIT_TIME;
    parameter PAUSE_TIME = DOT_TIME;
    parameter WORD_PAUSE_TIME = 4 * UNIT_TIME;

    // State definitions
    localparam state_Start = 3'b000;
    localparam state_hold = 3'b001;
    localparam state_Char_pause2 = 3'b010;

    // Internal signals
    reg [15:0] press_time2 = 0;
    reg [15:0] no_press2 = 0;
    reg [2:0] state;
    reg [3:0] debounce_counter;
    reg debounced_button;
    

always @(posedge clk or posedge rst) begin
    if (rst) begin
        debounce_counter <= 0;
        debounced_button <= 0;
    end else begin
        if (button == debounced_button) begin
            debounce_counter <= 0;
        end else if (debounce_counter < 4'd15) begin
            debounce_counter <= debounce_counter + 1;
        end else begin
            debounced_button <= button;
        end
    end
end


    always @(posedge clk or posedge rst) 
    begin
        if (rst) 
        begin
            state <= state_Start;
            morse_array <= 0;
            morse_arrayy <= 0;
            press_time2 <= 0;
            no_press2 <= 0;
            new_input_ready <= 1; 
            
        end 
        else 
        begin
            case (state)
                state_Start: 
                    if (button) 
                    begin
                        state <= state_hold;  
                        press_time2 <= 1;
                        new_input_ready <= 0;
                    end
                    else 
                    begin
                        morse_array <= 0;
                        press_time2 <= 0;
                        no_press2 <= 0;
                    end 

                state_hold: 
                    if (button) 
                    begin
                        press_time2 <= press_time2 + 1;
                    end 
                    else 
                    begin
                        if (press_time2 <= DOT_TIME) 
                        begin
                            morse_array <= {morse_array[5:0], 2'b01}; // Dot
                        end 
                        else if (press_time2 < DASH_TIME) 
                        begin
                            morse_array <= {morse_array[5:0], 2'b10}; // Dash
                        end 
                        else 
                        begin
                            morse_array <= 8'b00000000; // Invalid input
                        end
                        state <= state_Char_pause2;
                        press_time2 <= 0;
                    end 

                state_Char_pause2:   
                    if (!button) 
                    begin
                        if (no_press2 < WORD_PAUSE_TIME)
                            no_press2 <= no_press2 + 1;
                        else
                        begin
                            state <= state_Start;
                            morse_arrayy <=morse_array;
                            new_input_ready <= 1;
                            morse_array <= 8'b00000000;
                            no_press2 <= 0;
                        end
                    end 
                    else 
                    begin
                        press_time2 <= 1;
                        state <= state_hold;
                    end
            endcase
        end
    end
endmodule

