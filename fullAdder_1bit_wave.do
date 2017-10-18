onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Cin /fullAdder_1bit_testbench/Cin
add wave -noupdate -label Cout /fullAdder_1bit_testbench/Cout
add wave -noupdate -label out /fullAdder_1bit_testbench/out
add wave -noupdate -label a /fullAdder_1bit_testbench/a
add wave -noupdate -label b /fullAdder_1bit_testbench/b
add wave -noupdate -label sel /fullAdder_1bit_testbench/sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {782 ps} {1328 ps}
