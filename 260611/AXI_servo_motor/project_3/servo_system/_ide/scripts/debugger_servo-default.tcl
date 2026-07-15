# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\nucle\Desktop\AIoT\SoC\260611\AXI_servo_motor\project_3\servo_system\_ide\scripts\debugger_servo-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\nucle\Desktop\AIoT\SoC\260611\AXI_servo_motor\project_3\servo_system\_ide\scripts\debugger_servo-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Basys3 210183BB7A37A" && level==0 && jtag_device_ctx=="jsn-Basys3-210183BB7A37A-0362d093-0"}
fpga -file C:/Users/nucle/Desktop/AIoT/SoC/260611/AXI_servo_motor/project_3/servo/_ide/bitstream/servo_wrapper.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw C:/Users/nucle/Desktop/AIoT/SoC/260611/AXI_servo_motor/project_3/servo_wrapper/export/servo_wrapper/hw/servo_wrapper.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/Users/nucle/Desktop/AIoT/SoC/260611/AXI_servo_motor/project_3/servo/Debug/servo.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
