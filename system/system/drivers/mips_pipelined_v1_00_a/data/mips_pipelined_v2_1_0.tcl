##############################################################################
## Filename:          C:\Users\runarbol\Documents\tdt4255-fresh\system\system/drivers/mips_pipelined_v1_00_a/data/mips_pipelined_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Wed Oct 23 09:41:06 2013 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "mips_pipelined" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
