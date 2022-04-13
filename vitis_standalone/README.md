# Run RISC-V on standalone mode

Open `vivado/riscv_base_prj/riscv_base_prj.xpr` in Vivado, and export hardware file in `XSA(Xilinx Support Archive)` format.  
You can export xsa file by the following tcl command:  
```sh
cd <VivadoProjectDir>
write_hw_platform -include_bit riscv_base_prj.xsa
validate_hw_platform ./riscv_base_prj.xsa
```

Launch Vitis IDE from `Tools->Launch Vitis IDE`.  
Set workspace as you like. Here we set `<Repository directory>/vivado/riscv_base_prj/vitis`.  
## Create new project
In Vitis IDE, select `File->New Application Project`  
In new application wizard, from `Create a new platfrom from hardware` tab, select exported `riscv_base_prj.xsa` in vivado.  
Set `test` to application name.  
Select `standalone` in Operating System (default).  
Select `Hello World` in template selection.  

## Change STDIN/OUT setting
This setting is required to show the result of stdout on the UART serial console.  
From options in `Application Project Settings` tab, press `Navigate to BSP Setting.` button, so new tab is opened.  
Select `riscv_base_prj->psu_cortexa53_0->zynqmp_fsbl->Board Support Package`. and press `Modify BSP Setting` button, so new window is opened.  

<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vitis_standalone/image/change_bsp_setting_menu1.png?raw=true" width=70%>  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vitis_standalone/image/change_bsp_setting_menu2.png?raw=true" width=70%>

Select `Overview->standalone` from left menu, and modify `stdin` and `stdout` value from `psu_uart0` to `psu_uart1`, and close the window.  

<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vitis_standalone/image/change_bsp_setting.png?raw=true" width=50%>

Apply the same modification from `riscv_base_prj->psu_cortexa53_0->standalone_psu_cortexa53_0->Board Support Package`.  

## Run Hello World on Ultra96-V2
Connect Ultra96-V2 to PC via [USB-to-JTAG/UART Pod](https://www.avnet.com/shop/japan/products/avnet-engineering-services/aes-acc-u96-jtag-3074457345636446168/).  
Change the DIP switch on the board to JTAG BOOT mode, and turn on the board power.  
Launch serial console application on your host PC (I use `gtkterm`), and select USB com port and set bandrate to 115200.  
  
From `Assistant` window at left bottom, right click `test_system -> test -> Release` and select `Run -> Launch on Hardware`.  
Bitstream is automatically written to the board and Hello world is displayed on the serial console.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vitis_standalone/image/helloworld.png?raw=true" width=70%>

## Run RISC-V test
Overwrite `helloworld.c` to the content of this repository, and run.  
In test code, write RISC-V instruction at first. For every test case, run RISC-V core by resetting `pl_resetn1` after writing input data.  

<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vitis_standalone/image/riscv_standalone.png?raw=true" width=70%>