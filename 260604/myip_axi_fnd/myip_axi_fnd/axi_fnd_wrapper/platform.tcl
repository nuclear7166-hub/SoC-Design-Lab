# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\nucle\Desktop\AIoT\SoC\260604\myip_axi_fnd\myip_axi_fnd\axi_fnd_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\nucle\Desktop\AIoT\SoC\260604\myip_axi_fnd\myip_axi_fnd\axi_fnd_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {axi_fnd_wrapper}\
-hw {C:\Users\nucle\Desktop\AIoT\SoC\260604\myip_axi_fnd\myip_axi_fnd\axi_fnd_wrapper.xsa}\
-out {C:/Users/nucle/Desktop/AIoT/SoC/260604/myip_axi_fnd/myip_axi_fnd}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {axi_fnd_wrapper}
platform generate -quick
platform generate
platform active {axi_fnd_wrapper}
platform config -updatehw {C:/Users/nucle/Desktop/AIoT/SoC/260604/myip_axi_fnd/myip_axi_fnd/axi_fnd_wrapper.xsa}
platform generate -domains 
