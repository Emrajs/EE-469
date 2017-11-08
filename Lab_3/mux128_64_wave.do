onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mux128_64_testbench/inOne
add wave -noupdate /mux128_64_testbench/inZero
add wave -noupdate -radix hexadecimal /mux128_64_testbench/out
add wave -noupdate /mux128_64_testbench/sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {795 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 135
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
WaveRestoreZoom {0 ps} {7978 ps}
