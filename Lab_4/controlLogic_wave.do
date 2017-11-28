onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label OpCode /controlLogic_testbench/OpCode
add wave -noupdate -label zero /controlLogic_testbench/zero
add wave -noupdate -label negative /controlLogic_testbench/negative
add wave -noupdate -label carryout /controlLogic_testbench/carryout
add wave -noupdate -label overflow /controlLogic_testbench/overflow
add wave -noupdate -label RegWrite /controlLogic_testbench/RegWrite
add wave -noupdate -label Reg2Loc /controlLogic_testbench/Reg2Loc
add wave -noupdate -label ALUSrc /controlLogic_testbench/ALUSrc
add wave -noupdate -label MemWrite /controlLogic_testbench/MemWrite
add wave -noupdate -label MemToReg /controlLogic_testbench/MemToReg
add wave -noupdate -label UncondBr /controlLogic_testbench/UncondBr
add wave -noupdate -label BrTaken /controlLogic_testbench/BrTaken
add wave -noupdate -label Imm_12 /controlLogic_testbench/Imm_12
add wave -noupdate -label read_en /controlLogic_testbench/read_en
add wave -noupdate -label ALUOp /controlLogic_testbench/ALUOp
add wave -noupdate /controlLogic_testbench/movk
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
