onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /D_FF_x64_testbench/dut/WIDTH
add wave -noupdate /D_FF_x64_testbench/dut/q_o
add wave -noupdate /D_FF_x64_testbench/dut/d_i
add wave -noupdate /D_FF_x64_testbench/dut/clk_i
add wave -noupdate /D_FF_x64_testbench/dut/en_i
add wave -noupdate /D_FF_x64_testbench/dut/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {431 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {7193 ps}
