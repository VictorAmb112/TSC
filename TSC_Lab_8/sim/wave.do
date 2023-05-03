onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /top/i_tb_ifc/clk
add wave -noupdate -radix decimal /top/i_tb_ifc/test_clk
add wave -noupdate -radix decimal /top/i_tb_ifc/reset_n
add wave -noupdate -radix decimal /top/i_tb_ifc/load_en
add wave -noupdate -radix decimal /top/i_tb_ifc/operand_a
add wave -noupdate -radix decimal /top/i_tb_ifc/operand_b
add wave -noupdate -radix decimal /top/i_tb_ifc/opcode
add wave -noupdate -radix decimal /top/i_tb_ifc/write_pointer
add wave -noupdate -radix decimal /top/i_tb_ifc/read_pointer
add wave -noupdate -radix decimal /top/i_tb_ifc/instruction_word
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 211
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
WaveRestoreZoom {0 ps} {268796 ps}
