#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"
#include "time.h"


#define GPIO_DIRM_5_OFFSET 0xFF0A0344
#define GPIO_OEN_5_OFFSET 0xFF0A0348
#define GPIO_DATA_5_OFFSET 0xFF0A0054
#define PL_RESETN_X 1
#define RESETBIT (31 - PL_RESETN_X)

#define REG(address) *(volatile unsigned int*)(address)
#define IMEM_BASE  (0xA0000000)
#define DMEM_BASE  (0xA0020000)

//https://support.xilinx.com/s/article/68962
//https://lp6m.hatenablog.com/entry/2021/12/30/004545
void pl_resetn_1(){
	REG(GPIO_DATA_5_OFFSET) &= ~(1 << RESETBIT);
	REG(GPIO_DATA_5_OFFSET) |= 1 << RESETBIT;
}

unsigned int float_as_uint(float f){
	union {float f; unsigned int i; } union_a;
	union_a.f = f;
	return union_a.i;
}

float uint_as_float(unsigned int i){
	union {float f; unsigned int i; } union_a;
	union_a.i = i;
	return union_a.f;
}

int main()
{
    init_platform();
    //set EMIO95 as output
    REG(GPIO_OEN_5_OFFSET) |= 1 << RESETBIT;
    REG(GPIO_DIRM_5_OFFSET) |= 1 << RESETBIT;
    //set RISC-V Instruction
    REG(IMEM_BASE+0 ) = 0xA0020437; //  0: lui s0,0xA0020000
	REG(IMEM_BASE+4 ) = 0x00040413; //  4: mv  s0,s0
	REG(IMEM_BASE+8 ) = 0x00042607; //  8: flw  fa2,0(s0) # 0xA0020000
	REG(IMEM_BASE+12) = 0x00442687; //  C: flw  fa3,4(s0)
	REG(IMEM_BASE+16) = 0x00c68753; // 10: fadd fa4,fa2,fa3
	REG(IMEM_BASE+20) = 0x00e42427; // 14: fsw  fa4,8(s0) # 0xA0020000
	REG(IMEM_BASE+24) = 0x0000006f; // 18: j   0x18

	//TEST start
	srand(100);
	int all_ok = 1;
	for(int i = 0; i < 100; i++){
		float a = (rand()%100)/100.0f;
		float b = (rand()%100)/100.0f;
		//set input data
		REG(DMEM_BASE+0 ) = float_as_uint(a);
		REG(DMEM_BASE+4 ) = float_as_uint(b);
		//reset to launch RISC-V core
		pl_resetn_1();
		//wait RISC-V execution completion by waiting some period or using polling
		usleep(100);
		//get output data
		unsigned int _c = REG(DMEM_BASE+8);
		float c = uint_as_float(_c);
		printf("%f+%f=%f:", a, b, c);
		if (a + b == c){
			printf("OK\n");
		} else {
			printf("NG\n");
			all_ok = 0;
		}
	}
	if (all_ok) printf("ALL PASSED\n");

    cleanup_platform();
    return 0;
}
