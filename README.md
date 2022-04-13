# VexRiscv_Ultra96
- [VexRiscv_Ultra96](#vexriscv_ultra96)
- [VexRiscv core generation](#vexriscv-core-generation)
  - [Install sbt](#install-sbt)
  - [Core Generation](#core-generation)
- [Vivado Design](#vivado-design)
- [Run RISC-V on standalone mode](#run-risc-v-on-standalone-mode)
- [Run RISC-V from Petalinux](#run-risc-v-from-petalinux)
- [Crosscompile C code for RISC-V](#crosscompile-c-code-for-risc-v)
- [Export as Vitis platform](#export-as-vitis-platform)

Implementation of VexRiscv with rv32imfac architecture on Ultra96-V2.  
Environment:
- Ultra96-V2
- Vivado/Vitis/Petalinux 2020.2

# VexRiscv core generation
**TODO See [coredef/README.md](/coredef/README.md) about the detail of core definiton `GenSignate.scala`.**

## Install sbt
cf. [Ubuntu and other Debian-based distributions](https://www.scala-sbt.org/1.x/docs/Installing-sbt-on-Linux.html#Ubuntu+and+other+Debian-based+distributions)

```sh
sudo apt-get update
sudo apt-get install apt-transport-https curl gnupg -yqq
echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo -H gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import
sudo chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg
sudo apt-get update
sudo apt-get install sbt
```

## Core Generation
```sh
git clone https://github.com/lp6m/VexRiscv_Ultra96.git
cd VexRiscv_Ultra96
git clone https://github.com/SpinalHDL/VexRiscv.git #e1620c68b2bfcff7ad1bc8ce665cf4ce29452141
cp coredef/GenSignate.scala ./VexRiscv/src/main/scala/vexriscv/demo/
cd VexRiscv
sbt "runMain vexriscv.demo.GenSignate"
```
You will obtain `VexRiscv/VexRiscvSignate.v`.

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
**TODO**

# Crosscompile C code for RISC-V
**TODO**

# Export as Vitis platform
**TODO**