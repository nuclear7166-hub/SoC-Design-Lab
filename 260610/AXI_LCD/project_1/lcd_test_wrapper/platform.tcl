# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\nucle\Desktop\AIoT\SoC\260610\AXI_LCD\project_1\lcd_test_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\nucle\Desktop\AIoT\SoC\260610\AXI_LCD\project_1\lcd_test_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {lcd_test_wrapper}\
-hw {C:\Users\nucle\Desktop\AIoT\SoC\260610\AXI_LCD\project_1\lcd_test_wrapper.xsa}\
-out {C:/Users/nucle/Desktop/AIoT/SoC/260610/AXI_LCD/project_1}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {lcd_test_wrapper}
platform generate -quick
platform generate
