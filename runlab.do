# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.

vlog "./mux2_1.sv"
vlog "./D_FF.sv"
vlog "./Decoder_1x2.sv"
vlog "./Decoder_2x4.sv"
vlog "./Decoder_4x16.sv"
vlog "./Decoder_5x32.sv"

vlog "./mux_2x1.sv"
vlog "./mux_4x1.sv"
vlog "./mux_16x1.sv"
vlog "./mux_32x1.sv" 

vlog "./D_FF_x64.sv" 

vlog "./regfile.sv" 









# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.

vsim -voptargs="+acc" -t 1ps -lib work regfile_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.

do regfile_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End