onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fullAdder_1bit_testbench/a
add wave -noupdate /fullAdder_1bit_testbench/b
add wave -noupdate /fullAdder_1bit_testbench/Cin
add wave -noupdate /fullAdder_1bit_testbench/out
add wave -noupdate /fullAdder_1bit_testbench/Cout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7336 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 214
configure wave -valuecolwidth 39
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {9409 ps}
