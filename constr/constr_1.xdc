#set_property PACKAGE_PIN H12 [get_ports {o_SPI_Clk}]
#set_property PACKAGE_PIN B10 [get_ports {o_SPI_MOSI}]
#set_property PACKAGE_PIN E10 [get_ports {i_SPI_MISO}]
#set_property PACKAGE_PIN E12 [get_ports {o_SPI_Cs}]
##set_property PACKAGE_PIN D10 [get_ports {som240_1_connector_bank45_gpio_tri_o[4]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {o_SPI_Cs}]     #4
#set_property IOSTANDARD LVCMOS33 [get_ports {i_SPI_MISO}]   #3
#set_property IOSTANDARD LVCMOS33 [get_ports {o_SPI_MOSI}]   #2
#set_property IOSTANDARD LVCMOS33 [get_ports {o_SPI_Clk}]    #1

#set_property PACKAGE_PIN C11 [get_ports TOGGLE_OUT]
#set_property IOSTANDARD LVCMOS33 [get_ports TOGGLE_OUT]



#set_property IOSTANDARD LVCMOS33 [get_ports o_SPI_Clk]
#set_property PACKAGE_PIN H12 [get_ports o_SPI_Clk]
#set_property PACKAGE_PIN E10 [get_ports i_SPI_MISO]
#set_property PACKAGE_PIN E12 [get_ports o_SPI_CS_n]
#set_property PACKAGE_PIN B10 [get_ports o_SPI_MOSI]
#set_property IOSTANDARD LVCMOS33 [get_ports i_SPI_MISO]
#set_property IOSTANDARD LVCMOS33 [get_ports o_SPI_CS_n]
#set_property IOSTANDARD LVCMOS33 [get_ports o_SPI_MOSI]

#set_property OFFCHIP_TERM NONE [get_ports TOGGLE_OUT]
#set_property OFFCHIP_TERM NONE [get_ports o_SPI_CS_n]
#set_property OFFCHIP_TERM NONE [get_ports o_SPI_Clk]
#set_property OFFCHIP_TERM NONE [get_ports o_SPI_MOSI]
#set_property OFFCHIP_TERM NONE [get_ports testpin]
#set_property IOSTANDARD LVCMOS33 [get_ports testpin]
#set_property PACKAGE_PIN D10 [get_ports testpin]

#set_property IOSTANDARD LVCMOS33 [get_ports testpin2]
#set_property PACKAGE_PIN D11 [get_ports testpin2]

#set_property IOSTANDARD LVCMOS33 [get_ports testpin3]
#set_property PACKAGE_PIN C11 [get_ports testpin3]


set_property IOSTANDARD LVCMOS33 [get_ports {PMOD1[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD2[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD3[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD4[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports PMOD5]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD6[0]}]

set_property PACKAGE_PIN H12 [get_ports {PMOD1[0]}]
set_property PACKAGE_PIN B10 [get_ports {PMOD2[0]}]
set_property PACKAGE_PIN E10 [get_ports {PMOD3[0]}]
set_property PACKAGE_PIN E12 [get_ports {PMOD4[0]}]
set_property PACKAGE_PIN D11 [get_ports {PMOD6[0]}]
set_property PACKAGE_PIN D10 [get_ports PMOD5]








set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports {CS_p[0]}]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports {scl_p[0]}]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports MISO_p]
set_property PACKAGE_PIN D7 [get_ports {CS_p[0]}]
set_property PACKAGE_PIN E5 [get_ports {scl_p[0]}]
set_property SLEW FAST [get_ports {CS_p[0]}]
set_property SLEW FAST [get_ports {scl_p[0]}]
set_property SLEW FAST [get_ports {scl_n[0]}]
set_property SLEW FAST [get_ports {PMOD1[0]}]
#set_property OUTPUT_IMPEDANCE RDRV_48_48 [get_ports {CS_p[0]}]
#set_property OUTPUT_IMPEDANCE RDRV_48_48 [get_ports {scl_p[0]}]
set_property ODT RTT_NONE [get_ports MISO_p]
set_property PACKAGE_PIN G6 [get_ports MISO_p]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
