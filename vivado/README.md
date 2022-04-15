# Create Vivado Project from scratch

## Create Vivado Project
Select `File->Project->New` and create project named `riscv_base_prj`.    
Select `Ultra96-V2 Sigle Board Computer` in `Default Part`.  
After project is created, select `Flow Navigator->IP Integrator->Create Block Design`, and create block design named `design_1`.  

## Edit Block Design
Open new block design, and put `Zynq MPSoC` block from `Add IP`, and run `Run Block Automation`.

### Clock and reset placement to use design as a Vitis Platform
Place `Clock Wizard`, set clock frequency as the following image.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//clock_wizard.png?raw=true" width=70%/>  
  
Place 5 `Processing Reset`, and connect clock and reset as the following image.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//platform_bd.png?raw=true" width=80%/>  

Double click `Zynq MPSoC` block, and modify the configuration:
- `PS-PL Configuration -> PS-PL Interfaces -> Master Interface`
  enable only `AXI HPM0 FPD`.
- `PS-PL Configuration -> Fabric Reset Enable -> Number of Fabric Resets`
  change value to 2.
- `Clock Configuration -> Output Clocks -> Low Power Domain Clocks -> PL Fabric Clocks`
  enable PL1, modify `Source` to `IOPLL`, modify `Divisor 0` to 10.  
  PL1 clock is now set to 150Hz.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//zynq_ps_pl_conf.png?raw=true" width=40%/>
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//pl_clock.png?raw=true" width=60%/>

Open `Project Manager -> Settings` from flow navigator at the left of the screen, and mark `Project is an extensible Vitis platform` as checked.
Then, configure platform setting from the `Platform Setup` tab.
Set `AXI Port` and `Clock` as the following image. (Note that if clock id=0 does not exist, an error will occur in Vitis.)  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//platform_axi.png?raw=true" width=50%/>
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//platform_clock.png?raw=true" width=50%/>

### RISC-V pripherals placement
Place `AXI BRAM Controller`, double click it, modify `BRAM Options->Number of BRAM Interfaces` to 1.
Copy and paste and create another `AXI BRAM Controller`.  
  
Place two `Block Memory Generator`.  
Place `AXI Smart Connect`, double click it, modify `Number of Slave Interfaces` to 3, and `Number of Master Interfaces` to 2.

Connect their interface as the following image.  

<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//riscv_pripheral_bd.png?raw=true" width=80%/>


### RISC-V IP placement

Select `Tools -> Create and Package New IP` from Vivado menu.  
In wizard,  
- select `Create a new AXI4 peripheral`.
- modify Name to `MyRiscv`.
- create two AXI interfaces: Interface Type:Full, Mode:Master
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//riscv_axi_if.png?raw=true" width=60%/>

- select `Edit IP` in `Next Steps` and press Finish button.
And then, new Vivado project is opened.

Remove the unnecessary files: from `Sources -> Design Sources`, right click `MyRiscv_v1_0_M00_AXI.v, MyRiscv_v1_0_M01_AXI.v` and select `remove file from project`.  
Add RISC-V core verilog file: right click `Design Sources` and select `Add sources -> VexRiscvSignate.v`.
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//riscv_ip_source.png?raw=true" width=50%/>

Replace `MyRiscv_v1_0.v` with the file in this repository.  
`MyRiscv_v1_0.v` is a simple bridge script describing the connection between `VexRiscvSignate.v` and the AXI interface of IP.  
  
Process `Packaging Steps` from `Package IP` tab.  
(Here ignore the following warning in `Ports and Interfaces`)

> [IP_Flow 19-5661] Bus Interface 'riscv_clk' does not have any bus interfaces associated with it.

Basically, you can press OK on each item to proceed with the process.  
Press `Re-Package IP` button at the bottom of the window, and finish packaging IP, close vivado project and back to the main project.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//riscv_package_ip.png?raw=true" width=60%/>


In the main project, place `MyRiscv` IP packaged in the previous setp.  
Place `Constant` block and double click it, modify `Constant Val` to 0.  

Connect their interface as the following image.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//riscv_bd.png?raw=true" width=80%/>


Rename `axi_bram_ctrl_0` to `IMEM_CONTROL`, `axi_bram_ctrl_1` to `DMEM_CONTROL`: click the block and rename from `Block Property` window at the left bottom of the screen.  

The creation of the block design is now complete.

## Address configuration
Move to the `Address Editor` tab.  
**Note that the address set here will affect the program to be executed on RISC-V**  
Select all, and right click and select `Assign`.  
Perhaps auto assign result will not look like the following image, so set it up manually.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//address_editor.png?raw=true" width=80%/>
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//address_map.png?raw=true" width=50%/>

If you want to change the size of the BRAM of RISC-V, change the `Range` value from the address editor.  

## Implementation
Right click `Sources -> design_1.bd` and select `Create HDL Wrapper`.  
From `Diagram` tab, run `Validate Design`, the following warning shows, but here can be ignored...

```
CRITICAL WARNING: [xilinx.com:ip:smartconnect:1.0-1] design_1_smartconnect_0_0: RUSER_WIDTH (1) of S01_AXI must be integer number of bits per byte of RDATA (32).
CRITICAL WARNING: [xilinx.com:ip:smartconnect:1.0-1] design_1_smartconnect_0_0: WUSER_WIDTH (1) of S01_AXI must be integer number of bits per byte of WDATA (32).
CRITICAL WARNING: [xilinx.com:ip:smartconnect:1.0-1] design_1_smartconnect_0_0: RUSER_WIDTH (1) of S02_AXI must be integer number of bits per byte of RDATA (32).
CRITICAL WARNING: [xilinx.com:ip:smartconnect:1.0-1] design_1_smartconnect_0_0: WUSER_WIDTH (1) of S02_AXI must be integer number of bits per byte of WDATA (32).
```

Run `Generate Bitstream` from flow navigator, synthesis, implementation is executed and bitstream is generated.  

## Export as Vitis platform
If you want this block design as vitis platform, you need to export vivado project in XSA format.  
From tcl console at the bottom of the screen, run the following tcl code.  

```sh
set_property platform.design_intent.embedded true [current_project]
set_property platform.design_intent.server_managed false [current_project]
set_property platform.design_intent.external_host false [current_project]
set_property platform.design_intent.datacenter false [current_project]
set_property platform.default_output_type "sd_card" [current_project]
cd <VivadoProjectDir>
write_hw_platform -include_bit riscv_base_prj.xsa
validate_hw_platform ./riscv_base_prj.xsa
```