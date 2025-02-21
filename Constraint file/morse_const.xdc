## Clock signal
set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Input Button (Example)
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports button]  # Connect the 'button' to the corresponding pin

## Output Morse Code Array (e.g., 8-bit output for morse_array)
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports morse_array[0]]
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports morse_array[1]]
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports morse_array[2]]
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports morse_array[3]]
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports morse_array[4]]
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports morse_array[5]]
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports morse_array[6]]
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports morse_array[7]]

## Output New Input Ready (example 1-bit signal for new_input_ready)
set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports new_input_ready]  # Example pin for new_input_ready

## Switches (example to use some switches for other inputs, if necessary)
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {sw[0]}]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports {sw[1]}]
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports {sw[2]}]

## LEDs (for debugging output)
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports led[0]]  # Just an example, customize as needed
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports led[1]]
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports led[2]]
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports led[3]]

## Buttons (Example to use buttons as inputs for control, etc.)
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports btnC]
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports btnU]

## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

## SPI configuration mode options for QSPI boot, can be used for all designs
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
