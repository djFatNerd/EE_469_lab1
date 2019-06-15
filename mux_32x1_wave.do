onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group mux_32x1 /mux_32x1_testbench/dut/in_i
add wave -noupdate -expand -group mux_32x1 /mux_32x1_testbench/dut/sel_i
add wave -noupdate -expand -group mux_32x1 /mux_32x1_testbench/dut/out_o
add wave -noupdate -expand -group mux_32x1 /mux_32x1_testbench/dut/temp
add wave -noupdate -group mux_2x1 /mux_32x1_testbench/dut/mux_2x1_1/in_i
add wave -noupdate -group mux_2x1 /mux_32x1_testbench/dut/mux_2x1_1/sel_i
add wave -noupdate -group mux_2x1 /mux_32x1_testbench/dut/mux_2x1_1/out_o
add wave -noupdate -group mux_2x1 /mux_32x1_testbench/dut/mux_2x1_1/temp_1
add wave -noupdate -group mux_2x1 /mux_32x1_testbench/dut/mux_2x1_1/temp_2
add wave -noupdate -group mux_2x1 /mux_32x1_testbench/dut/mux_2x1_1/not_sel
add wave -noupdate -group mux_16x1_top /mux_32x1_testbench/dut/mux_16x1_1/in_i
add wave -noupdate -group mux_16x1_top /mux_32x1_testbench/dut/mux_16x1_1/sel_i
add wave -noupdate -group mux_16x1_top /mux_32x1_testbench/dut/mux_16x1_1/out_o
add wave -noupdate -group mux_16x1_top /mux_32x1_testbench/dut/mux_16x1_1/temp
add wave -noupdate -group mux_16x1_bottom /mux_32x1_testbench/dut/mux_16x1_2/in_i
add wave -noupdate -group mux_16x1_bottom /mux_32x1_testbench/dut/mux_16x1_2/sel_i
add wave -noupdate -group mux_16x1_bottom /mux_32x1_testbench/dut/mux_16x1_2/out_o
add wave -noupdate -group mux_16x1_bottom /mux_32x1_testbench/dut/mux_16x1_2/temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {846 ps} 0}
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
WaveRestoreZoom {0 ps} {1680 ps}
