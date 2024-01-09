new_project \
         -name {aufgabe2} \
         -location {Z:\digital_systems\aufgabe2_all\aufgabe2\designer\aufgabe2\aufgabe2_fp} \
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
