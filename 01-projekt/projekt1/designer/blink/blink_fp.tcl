new_project \
         -name {blink} \
         -location {C:\00digitalesysteme\01-projekt\projekt1\designer\blink\blink_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S005} \
         -name {M2S005}
enable_device \
         -name {M2S005} \
         -enable {TRUE}
save_project
close_project
