onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label address /datamem_testbench/address
add wave -noupdate -label write_enable /datamem_testbench/write_enable
add wave -noupdate -label read_data /datamem_testbench/read_enable
add wave -noupdate -label write_data /datamem_testbench/write_data
add wave -noupdate -label clk /datamem_testbench/clk
add wave -noupdate -label xfer_size /datamem_testbench/xfer_size
add wave -noupdate -label read_data /datamem_testbench/read_data
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1700 ps}
