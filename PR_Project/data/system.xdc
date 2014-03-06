#
# pin constraints
#
set_property LOC AD11 [ get_ports CLK_N]
set_property IOSTANDARD DIFF_SSTL15 [ get_ports CLK_N]

set_property LOC AD12 [ get_ports CLK_P]
set_property IOSTANDARD DIFF_SSTL15 [ get_ports CLK_P]

set_property LOC K21 [ get_ports IIC_MAIN_SCL]
set_property DRIVE 8 [ get_ports IIC_MAIN_SCL]
set_property IOSTANDARD LVCMOS25 [ get_ports IIC_MAIN_SCL]
set_property SLEW SLOW [ get_ports IIC_MAIN_SCL]

set_property LOC L21 [ get_ports IIC_MAIN_SDA]
set_property DRIVE 8 [ get_ports IIC_MAIN_SDA]
set_property IOSTANDARD LVCMOS25 [ get_ports IIC_MAIN_SDA]
set_property SLEW SLOW [ get_ports IIC_MAIN_SDA]

set_property LOC P24 [ get_ports QSPI_FLASH_IO0]
set_property IOSTANDARD LVCMOS25 [ get_ports QSPI_FLASH_IO0]

set_property LOC R25 [ get_ports QSPI_FLASH_IO1]
set_property IOSTANDARD LVCMOS25 [ get_ports QSPI_FLASH_IO1]

set_property LOC U19 [ get_ports QSPI_FLASH_SS]
set_property IOSTANDARD LVCMOS25 [ get_ports QSPI_FLASH_SS]

set_property LOC AB7 [ get_ports RESET]
set_property IOSTANDARD LVCMOS15 [ get_ports RESET]

set_property LOC M19 [ get_ports RS232_Uart_1_sin]
set_property IOSTANDARD LVCMOS25 [ get_ports RS232_Uart_1_sin]

set_property LOC K24 [ get_ports RS232_Uart_1_sout]
set_property IOSTANDARD LVCMOS25 [ get_ports RS232_Uart_1_sout]

set_property LOC L26 [ get_ports sm_fan_pwm_net_vcc]
set_property IOSTANDARD LVCMOS25 [ get_ports sm_fan_pwm_net_vcc]

#
# additional constraints
#
create_clock -name sys_clk_pin -period "5.0" [get_ports "CLK_P"]
