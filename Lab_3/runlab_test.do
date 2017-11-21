# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./cpustim.sv"
vlog "./CPU_64bit.sv"
vlog "./controlLogic.sv"
vlog "./math.sv"
vlog "./pcUnit.sv"
vlog "./alu.sv"
vlog "./alu_1bit.sv"
vlog "./fullAdder_64bit.sv"
vlog "./fullAdder_1bit.sv"
vlog "./instructmem.sv"
vlog "./datamem.sv"
vlog "./regfile.sv"
vlog "./zero_flag.sv"
vlog "./nor_16x1.sv"
vlog "./mux2_1.sv"
vlog "./mux_4_1.sv"
vlog "./mux8_1.sv"
vlog "./mux16_1.sv"
vlog "./mux32_1.sv"
vlog "./mux10_5.sv"
vlog "./mux128_64.sv"
vlog "./mux256_64.sv"
vlog "./decode_1_2.sv"
vlog "./decode_2_4.sv"
vlog "./decode_3_8.sv"
vlog "./decode_5_32.sv"
vlog "./D_FF.sv"
vlog "./D_FF_enable.sv"


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work cpustim

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do cpustim_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
