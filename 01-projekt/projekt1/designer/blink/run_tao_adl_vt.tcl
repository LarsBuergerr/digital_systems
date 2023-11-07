set_device -family {SmartFusion2} -die {M2S005} -speed {STD}
read_adl {C:\00digitalesysteme\01-projekt\projekt1\designer\blink\blink.adl}
read_afl {C:\00digitalesysteme\01-projekt\projekt1\designer\blink\blink.afl}
map_netlist
check_constraints {C:\00digitalesysteme\01-projekt\projekt1\constraint\timing_sdc_errors.log}
write_sdc -mode smarttime {C:\00digitalesysteme\01-projekt\projekt1\designer\blink\timing_analysis.sdc}
