## Generated SDC file "top.out.sdc"

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

## DATE    "Thu Jul  8 15:02:16 2021"

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

create_clock -name {clkGlb} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clkGlb}]
create_clock -name {clk_4} -period 200.000 -waveform { 0.000 100.000 } [get_pins {PLL_0_inst|altpll_component|auto_generated|pll1|clk[0]}]
create_clock -name {clk_25M} -period 40.000 -waveform { 0.000 20.000 } [get_pins {PLL_0_inst|altpll_component|auto_generated|pll1|clk[1]}]
create_clock -name {clk_15} -period 60.000 -waveform { 0.000 30.000 } [get_pins {PLL_0_inst|altpll_component|auto_generated|pll1|clk[2]}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clkGlb}] -rise_to [get_clocks {clk_4}] -setup 0.300  
set_clock_uncertainty -rise_from [get_clocks {clkGlb}] -rise_to [get_clocks {clk_4}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clkGlb}] -fall_to [get_clocks {clk_4}] -setup 0.300  
set_clock_uncertainty -rise_from [get_clocks {clkGlb}] -fall_to [get_clocks {clk_4}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {clkGlb}] -rise_to [get_clocks {clk_4}] -setup 0.300  
set_clock_uncertainty -fall_from [get_clocks {clkGlb}] -rise_to [get_clocks {clk_4}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {clkGlb}] -fall_to [get_clocks {clk_4}] -setup 0.300  
set_clock_uncertainty -fall_from [get_clocks {clkGlb}] -fall_to [get_clocks {clk_4}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -rise_to [get_clocks {clk_4}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -fall_to [get_clocks {clk_4}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -rise_to [get_clocks {clk_25M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -fall_to [get_clocks {clk_25M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -rise_to [get_clocks {clk_15}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_4}] -fall_to [get_clocks {clk_15}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -rise_to [get_clocks {clk_4}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -fall_to [get_clocks {clk_4}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -rise_to [get_clocks {clk_25M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -fall_to [get_clocks {clk_25M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -rise_to [get_clocks {clk_15}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_4}] -fall_to [get_clocks {clk_15}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clkGlb}] -rise_to [get_clocks {clkGlb}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clkGlb}] -fall_to [get_clocks {clkGlb}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clkGlb}] -rise_to [get_clocks {clkGlb}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clkGlb}] -fall_to [get_clocks {clkGlb}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_25M}] -rise_to [get_clocks {clk_25M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_25M}] -fall_to [get_clocks {clk_25M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_25M}] -rise_to [get_clocks {clk_25M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_25M}] -fall_to [get_clocks {clk_25M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_15}] -rise_to [get_clocks {clk_15}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_15}] -fall_to [get_clocks {clk_15}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_15}] -rise_to [get_clocks {clk_15}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_15}] -fall_to [get_clocks {clk_15}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************
set_input_delay -clock {clk_4} -max 10 [all_inputs]
set_input_delay -clock {clk_4} -min 5 [all_inputs]
set_output_delay -clock {clk_4} -max 10 [all_outputs]
set_output_delay -clock {clk_4} -min 5 [all_outputs]


set_input_delay -clock {clk_25M} -max 10 [all_inputs]
set_input_delay -clock {clk_25M} -min 5 [all_inputs]
set_output_delay -clock {clk_25M} -max 10 [all_outputs]
set_output_delay -clock {clk_25M} -min 5 [all_outputs]

set_input_delay -clock {clk_15} -max 10 [all_inputs]
set_input_delay -clock {clk_15} -min 5 [all_inputs]
set_output_delay -clock {clk_15} -max 10 [all_outputs]
set_output_delay -clock {clk_15} -min 5 [all_outputs]


#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



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

