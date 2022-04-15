# Build petalinux project and package files for SD card
This project does NOT support wifi on Ultra96-V2 board, only USB-LAN adapter is suported.  

```sh
source <petalinux_2020.2_install_dir>/settings.sh
cd <Repository Directory>/petalinux/riscv_base_prj
cp ../../vivado/riscv_base_prj/riscv_base_prj.xsa ./project-spec/hw-description/system.xsa
petalinux-build
petalinux-package --boot --fsbl ./images/linux/zynqmp_fsbl.elf --fpga ./images/linux/system.bit --uboot --force
```

Format SD card and create two partitions.
- First partition: format: `FAT16`, label: `BOOT` 
- Second partition: format: `ext4`, label: `rootfs`  
  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/petalinux/images/sd.png?raw=true" width=60%>

Copy built files to SD card.
```sh
cd images/linux
cp BOOT.BIN /media/lp6m/BOOT/
cp image.ub /media/lp6m/BOOT/
cp boot.scr /media/lp6m/BOOT/
sudo tar xvf rootfs.tar.gz -C /media/lp6m/rootfs/
sync
```

# Create project from scratch
If you want to create petalinux project from scratch, please refer this section.  

<details><summary>Create project from scratch</summary><div>

## Create project

```sh
petalinux-create -t project --template zynqMP --name riscv_base_prj
petalinux-config --get-hw-description ../../vivado/riscv_base_prj/riscv_base_prj.xsa
```

## Modify project setting

```
petalinux-config
```
- Change UART port
change `uart0` to `uart1`.  

<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/petalinux/images/serial_port.png?raw=true" width=60%>  

- Change Image packing Configuration  

change `Root file system` to ext4.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/petalinux/images/fs_format1.png?raw=true" width=60%>

add `ext4` the end of the `Root file system format` string.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/petalinux/images/fs_format2.png?raw=true" width=60%>

- Change MACHINE_NAME
modify machine name to `avnet-ultra96-rev1`.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/petalinux/images/machine_name.png?raw=true" width=60%>

## Modify kernel setting
```sh
petalinux-config -c kernel
```

- Enable USB-LAN r8152 driver  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/petalinux/images/usblan.png?raw=true" width=60%>

- Disable CPU low power mode  
  
Disable `CPU Power Management -> CPU Frequency Scaling`, `CPU Power Management -> CPU Idle`.  

## Modify rootfs config
Copy [add_petalinux_packages.sh](https://github.com/Avnet/vitis/blob/2020p2_u96v2_sbc_base_20210426_105325/add_petalinux_packages.sh) and paste to terminal. This script adds some packages typically used such as OpenCV.  

Add some extra packages: add the following lines to `./project-spec/meta-user/conf/user-rootfsconfig`
```
CONFIG_xrt
CONFIG_xrt-dev
CONFIG_zocl
CONFIG_opencl-clhpp-dev
CONFIG_opencl-headers-dev
CONFIG_packagegroup-petalinux-opencv
```

## Modify device tree
Edit `./project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi` as the following.  
This allows Linux systems to recognize the AXI BRAM controller as a UIO device.  
```
/include/ "system-conf.dtsi"
/ {
    chosen {
        bootargs = "earlycon console=ttyPS0,115200 clk_ignore_unused root=/dev/mmcblk0p2 rw rootwait cma=512M uio_pdrv_genirq.of_id=generic-uio";
    };
    xlnk {
        compatible = "xlnx,xlnk-1.0";
    };

};

&sdhci0 {
    disable-wp;
};

&IMEM_CONTROL {
    compatible = "generic-uio";
};

&DMEM_CONTROL {
    compatible = "generic-uio";
};
```

</div>
</details>

# Run RISC-V from petalinux

Insert SD card, set power supply and connect USB-LAN adapter, and turn on the board power.  
Login username is `root`, password is `root`.  
From USB UART serial console, check IP address by `ipconfig`, and connect to the board via ssh.  

## Copy test files to the board
From host PC, 
```sh
cd <Repository Directory>/petalinux/
scp -r test_riscv root@192.168.xx.xx
```

## Check UIO device
Check which UIO device is recognized for each IP set in the device tree.  
We confirmed that `IMEM_CONTROL` is recognized as `/dev/uio1`, `DMEM_CONTROL` is recognized as `/dev/uio0`.  
```sh
ssh root@192.168.xx.xx
root@riscv_base_prj:~$ cat /sys/class/uio/uio0/maps/map0/name
axi_bram_ctrl@a0020000
root@riscv_base_prj:~$ cat /sys/class/uio/uio1/maps/map0/name
axi_bram_ctrl@a0000000
```
## Run RISC-V test
The tests are exactly the same as those performed in stand-alone mode in Vitis.  
```sh
ssh root@192.168.xx.xx
cd test_riscv
g++ test.cpp
./a.out
```
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/petalinux/images/petalinux.png?raw=true" width=60%>
