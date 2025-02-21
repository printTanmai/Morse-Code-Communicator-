# **Morse Code Communicator using Basys 3 FPGA Board**

## **Overview**
The **Morse Code Communicator** is a project designed to help **visually and speech-impaired** individuals communicate effectively using the well-known **Morse code**. This system leverages a Basys 3 FPGA board to decode user input (in the form of button presses) and display the corresponding Morse code on a 7-segment display. The user can input Morse code by pressing a button for **dots** (.) and **dashes** (-). The FPGA system decodes the input and shows the appropriate character on the display.

## **Purpose**
This project aims to provide a simple and intuitive interface for speech and visually impaired individuals, allowing them to input Morse code via button presses. The FPGA will process this input and display the corresponding letter using a 7-segment display. This system enhances communication without relying on sound or vision, making it highly beneficial for people with disabilities.

## **Project Components**
- **FPGA**: Basys 3 FPGA Board
- **7-Segment Display**: Displays decoded Morse code characters.
- **Button Input**: Used for entering Morse code (dots and dashes).
- **Morse Decoder**: Decodes Morse code into corresponding letters and drives the 7-segment display.
- **Morse Input**: Captures button presses to form Morse code signals.
  
## **Modules**
The project consists of the following main Verilog modules:

1. **`morse_input`**: Captures button presses to generate the 8-bit Morse code pattern (`morse_array` and `morse_arrayy`) and indicates when new input is ready (`new_input_ready`).
2. **`morse_decoder`**: Takes the 8-bit Morse code input and decodes it to the corresponding letter, which is displayed on the 7-segment display.
3. **`morse_top`**: The top-level module that connects the `morse_input` and `morse_decoder` modules, coordinating the overall operation of the system.
4. **Testbenches**: Simulation testbenches are provided for verifying each module and their integration.

## **Hardware Setup**
1. **Basys 3 FPGA Board**:
   - **Morse Code Input**: The input is provided via a button press (`button` signal).
   - **7-Segment Display**: The output (decoded Morse code character) is displayed on a 7-segment display (`seg_out`).

2. **Pin Assignment**:
   - The **clock** signal is tied to a 500 kHz clock on the Basys 3 FPGA board.
   - The **button** for Morse code input is assigned to a specific pin on the FPGA.
   - The **7-segment display** outputs the decoded character (7-bit output).

## **Waveform Simulation**
When running the testbenches, especially for verifying the results in the waveform window, ensure the **simulation runtime** is adjusted to around **15 to 20 seconds**. This is essential for viewing the complete transitions and ensuring that all the necessary timings (dot/dash) are properly captured. You can adjust the runtime in the simulation settings in tools like Vivado, ModelSim, or XSIM.

## **Testbench Overview**
The testbenches are designed to simulate the behavior of each module and verify that the entire system works as expected.

### 1. **`morse_top_tb`**:
   - This testbench simulates the top-level module, `morse_top`, which integrates the `morse_input` and `morse_decoder` modules. 
   - The test applies Morse code for letters "U" (`..-`) and "I" (`..`) and verifies that the 7-segment display (`seg_out`) reflects the correct characters.

### 2. **`morse_decoder_tb`**:
   - This testbench simulates the `morse_decoder` module and verifies that it correctly decodes various Morse code patterns into letters (such as "A", "B", "C", etc.).
   - Test cases are applied for multiple Morse code characters, and the output is monitored on the 7-segment display.

### 3. **`morse_input_tb`**:
   - This testbench simulates the `morse_input` module, which handles button press events. It verifies that the module correctly captures Morse code for letters "U" and "I" when the button is pressed in the correct sequence (dots and dashes).
   - The `morse_array` output is monitored for correct Morse code generation.

## **Simulation Details**
- **Clock Signal**: The clock is generated with a period of 2ns to simulate a 500 kHz signal.
- **Reset Pulse**: The system is reset initially to ensure it starts from a known state.
- **Button Press Timing**:
  - **Dot Time (`DOT_TIME`)**: A 6,050ns pulse is used to simulate a dot.
  - **Dash Time (`DASH_TIME`)**: A 15,000ns pulse is used to simulate a dash.
  - **Character Pause**: After each character is entered, a pause is applied before starting the next character.

## **Steps to Simulate**
1. **Setup**: Load the Verilog files for the modules (`morse_input`, `morse_decoder`, and `morse_top`) into your simulation tool (Vivado, ModelSim, XSIM).
2. **Run the Testbench**: 
   - Use the provided testbenches (`morse_top_tb`, `morse_decoder_tb`, `morse_input_tb`) to simulate the functionality of the entire system.
   - Verify the output in the waveform window.
3. **Adjust Simulation Runtime**: Ensure the runtime is set to around **15 to 20 seconds** in the simulation window to capture the timing of the button presses (dot and dash).
4. **Check Output**: The outputs (`seg_out`) for each test case are monitored in the simulation. Ensure the decoded character matches the expected letter for the given Morse code.

## **Code Description**
### **Modules**:
- **`morse_input`**:
  - Captures button presses and generates Morse code patterns.
  - Outputs `morse_array` and signals when the input is ready via `new_input_ready`.

- **`morse_decoder`**:
  - Decodes the generated Morse code pattern (`morse_array`) into a 7-segment display output (`seg_out`).

- **`morse_top`**:
  - Top-level module that integrates the input and decoder modules.

### **Constraint File**:
The provided constraint file specifies the pin assignments for the **Basys 3 FPGA board**. This includes:
- **Clock Signal**: The system clock is set to 500 kHz (`clk`).
- **Button**: Used for Morse code input.
- **7-Segment Display**: The output is mapped to the 7-segment display for visual feedback.

## **Conclusion**
The **Morse Code Communicator** is a simple yet effective solution for assisting visually and speech-impaired people to communicate using the well-established Morse code. The FPGA-based design ensures fast and reliable encoding/decoding of Morse signals, providing an intuitive and accessible communication method.

---

### **Simulation Results**
Below are images for simulation results:

1. **Elaborated Design**: This image shows the block diagram of the system design.

   ![Elaborated Design](https://github.com/user-attachments/assets/ed1efdd1-6a1b-442d-b102-68cd9def2a8f)


2. **Post-Synthesis Schematic**: This image shows the schematic after synthesis, indicating the final implementation of the system.

   ![Post-Synthesis Schematic](https://github.com/user-attachments/assets/b3de84d0-c25c-4834-83d1-b7aa45f9c4ce)


3. **Wave Window Simulation**: This image shows the waveform results from the simulation. It helps verify the functionality of the modules and timings, including dot and dash detection.

   ![Wave Window](https://github.com/user-attachments/assets/f3b559d7-7fd7-4839-b75c-93249bdc06b6)




---

### **Notes**:
- Please ensure that the **simulation runtime** is extended to 15-20 seconds to view all transitions properly in the waveform viewer.
- The code provided includes the simulation setup, which helps verify the functionality of each module before implementation on the FPGA hardware.
