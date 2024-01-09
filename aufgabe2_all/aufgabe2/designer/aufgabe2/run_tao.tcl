set_device -family {SmartFusion2} -die {M2S005} -speed {STD}
read_vhdl -mode vhdl_2008 {Z:\digital_systems\aufgabe2_all\vhdl\std_counter.vhd}
read_vhdl -mode vhdl_2008 {Z:\digital_systems\aufgabe2_all\vhdl\sync_buffer.vhd}
read_vhdl -mode vhdl_2008 {Z:\digital_systems\aufgabe1_all\vhdl\lfsr_lib.vhd}
read_vhdl -mode vhdl_2008 {Z:\digital_systems\aufgabe2_all\vhdl\sync_module.vhd}
read_vhdl -mode vhdl_2008 {Z:\digital_systems\aufgabe2_all\vhdl\hex4x7seg.vhd}
read_vhdl -mode vhdl_2008 {Z:\digital_systems\aufgabe2_all\vhdl\aufgabe2.vhd}
set_top_level {aufgabe2}
map_netlist
check_constraints {Z:\digital_systems\aufgabe2_all\aufgabe2\constraint\synthesis_sdc_errors.log}
write_fdc {Z:\digital_systems\aufgabe2_all\aufgabe2\designer\aufgabe2\synthesis.fdc}
