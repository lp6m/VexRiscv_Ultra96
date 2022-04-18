
CFLAGS := -Os
CFLAGS += -fno-builtin-printf -fno-common

SRC = main.cpp start.s
HDR =
LDFLAGS := -static -lgcc -Tlinker.ld -march=rv32imf -mabi=ilp32f -Wa,-march=rv32imf -nostartfiles

main: $(SRC) $(HDR)
	riscv32-unknown-elf-g++ $(CFLAGS) $(SRC) $(LDFLAGS) -o main
	riscv32-unknown-elf-objcopy --gap-fill 0 -O verilog main main.hex
	riscv32-unknown-elf-objdump -D main > main.dump
	/usr/bin/python3 ./hex_dump.py main
	/usr/bin/python3 ./hex_prog.py main


clean:
	rm -f main main.hex main.dump

