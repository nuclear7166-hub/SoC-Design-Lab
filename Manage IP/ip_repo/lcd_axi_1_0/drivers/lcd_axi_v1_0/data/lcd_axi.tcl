

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "lcd_axi" "NUM_INSTANCES" "DEVICE_ID"  "C_S00_lcd_AXI_BASEADDR" "C_S00_lcd_AXI_HIGHADDR"
}
