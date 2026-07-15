# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\nucle\Desktop\AIoT\SoC\260527\blaze_W5500\blaze_W5500Top\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\nucle\Desktop\AIoT\SoC\260527\blaze_W5500\blaze_W5500Top\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {blaze_W5500Top}\
-hw {C:\Users\nucle\Desktop\AIoT\SoC\260527\blaze_W5500\project_1\blaze_W5500Top.xsa}\
-out {C:/Users/nucle/Desktop/AIoT/SoC/260527/blaze_W5500}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {blaze_W5500Top}
platform generate -quick
