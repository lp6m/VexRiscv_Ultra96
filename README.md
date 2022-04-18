# VexRiscv_Ultra96
- [VexRiscv_Ultra96](#vexriscv_ultra96)
- [VexRiscv core generation](#vexriscv-core-generation)
- [Vivado Design](#vivado-design)
- [Run RISC-V on standalone mode](#run-risc-v-on-standalone-mode)
- [Run RISC-V from Petalinux](#run-risc-v-from-petalinux)
- [Crosscompile C code for RISC-V](#crosscompile-c-code-for-risc-v)
- [Export as Vitis platform](#export-as-vitis-platform)

Implementation of VexRiscv with rv32imfac architecture on Ultra96-V2.  
Environment:
- Ubuntu 18.04
- Ultra96-V2
- Vivado/Vitis/Petalinux 2020.2

# VexRiscv core generation
In this project we generate RISC-V core with `rv32imfac` architecture in VexRiscv.  
See [coredef/README.md](/coredef/README.md) about the detail of core generation and definiton `GenSignate.scala`.

# Vivado Design
Vivado Project is located `./vivado/riscv_base_prj`.  
For subsequent process, you need to export `riscv_base_prj.xsa` in vivado because this file is too large to upload.   
[vivado/README.md](/vivado/README.md) describes the guide to create vivado design from scratch.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images/riscv_bd.png?raw=true" width=70%>

# Run RISC-V on standalone mode
Test floating point operations on RISC-V cores in standalone mode.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vitis_standalone/image/riscv_standalone.png?raw=true" width=70%>

See [vitis_standalone/README.md](/vitis_standalone/README.md) about the detail.  

# Run RISC-V from Petalinux
Test floating point operations on RISC-V cores from petalinux.  
<img src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/petalinux/images/petalinux.png?raw=true" width=70%>

See [petalinux/README.md](/petalinux/README.md) about the detail.  

# Crosscompile C code for RISC-V
Setup crosscompiler with [crosstool-NG](https://github.com/crosstool-ng/crosstool-ng).  
See [crosscompile/README.md](/crosscompile/README.md) about the detail.  

# Export as Vitis platform
Export RISC-V design and petalinux environment as Vitis platform.  
See [export_vitis/README.md](/export_vitis/README.md) about the detail.  
This platform is used base project for [Vertical-Beach/ai-edge-contest-5](https://github.com/Vertical-Beach/ai-edge-contest-5)