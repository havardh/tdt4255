##############################################################################
## Filename:          C:\Users\runarbol\Desktop\tdt4255-new\system\system/drivers/mips_kult_v1_00_a/data/mips_kult_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Tue Oct 01 13:14:04 2013 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "mips_kult" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
