onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /cpustim/clk
add wave -noupdate -label reset /cpustim/reset
add wave -noupdate -label ProgramCounter -radix hexadecimal -childformat {{{/cpustim/dut/theProgramCounter/in[63]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[62]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[61]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[60]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[59]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[58]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[57]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[56]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[55]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[54]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[53]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[52]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[51]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[50]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[49]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[48]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[47]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[46]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[45]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[44]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[43]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[42]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[41]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[40]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[39]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[38]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[37]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[36]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[35]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[34]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[33]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[32]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[31]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[30]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[29]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[28]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[27]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[26]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[25]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[24]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[23]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[22]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[21]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[20]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[19]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[18]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[17]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[16]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[15]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[14]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[13]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[12]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[11]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[10]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[9]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[8]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[7]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[6]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[5]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[4]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[3]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[2]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[1]} -radix hexadecimal} {{/cpustim/dut/theProgramCounter/in[0]} -radix hexadecimal}} -subitemconfig {{/cpustim/dut/theProgramCounter/in[63]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[62]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[61]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[60]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[59]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[58]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[57]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[56]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[55]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[54]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[53]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[52]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[51]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[50]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[49]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[48]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[47]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[46]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[45]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[44]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[43]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[42]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[41]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[40]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[39]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[38]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[37]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[36]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[35]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[34]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[33]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[32]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[31]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[30]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[29]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[28]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[27]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[26]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[25]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[24]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[23]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[22]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[21]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[20]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[19]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[18]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[17]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[16]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[15]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[14]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[13]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[12]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[11]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[10]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[9]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[8]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[7]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[6]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[5]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[4]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[3]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[2]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[1]} {-height 15 -radix hexadecimal} {/cpustim/dut/theProgramCounter/in[0]} {-height 15 -radix hexadecimal}} /cpustim/dut/theProgramCounter/in
add wave -noupdate -radix hexadecimal /cpustim/dut/theProgramCounter/out
add wave -noupdate -label theInstructions -radix hexadecimal /cpustim/dut/theInstructions/instruction
add wave -noupdate -label ReadData2 -radix hexadecimal -childformat {{{/cpustim/dut/registerFile/ReadData2[63]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[62]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[61]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[60]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[59]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[58]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[57]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[56]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[55]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[54]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[53]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[52]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[51]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[50]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[49]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[48]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[47]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[46]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[45]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[44]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[43]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[42]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[41]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[40]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[39]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[38]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[37]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[36]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[35]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[34]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[33]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[32]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[31]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[30]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[29]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[28]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[27]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[26]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[25]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[24]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[23]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[22]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[21]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[20]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[19]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[18]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[17]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[16]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[15]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[14]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[13]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[12]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[11]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[10]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[9]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[8]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[7]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[6]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[5]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[4]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[3]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[2]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[1]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData2[0]} -radix hexadecimal}} -subitemconfig {{/cpustim/dut/registerFile/ReadData2[63]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[62]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[61]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[60]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[59]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[58]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[57]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[56]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[55]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[54]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[53]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[52]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[51]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[50]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[49]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[48]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[47]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[46]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[45]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[44]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[43]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[42]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[41]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[40]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[39]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[38]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[37]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[36]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[35]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[34]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[33]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[32]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[31]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[30]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[29]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[28]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[27]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[26]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[25]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[24]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[23]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[22]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[21]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[20]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[19]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[18]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[17]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[16]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[15]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[14]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[13]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[12]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[11]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[10]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[9]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[8]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[7]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[6]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[5]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[4]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[3]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[2]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[1]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData2[0]} {-height 15 -radix hexadecimal}} /cpustim/dut/registerFile/ReadData2
add wave -noupdate -label ReadData1 -radix hexadecimal -childformat {{{/cpustim/dut/registerFile/ReadData1[63]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[62]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[61]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[60]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[59]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[58]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[57]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[56]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[55]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[54]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[53]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[52]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[51]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[50]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[49]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[48]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[47]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[46]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[45]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[44]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[43]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[42]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[41]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[40]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[39]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[38]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[37]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[36]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[35]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[34]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[33]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[32]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[31]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[30]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[29]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[28]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[27]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[26]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[25]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[24]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[23]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[22]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[21]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[20]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[19]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[18]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[17]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[16]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[15]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[14]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[13]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[12]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[11]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[10]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[9]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[8]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[7]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[6]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[5]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[4]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[3]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[2]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[1]} -radix hexadecimal} {{/cpustim/dut/registerFile/ReadData1[0]} -radix hexadecimal}} -subitemconfig {{/cpustim/dut/registerFile/ReadData1[63]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[62]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[61]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[60]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[59]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[58]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[57]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[56]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[55]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[54]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[53]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[52]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[51]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[50]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[49]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[48]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[47]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[46]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[45]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[44]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[43]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[42]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[41]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[40]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[39]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[38]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[37]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[36]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[35]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[34]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[33]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[32]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[31]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[30]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[29]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[28]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[27]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[26]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[25]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[24]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[23]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[22]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[21]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[20]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[19]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[18]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[17]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[16]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[15]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[14]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[13]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[12]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[11]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[10]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[9]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[8]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[7]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[6]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[5]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[4]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[3]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[2]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[1]} {-height 15 -radix hexadecimal} {/cpustim/dut/registerFile/ReadData1[0]} {-height 15 -radix hexadecimal}} /cpustim/dut/registerFile/ReadData1
add wave -noupdate -label dataMemory_read_data -radix hexadecimal -childformat {{{/cpustim/dut/dataMemory/read_data[63]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[62]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[61]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[60]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[59]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[58]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[57]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[56]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[55]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[54]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[53]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[52]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[51]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[50]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[49]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[48]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[47]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[46]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[45]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[44]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[43]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[42]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[41]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[40]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[39]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[38]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[37]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[36]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[35]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[34]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[33]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[32]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[31]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[30]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[29]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[28]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[27]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[26]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[25]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[24]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[23]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[22]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[21]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[20]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[19]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[18]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[17]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[16]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[15]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[14]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[13]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[12]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[11]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[10]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[9]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[8]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[7]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[6]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[5]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[4]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[3]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[2]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[1]} -radix hexadecimal} {{/cpustim/dut/dataMemory/read_data[0]} -radix hexadecimal}} -subitemconfig {{/cpustim/dut/dataMemory/read_data[63]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[62]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[61]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[60]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[59]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[58]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[57]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[56]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[55]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[54]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[53]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[52]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[51]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[50]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[49]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[48]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[47]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[46]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[45]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[44]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[43]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[42]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[41]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[40]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[39]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[38]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[37]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[36]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[35]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[34]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[33]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[32]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[31]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[30]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[29]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[28]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[27]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[26]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[25]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[24]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[23]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[22]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[21]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[20]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[19]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[18]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[17]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[16]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[15]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[14]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[13]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[12]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[11]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[10]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[9]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[8]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[7]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[6]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[5]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[4]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[3]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[2]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[1]} {-radix hexadecimal} {/cpustim/dut/dataMemory/read_data[0]} {-radix hexadecimal}} /cpustim/dut/dataMemory/read_data
add wave -noupdate /cpustim/dut/theBrain/zero
add wave -noupdate /cpustim/dut/theBrain/negative
add wave -noupdate /cpustim/dut/theBrain/carryout
add wave -noupdate /cpustim/dut/theBrain/overflow
add wave -noupdate /cpustim/dut/theBrain/Reg2Loc
add wave -noupdate -label ReadRegister1 /cpustim/dut/registerFile/ReadRegister1
add wave -noupdate -label ReadRegister2 /cpustim/dut/registerFile/ReadRegister2
add wave -noupdate -label WriteData -radix hexadecimal /cpustim/dut/registerFile/WriteData
add wave -noupdate -label WriteRegister /cpustim/dut/registerFile/WriteRegister
add wave -noupdate -label ALU_result -radix hexadecimal /cpustim/dut/mainALU/result
add wave -noupdate -label ALU_A -radix hexadecimal /cpustim/dut/mainALU/A
add wave -noupdate -label ALU_B -radix hexadecimal /cpustim/dut/mainALU/B
add wave -noupdate -label ALUSrcMUX_inOne -radix hexadecimal /cpustim/dut/alusrcMUX/inOne
add wave -noupdate -label ALUSrcMux_InZero -radix hexadecimal /cpustim/dut/alusrcMUX/inZero
add wave -noupdate -label ALUSrcMUX_out -radix hexadecimal /cpustim/dut/alusrcMUX/out
add wave -noupdate -label movzShifter1_value -radix hexadecimal /cpustim/dut/movzShifter1/value
add wave -noupdate -label movzShifter1_result -radix hexadecimal /cpustim/dut/movzShifter1/result
add wave -noupdate -label immOrAddrMux_inOne -radix hexadecimal /cpustim/dut/immOrAddrMux/inOne
add wave -noupdate -label immOrAddrMux_inZero -radix hexadecimal /cpustim/dut/immOrAddrMux/inZero
add wave -noupdate -label immOrAddrMux_out -radix hexadecimal /cpustim/dut/immOrAddrMux/out
add wave -noupdate -label movInstMux_inOne -radix hexadecimal /cpustim/dut/movInstMux/inOne
add wave -noupdate -label movInstMux_inZero -radix hexadecimal /cpustim/dut/movInstMux/inZero
add wave -noupdate -label movInstMux_out -radix hexadecimal /cpustim/dut/movInstMux/out
add wave -noupdate -label movInstMux_sel /cpustim/dut/movInstMux/sel
add wave -noupdate -label ALUOp /cpustim/dut/theBrain/ALUOp
add wave -noupdate -label BrTaken /cpustim/dut/theBrain/BrTaken
add wave -noupdate -label UncondBr /cpustim/dut/theBrain/UncondBr
add wave -noupdate -label ALUSrc /cpustim/dut/theBrain/ALUSrc
add wave -noupdate -radix hexadecimal /cpustim/dut/brShifter/result
add wave -noupdate -radix hexadecimal /cpustim/dut/brShifter/value
add wave -noupdate -radix hexadecimal /cpustim/dut/branchCounter/A
add wave -noupdate -radix hexadecimal /cpustim/dut/branchCounter/B
add wave -noupdate -radix hexadecimal /cpustim/dut/branchCounter/result
add wave -noupdate -radix hexadecimal /cpustim/dut/brSelect/inOne
add wave -noupdate -radix hexadecimal /cpustim/dut/brSelect/inZero
add wave -noupdate -radix hexadecimal /cpustim/dut/brSelect/out
add wave -noupdate -radix hexadecimal /cpustim/dut/pcSelect/inOne
add wave -noupdate -radix hexadecimal /cpustim/dut/pcSelect/inZero
add wave -noupdate -radix hexadecimal /cpustim/dut/pcSelect/sel
add wave -noupdate -radix hexadecimal /cpustim/dut/pcSelect/out
add wave -noupdate /cpustim/dut/registerFile/ffout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {675000000350 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 238
configure wave -valuecolwidth 124
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
WaveRestoreZoom {0 ps} {1758750 us}