# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\nucle\Desktop\AIoT\SoC\260611\AXI_servo_motor\project_3\servo_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\nucle\Desktop\AIoT\SoC\260611\AXI_servo_motor\project_3\servo_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {servo_wrapper}\
-hw {C:\Users\nucle\Desktop\AIoT\SoC\260611\AXI_servo_motor\project_3\servo_wrapper.xsa}\
-out {C:/Users/nucle/Desktop/AIoT/SoC/260611/AXI_servo_motor/project_3}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {servo_wrapper}
platform generate -quick
platform generate
platform active {servo_wrapper}
platform config -updatehw {C:/Users/nucle/Desktop/AIoT/SoC/260611/AXI_servo_motor/project_3/servo_wrapper.xsa}
platform generate -domains 
platform generate
platform generate
platform clean
platform active {servo_wrapper}
platform config -updatehw {C:/Users/nucle/Desktop/AIoT/SoC/260611/AXI_servo_motor/project_1/servo_wrapper.xsa}
platform config -updatehw {C:/Users/nucle/Desktop/AIoT/SoC/260611/AXI_servo_motor/project_1/servo_wrapper.xsa}
platform generate
platform active {servo_wrapper}
platform config -updatehw {C:/Users/nucle/Desktop/AIoT/SoC/260611/AXI_servo_motor/project_3/servo_wrapper.xsa}
