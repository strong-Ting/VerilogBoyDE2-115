## Generated SDC file "top.sdc"

## Copyright (C) 2020  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

## DATE    "Fri Jul  9 16:46:28 2021"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk_4} -period 200.000 -waveform { 0.000 100.000 } [get_nets {PLL_0_inst|altpll_component|auto_generated|wire_pll1_clk[0]}]
create_clock -name {clk_25M} -period 40.000 -waveform { 0.000 20.000 } [get_nets {PLL_0_inst|altpll_component|auto_generated|wire_pll1_clk[1]}]
create_clock -name {clk_15} -period 60.000 -waveform { 0.000 30.000 } [get_nets {PLL_0_inst|altpll_component|auto_generated|wire_pll1_clk[2]}]
create_clock -name {clkGlb} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clkGlb}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk_4}] -rise_to [get_clocks {clk_25M}]  1.020  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -fall_to [get_clocks {clk_25M}]  1.020  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -rise_to [get_clocks {clk_15}]  1.020  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -fall_to [get_clocks {clk_15}]  1.020  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -rise_to [get_clocks {clk_25M}]  1.020  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -fall_to [get_clocks {clk_25M}]  1.020  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -rise_to [get_clocks {clk_15}]  1.020  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -fall_to [get_clocks {clk_15}]  1.020  
set_clock_uncertainty -rise_from [get_clocks {clkGlb}] -rise_to [get_clocks {clkGlb}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clkGlb}] -fall_to [get_clocks {clkGlb}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clkGlb}] -rise_to [get_clocks {clk_4}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clkGlb}] -fall_to [get_clocks {clk_4}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clkGlb}] -rise_to [get_clocks {clkGlb}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clkGlb}] -fall_to [get_clocks {clkGlb}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clkGlb}] -rise_to [get_clocks {clk_4}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clkGlb}] -fall_to [get_clocks {clk_4}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk_25M}] -rise_to [get_clocks {clk_25M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_25M}] -fall_to [get_clocks {clk_25M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_25M}] -rise_to [get_clocks {clk_25M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_25M}] -fall_to [get_clocks {clk_25M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_15}] -rise_to [get_clocks {clk_15}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_15}] -fall_to [get_clocks {clk_15}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_15}] -rise_to [get_clocks {clk_15}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_15}] -fall_to [get_clocks {clk_15}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -rise_to [get_clocks {clkGlb}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -fall_to [get_clocks {clkGlb}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -rise_to [get_clocks {clk_4}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -fall_to [get_clocks {clk_4}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -rise_to [get_clocks {clkGlb}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -fall_to [get_clocks {clkGlb}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -rise_to [get_clocks {clk_4}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -fall_to [get_clocks {clk_4}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk_4}]  10.000 [get_ports {PB}]
set_input_delay -add_delay  -clock [get_clocks {clk_4}]  10.000 [get_ports {PS2_CLK}]
set_input_delay -add_delay  -clock [get_clocks {clk_4}]  10.000 [get_ports {PS2_DAT}]
set_input_delay -add_delay  -clock [get_clocks {clk_4}]  10.000 [get_ports {SW[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk_4}]  10.000 [get_ports {SW[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk_4}]  10.000 [get_ports {SW[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk_4}]  10.000 [get_ports {SW[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk_4}]  10.000 [get_ports {SW[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk_4}]  10.000 [get_ports {SW[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk_4}]  10.000 [get_ports {SW[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk_4}]  10.000 [get_ports {SW[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk_4}]  10.000 [get_ports {ur_rx}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk_15}]  5.000 [get_ports {AUDIO_BCLK}]
set_output_delay -add_delay  -clock [get_clocks {clk_15}]  5.000 [get_ports {AUDIO_DACDATA}]
set_output_delay -add_delay  -clock [get_clocks {clk_15}]  5.000 [get_ports {AUDIO_DACLRCK}]
set_output_delay -add_delay  -clock [get_clocks {clk_15}]  5.000 [get_ports {AUDIO_MCLK}]
set_output_delay -add_delay  -clock [get_clocks {clk_15}]  5.000 [get_ports {AUDIO_SCL}]
set_output_delay -add_delay  -clock [get_clocks {clk_15}]  5.000 [get_ports {AUDIO_SDA}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_BLANK_B}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_B[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_B[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_B[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_B[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_B[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_B[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_B[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_B[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_CLK}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_G[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_G[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_G[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_G[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_G[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_G[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_G[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_G[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_HSYNC}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_R[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_R[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_R[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_R[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_R[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_R[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_R[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_R[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_SCL}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_SDA}]
set_output_delay -add_delay  -clock [get_clocks {clk_25M}]  5.000 [get_ports {VGA_VSYNC}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

