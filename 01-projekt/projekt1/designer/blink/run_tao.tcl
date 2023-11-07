set_device -family {SmartFusion2} -die {M2S005} -speed {STD}
read_vhdl -mode vhdl_2008 {C:\00digitalesysteme\01-projekt\Beispiel\Beispiel5.vhd}
set_top_level {blink}
map_netlist
check_constraints {C:\00digitalesysteme\01-projekt\projekt1\constraint\synthesis_sdc_errors.log}
write_fdc {C:\00digitalesysteme\01-projekt\projekt1\designer\blink\synthesis.fdc}
