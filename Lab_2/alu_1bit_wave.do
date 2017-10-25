onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label a /alu_1bit_testbench/a
add wave -noupdate -label b /alu_1bit_testbench/b
add wave -noupdate /alu_1bit_testbench/bBar
add wave -noupdate -label Cin /alu_1bit_testbench/Cin
add wave -noupdate -label out /alu_1bit_testbench/out
add wave -noupdate -label Cout /alu_1bit_testbench/Cout
add wave -noupdate -label en /alu_1bit_testbench/en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16236 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {52500 ps}
