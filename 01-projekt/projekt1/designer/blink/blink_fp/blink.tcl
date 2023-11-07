open_project -project {C:\00digitalesysteme\01-projekt\projekt1\designer\blink\blink_fp\blink.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S005} \
    -fpga {C:\00digitalesysteme\01-projekt\projekt1\designer\blink\blink.map} \
    -header {C:\00digitalesysteme\01-projekt\projekt1\designer\blink\blink.hdr} \
    -spm {C:\00digitalesysteme\01-projekt\projekt1\designer\blink\blink.spm} \
    -dca {C:\00digitalesysteme\01-projekt\projekt1\designer\blink\blink.dca}
export_single_ppd \
    -name {M2S005} \
    -file {C:\00digitalesysteme\01-projekt\projekt1\designer\blink\blink.ppd}

save_project
close_project
