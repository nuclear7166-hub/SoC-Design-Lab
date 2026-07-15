

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "seongminip" "NUM_INSTANCES" "DEVICE_ID"  "C_S00_pwm_AXI_BASEADDR" "C_S00_pwm_AXI_HIGHADDR"
}
