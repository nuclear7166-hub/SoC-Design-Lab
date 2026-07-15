

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "servo_axi" "NUM_INSTANCES" "DEVICE_ID"  "C_S00_servo_AXI_BASEADDR" "C_S00_servo_AXI_HIGHADDR"
}
