set_device -family {SmartFusion2} -die {M2S005} -speed {STD}
read_vhdl -mode vhdl_2008 {Z:\digital_systems\aufgabe1_all\vhdl\lfsr_lib.vhd}
read_vhdl -mode vhdl_2008 {Z:\digital_systems\aufgabe1_all\vhdl\hex4x7seg.vhd}
read_vhdl -mode vhdl_2008 {Z:\digital_systems\aufgabe1_all\vhdl\aufgabe1.vhd}
set_top_level {aufgabe1}
map_netlist
check_constraints {Z:\digital_systems\aufgabe1_all\aufgabe1\constraint\synthesis_sdc_errors.log}
write_fdc {Z:\digital_systems\aufgabe1_all\aufgabe1\designer\aufgabe1\synthesis.fdc}
