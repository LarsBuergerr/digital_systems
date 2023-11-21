set_device -family {SmartFusion2} -die {M2S005} -speed {STD}
read_vhdl -mode vhdl_2008 {Z:\digitalesysteme\digitalesysteme_bence\aufgabe1\hdl\hex4x7seg.vhd}
read_vhdl -mode vhdl_2008 {Z:\digitalesysteme\digitalesysteme_bence\aufgabe1\hdl\aufgabe1.vhd}
set_top_level {aufgabe1}
map_netlist
check_constraints {Z:\digitalesysteme\digitalesysteme_bence\aufgabe1\constraint\synthesis_sdc_errors.log}
write_fdc {Z:\digitalesysteme\digitalesysteme_bence\aufgabe1\designer\aufgabe1\synthesis.fdc}
