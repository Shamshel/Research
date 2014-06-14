##############################################################################
## Filename:          C:\Users\ECE\Documents\PR_Project/drivers/reconfigurable_peripherials_v1_00_a/data/reconfigurable_peripherials_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Thu Mar 06 14:40:48 2014 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "reconfigurable_peripherials" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
