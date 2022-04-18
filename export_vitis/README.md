# Export as Vitis Platform
This section describes how to export a design with a RISC-V core and a Petalinux environment as a platform that can be used with Vitis.  

# Build petalinux sdk prject
```sh
cd <repository directory>/petalinux/riscv_base_prj
source ~/petalinux_2020.2/settings.sh
source /tools/Xilinx/Vitis/2020.2/settings64.sh
petalinux-build --sdk
cd image/linux
```
Create `image/linux/linux.bif` file with the following contents:
```
/* linux */
 the_ROM_image:
 {
    [pmufw_image] <pmufw.elf>
    [bootloader, destination_cpu=a53-0] <fsbl.elf>
    [destination_device=pl] <bitstream>
    [destination_cpu=a53-0, exception_level=el-3, trustzone] <bl31.elf>
    [destination_cpu=a53-0, exception_level=el-2] <u-boot.elf>
 }
```

```
mkdir -p pkg/pfm/boot
cp bl31.elf pkg/pfm/boot/
cp image.ub pkg/pfm/boot/
cp pmufw.elf pkg/pfm/boot/
cp u-boot.elf pkg/pfm/boot/
cp system.dtb pkg/pfm/boot/
./sdk.sh #specify ./pkg/pfm as SDK install directory
cd pkg/pfm
vitis -workspace wksp1
```

Select `File->New->Create Platform Project`, and create project named `riscv_base_prj`.  

Select XSA file exported in Vivado, and select `linux` as `Software Specification -> Operating System`.  

<image src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/export_vitis/image/linux.png?raw=true" width=70%>

Select `riscv_base_prj->psu_cortexa53->linux on psu_cortexa53`.  
Specify the paths required for packaging the linux system as the image.  
<image src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/export_vitis/image/newprj.png?raw=true" width=70%>

Press the hammer icon to build the platform project.  
Close Vitis IDE.  

Exported platform is located at `images/linux/wksp1/riscv_base_prj/export/riscv_base_prj`.  

<image src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/export_vitis/image/platform.png?raw=true" width=70%>