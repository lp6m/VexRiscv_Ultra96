# Install crosstool-ng

```sh
sudo apt install texinfo help2man libtool-bin
git clone https://github.com/crosstool-ng/crosstool-ng
cd crosstool-ng
./bootstrap
./configure
make
sudo make install
```

# Build cross compiler

`.config` file is compiler config file for RISC-V core in this repository.
```sh
cd <repository directory>/crosscompile/
unset LD_LIBRARY_PATH
ct-ng build
```
Built compiler is located at `~/x-tools/riscv32-unknown-elf/bin/:$PATH`.
```sh
export PATH=~/x-tools/riscv32-unknown-elf/bin/:$PATH
```

<details><summary>Create config file from scratch</summary><div>

Create default config file for riscv32.  
```sh
ct-ng riscv32-unknown-elf
```
Open menuconfig.  
```sh
ct-ng menuconfig
```
Enable `C++` in `C Compiler`.  
<image src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/crosscompile/image/cpp.png?raw=true" width=70%>

Change gcc version to `8.5.0` in `C Compiler`  .
<image src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/crosscompile/image/gccver.png?raw=true" width=70%>


Specify `ilp32f` to `Generate code for the specific ABI`.  
<image src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/crosscompile/image/abi.png?raw=true" width=70%>

Enable `newlib` in `C Library`.  
<image src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/crosscompile/image/newlib.png?raw=true" width=70%>

Close menuconfig and save configfile.  
</div>
</details>

# Cross-compile
`host/main.cpp` is the source code compiled for RISC-V.  

```sh
cd <repository directory>/crosscompile/host
make
```
The generated file `riscv_imm.c` looks like this:  

```c
unsigned int riscv_imm(unsigned volatile int *IMEM ) {
  IMEM[   0] = 0x00000093;
  IMEM[   1] = 0x00000113;
  IMEM[   2] = 0x00000193;
  IMEM[   3] = 0x00000213;
  IMEM[   4] = 0x00000293;
```

The instructions to be executed by riscv are declared in an array, so that they can be compiled together with the source code of the evaluation application to be executed on the Ultra96-V2 ARM core.  

```
./host
├── Makefile
├── main.cpp
├── hex_dump.py: dump program object to 'main.hex'
├── hex_prog.py: create 'riscv_imm.c' from 'main.hex'
├── linker.ld: linker script
└── start.s: startup code for RISC-V core
```

`hex_dump.py, hex_prog.py, linker.ld, start.s` files are borrowed from [SIGNATE 5th AI Edge Contest RISC-V reference environment](https://signate.jp/competitions/537). Thank you very much.  

In `linler.ld`, memory region is declared as the following:  

```c
MEMORY {
  ROM (rx) : ORIGIN = 0xA0000000, LENGTH = 64K  /*start from 0xA0000000 to 0xA000FFFF*/
  RAM (wx) : ORIGIN = 0xA0020000, LENGTH = 64K  /*start from 0xA0020000 to 0xA0002FFF*/
}
```
Memory range corresponds to the AXI memory address of `IMEM_CONTROL` and `DMEM_CONTROL`.  
However, even though DMEM has a memory range of 128K, only the first half 64K is declared to be used for program execution. In this way, the second half of the 64K, i.e., memory after 0xA00030000, can be used for data input/output for RISC-V program.

<image src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/vivado/images//address_editor.png?raw=true" width=70%>
  

# Run compiled application on RISC-V
`edge/main.cpp` is test application code to run a RISC-V core from an ARM core.  
The tests to be executed are the same as in file `petalinux/test_riscv/test.cpp`.  
  
Copy riscv instruction file and test application to Ultra96-V2.  
```
cd <repository directory>/crosscompile/edge
cp ../host/riscv_imm.c ./
cd ..
scp -r edge root@192.168.xx.xx:~/
ssh root@192.168.xx.xx
cd ~/edge
sh compile.sh && ./a.out
```

<image src="https://github.com/lp6m/VexRiscv_Ultra96/blob/media/crosscompile/image/test.png?raw=true" width=70%>


We also tested the execution of a more complicated program: [Vertical-Beach/ai-edge-contest-5](https://github.com/Vertical-Beach/ai-edge-contest-5/blob/main/test_app/riscv_test/host/main.cpp)

