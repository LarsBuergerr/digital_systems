open_project -project {Z:\digital_systems\aufgabe2_all\aufgabe2\designer\aufgabe2\aufgabe2_fp\aufgabe2.pro}
enable_device -name {M2S005} -enable 1
set_programming_file -name {M2S005} -file {Z:\digital_systems\aufgabe2_all\aufgabe2\designer\aufgabe2\aufgabe2.ppd}
set_programming_action -action {PROGRAM} -name {M2S005} 
run_selected_actions
save_project
close_project
