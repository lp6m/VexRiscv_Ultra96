
proc create_ipi_design { offsetfile design_name } {

	create_bd_design $design_name
	open_bd_design $design_name

	# Create and configure Clock/Reset
	create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz sys_clk_0
	create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset sys_reset_0

	#Constraints will be provided manually while pin planning.
		create_bd_port -dir I -type rst reset_rtl
		set_property CONFIG.POLARITY [get_property CONFIG.POLARITY [get_bd_pins sys_clk_0/reset]] [get_bd_ports reset_rtl]
		connect_bd_net [get_bd_pins sys_reset_0/ext_reset_in] [get_bd_ports reset_rtl]
		connect_bd_net [get_bd_ports reset_rtl] [get_bd_pins sys_clk_0/reset]
		set external_reset_port reset_rtl
		create_bd_port -dir I -type clk clock_rtl
		connect_bd_net [get_bd_pins sys_clk_0/clk_in1] [get_bd_ports clock_rtl]
		set external_clock_port clock_rtl
	
	#Avoid IPI DRC, make clock port synchronous to reset
	if { $external_clock_port ne "" && $external_reset_port ne "" } {
		set_property CONFIG.ASSOCIATED_RESET $external_reset_port [get_bd_ports $external_clock_port]
	}

	# Connect other sys_reset pins
	connect_bd_net [get_bd_pins sys_reset_0/slowest_sync_clk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins sys_clk_0/locked] [get_bd_pins sys_reset_0/dcm_locked]

	# Create instance: MyRiscv_0, and set properties
	set MyRiscv_0 [ create_bd_cell -type ip -vlnv user.org:user:MyRiscv:1.0 MyRiscv_0 ]

	# Create instance: jtag_axi_0, and set properties
	set jtag_axi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:jtag_axi jtag_axi_0 ]
	set_property -dict [list CONFIG.PROTOCOL {0}] [get_bd_cells jtag_axi_0]
	connect_bd_net [get_bd_pins jtag_axi_0/aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins jtag_axi_0/aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]

	# Create instance: axi_peri_interconnect, and set properties
	set axi_peri_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect axi_peri_interconnect ]
	connect_bd_net [get_bd_pins axi_peri_interconnect/ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/ARESETN] [get_bd_pins sys_reset_0/interconnect_aresetn]
	set_property -dict [ list CONFIG.NUM_SI {1}  ] $axi_peri_interconnect
	connect_bd_net [get_bd_pins axi_peri_interconnect/S00_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/S00_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_intf_net [get_bd_intf_pins jtag_axi_0/M_AXI] [get_bd_intf_pins axi_peri_interconnect/S00_AXI]

	set_property -dict [ list CONFIG.NUM_MI {3} ] $axi_peri_interconnect
	connect_bd_net [get_bd_pins axi_peri_interconnect/M00_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M00_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M01_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M01_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M02_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M02_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]

	# Create instance: axi_mem_interconnect, and set properties
	set axi_mem_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect axi_mem_interconnect ]
	connect_bd_net [get_bd_pins axi_mem_interconnect/ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_mem_interconnect/ARESETN] [get_bd_pins sys_reset_0/interconnect_aresetn]
	set_property -dict [ list CONFIG.NUM_MI {1} ] $axi_mem_interconnect
	connect_bd_net [get_bd_pins axi_mem_interconnect/M00_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_mem_interconnect/M00_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]

	set_property -dict [ list CONFIG.NUM_SI {3} ] $axi_mem_interconnect
	connect_bd_net [get_bd_pins axi_mem_interconnect/S00_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_mem_interconnect/S00_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins axi_mem_interconnect/S01_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_mem_interconnect/S01_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins axi_mem_interconnect/S02_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_mem_interconnect/S02_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/S02_AXI] [get_bd_intf_pins axi_peri_interconnect/M00_AXI]

	# Create instance: axi_bram_ctrl_0, and set properties
	set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl axi_bram_ctrl_0 ]
	connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/M00_AXI] [get_bd_intf_pins axi_bram_ctrl_0/S_AXI]
	connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]

	# Create instance: axi_bram_0, and set properties
	set axi_bram_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen axi_bram_0 ]
	set_property -dict [ list CONFIG.Memory_Type {True_Dual_Port_RAM}  ] $axi_bram_0
	connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins axi_bram_0/BRAM_PORTA]
	connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTB] [get_bd_intf_pins axi_bram_0/BRAM_PORTB]

	# Create instance: axi_gpio_out, and set properties
	set axi_gpio_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio axi_gpio_out ]
	set_property -dict [ list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_GPIO_WIDTH {2}  ] $axi_gpio_out
	connect_bd_net [get_bd_pins axi_gpio_out/s_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_gpio_out/s_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_intf_net [get_bd_intf_pins axi_gpio_out/S_AXI] [get_bd_intf_pins axi_peri_interconnect/M01_AXI]

	# Create instance: axi_gpio_in, and set properties
	set axi_gpio_in [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio axi_gpio_in ]
	set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_GPIO_WIDTH {4}  ] $axi_gpio_in
	connect_bd_net [get_bd_pins axi_gpio_in/s_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_gpio_in/s_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_intf_net [get_bd_intf_pins axi_gpio_in/S_AXI] [get_bd_intf_pins axi_peri_interconnect/M02_AXI]

	# Create instance: xlconcat_0, and set properties
	set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat xlconcat_0 ]
	set_property -dict [ list CONFIG.NUM_PORTS {4}  ] $xlconcat_0
	connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins axi_gpio_in/gpio_io_i]

	# Create slice hier block : slice_block, and set properties
	set oldCurInst [current_bd_instance .]
	set slice_block [create_bd_cell -type hier slice_block ]
	current_bd_instance $slice_block
	create_bd_pin -dir I -from 1 -to 0 Din 
	create_bd_pin -dir O -from 0 -to 0 Dout0
	set bit_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice bit_0 ]
	set_property -dict [ list CONFIG.DIN_TO {0} CONFIG.DIN_WIDTH {2}  ] $bit_0
	connect_bd_net [get_bd_pins Dout0 ] [get_bd_pins bit_0/Dout]
	connect_bd_net [get_bd_pins Din] [get_bd_pins bit_0/Din]
	create_bd_pin -dir O -from 0 -to 0 Dout1
	set bit_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice bit_1 ]
	set_property -dict [ list CONFIG.DIN_TO {1} CONFIG.DIN_WIDTH {2}  ] $bit_1
	connect_bd_net [get_bd_pins Dout1 ] [get_bd_pins bit_1/Dout]
	connect_bd_net [get_bd_pins Din] [get_bd_pins bit_1/Din]
	current_bd_instance $oldCurInst
	connect_bd_net [get_bd_pins axi_gpio_out/gpio_io_o] [get_bd_pins slice_block/Din]

	# Connect all clock, reset & status pins of MyRiscv_0 master interfaces..
	connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/S00_AXI] [get_bd_intf_pins MyRiscv_0/M00_AXI]
	connect_bd_net [get_bd_pins MyRiscv_0/m00_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins MyRiscv_0/m00_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins MyRiscv_0/m00_axi_txn_done] [get_bd_pins xlconcat_0/In0]
	connect_bd_net [get_bd_pins MyRiscv_0/m00_axi_error] [get_bd_pins xlconcat_0/In1]
	connect_bd_net [get_bd_pins MyRiscv_0/m00_axi_init_axi_txn] [ get_bd_pins slice_block/Dout0 ]
	connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/S01_AXI] [get_bd_intf_pins MyRiscv_0/M01_AXI]
	connect_bd_net [get_bd_pins MyRiscv_0/m01_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins MyRiscv_0/m01_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins MyRiscv_0/m01_axi_txn_done] [get_bd_pins xlconcat_0/In2]
	connect_bd_net [get_bd_pins MyRiscv_0/m01_axi_error] [get_bd_pins xlconcat_0/In3]
	connect_bd_net [get_bd_pins MyRiscv_0/m01_axi_init_axi_txn] [ get_bd_pins slice_block/Dout1 ]


	# Auto assign address
	assign_bd_address

	# Configure address param & range of MyRiscv_0 master interfaces..
	set_property range 16K [get_bd_addr_segs {jtag_axi_0/Data/SEG_axi_bram_ctrl_0_Mem0}]
	set_property range 16K [get_bd_addr_segs {MyRiscv_0/M00_AXI/SEG_axi_bram_ctrl_0_Mem0}]
	set_property range 16K [get_bd_addr_segs {MyRiscv_0/M01_AXI/SEG_axi_bram_ctrl_0_Mem0}]
	set_property -dict [list  CONFIG.C_M00_AXI_TARGET_SLAVE_BASE_ADDR {0xC0000000} CONFIG.C_M01_AXI_TARGET_SLAVE_BASE_ADDR {0xC0000100} ] [get_bd_cells MyRiscv_0]

	# Copy all address to MyRiscv_v1_0_include.tcl file
	set bd_path [get_property DIRECTORY [current_project]]/[current_project].srcs/[current_fileset]/bd
	upvar 1 $offsetfile offset_file
	set offset_file "${bd_path}/MyRiscv_v1_0_include.tcl"
	set fp [open $offset_file "w"]
	puts $fp "# Configuration address parameters"

	set offset [get_property OFFSET [get_bd_addr_segs /jtag_axi_0/Data/SEG_axi_gpio_in_Reg ]]
	puts $fp "set axi_gpio_in_addr ${offset}"

	set offset [get_property OFFSET [get_bd_addr_segs /jtag_axi_0/Data/SEG_axi_gpio_out_Reg ]]
	puts $fp "set axi_gpio_out_addr ${offset}"

	close $fp
}

