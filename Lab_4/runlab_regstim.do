# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./regstim.sv"
vlog "./regfile.sv"
vlog "./decode_1_2.sv"
vlog "./decode_2_4.sv"
vlog "./decode_3_8.sv"
vlog "./decode_5_32.sv"
vlog "./mux2_1.sv"
vlog "./mux_4_1.sv"
vlog "./mux16_1.sv"
vlog "./mux32_1.sv"
vlog "./D_FF.sv"
vlog "./D_FF_enable.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work regstim

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do regstim_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
