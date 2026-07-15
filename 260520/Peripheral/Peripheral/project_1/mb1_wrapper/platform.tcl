# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\user\Desktop\SoC\Peripheral\project_1\mb1_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\user\Desktop\SoC\Peripheral\project_1\mb1_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {mb1_wrapper}\
-hw {C:\Users\user\Desktop\SoC\Peripheral\project_1\mb1_wrapper.xsa}\
-out {C:/Users/user/Desktop/SoC/Peripheral/project_1}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {mb1_wrapper}
platform generate -quick
platform generate
platform config -updatehw {C:/Users/user/Desktop/SoC/Peripheral/project_1/mb1_wrapper.xsa}
platform config -updatehw {C:/Users/user/Desktop/SoC/Peripheral/project_1/mb1_wrapper.xsa}
platform generate -domains 