# Set IP Repository and Update IP Catalogue 
set ip_path [file dirname [file normalize [get_property XML_FILE_NAME [ipx::get_cores user.org:user:MyRiscv:1.0]]]]
set hw_test_file ${ip_path}/example_designs/debug_hw_design/MyRiscv_v1_0_hw_test.tcl

set repo_paths [get_property ip_repo_paths [current_fileset]] 
if { [lsearch -exact -nocase $repo_paths $ip_path ] == -1 } {
	set_property ip_repo_paths "$ip_path [get_property ip_repo_paths [current_fileset]]" [current_fileset]
	update_ip_catalog
}

set design_name ""
set all_bd {}
set all_bd_files [get_files *.bd -quiet]
foreach file $all_bd_files {
set file_name [string range $file [expr {[string last "/" $file] + 1}] end]
set bd_name [string range $file_name 0 [expr {[string last "." $file_name] -1}]]
lappend all_bd $bd_name
}

for { set i 1 } { 1 } { incr i } {
	set design_name "MyRiscv_v1_0_hw_${i}"
	if { [lsearch -exact -nocase $all_bd $design_name ] == -1 } {
		break
	}
}

set intf_address_include_file ""
create_ipi_design intf_address_include_file ${design_name}
save_bd_design
validate_bd_design

set wrapper_file [make_wrapper -files [get_files ${design_name}.bd] -top -force]
import_files -force -norecurse $wrapper_file

puts "-------------------------------------------------------------------------------------------------"
puts "INFO NEXT STEPS : Until this stage, debug hardware design has been created, "
puts "   please perform following steps to test design in targeted board."
puts "1. Generate bitstream"
puts "2. Setup your targeted board, open hardware manager and open new(or existing) hardware target"
puts "3. Download generated bitstream"
puts "4. Run generated hardware test using below command, this invokes basic read/write operation"
puts "   to every interface present in the peripheral : xilinx.com:user:myip:1.0"
puts "   : source -notrace ${hw_test_file}"
puts "-------------------------------------------------------------------------------------------------"

