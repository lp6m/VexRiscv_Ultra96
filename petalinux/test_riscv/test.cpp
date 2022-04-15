#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <time.h>
#include <stdlib.h>
#include <fcntl.h>
#include <dirent.h>
#include <unistd.h>
#include <fcntl.h>
#include <cstring>

#define REG(address) *(volatile unsigned int*)(address)


int pl_resetn_1(){
	int fd;
	char attr[32];

	DIR *dir = opendir("/sys/class/gpio/gpio510");
	if (!dir) {
		fd = open("/sys/class/gpio/export", O_WRONLY);
		if (fd < 0) {
			perror("open(/sys/class/gpio/export)");
			return -1;
		}
		strcpy(attr, "510");
		write(fd, attr, strlen(attr));
		close(fd);
		dir = opendir("/sys/class/gpio/gpio510");
		if (!dir) {
			return -1;
		}
	}
	closedir(dir);

	fd = open("/sys/class/gpio/gpio510/direction", O_WRONLY);
	if (fd < 0) {
		perror("open(/sys/class/gpio/gpio510/direction)");
		return -1;
	}
	strcpy(attr, "out");
	write(fd, attr, strlen(attr));
	close(fd);

	fd = open("/sys/class/gpio/gpio510/value", O_WRONLY);
	if (fd < 0) {
		perror("open(/sys/class/gpio/gpio510/value)");
		return -1;
	}
	sprintf(attr, "%d", 0);
	write(fd, attr, strlen(attr));

    sprintf(attr, "%d", 1);
	write(fd, attr, strlen(attr));
	close(fd);
	return 0;
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

// This program is DMEM[0]+DMEM[1]=DMEM[2]
int main(){
    int uio0_fd = open("/dev/uio0", O_RDWR | O_SYNC);
    unsigned int* DMEM_BASE = (unsigned int*) mmap(NULL, 0x2000, PROT_READ|PROT_WRITE, MAP_SHARED, uio0_fd, 0);
    int uio1_fd = open("/dev/uio1", O_RDWR | O_SYNC);
    unsigned int* IMEM_BASE = (unsigned int*) mmap(NULL, 0x1000, PROT_READ|PROT_WRITE, MAP_SHARED, uio1_fd, 0);
    if (uio0_fd < 0 || uio1_fd  < 0) {
        printf("Device Open Error");
        exit(-1);
    }
    //set RISC-V Instruction
    IMEM_BASE[0] = 0xA0020437; //  0: lui s0,0xA0020000
	IMEM_BASE[1] = 0x00040413; //  4: mv  s0,s0
	IMEM_BASE[2] = 0x00042607; //  8: flw  fa2,0(s0) # 0xA0020000
	IMEM_BASE[3] = 0x00442687; //  C: flw  fa3,4(s0)
	IMEM_BASE[4] = 0x00c68753; // 10: fadd fa4,fa2,fa3
	IMEM_BASE[5] = 0x00e42427; // 14: fsw  fa4,8(s0) # 0xA0020000
	IMEM_BASE[6] = 0x0000006f; // 18: j   0x18

	//TEST start
	srand(100);
	int all_ok = 1;
	for(int i = 0; i < 100; i++){
		float a = (rand()%100)/100.0f;
		float b = (rand()%100)/100.0f;
		//set input data
		DMEM_BASE[0] = float_as_uint(a);
		DMEM_BASE[1] = float_as_uint(b);
		//reset to launch RISC-V core
		pl_resetn_1();
		//wait RISC-V execution completion by waiting some period or using polling
		usleep(100);
		//get output data
		unsigned int _c = DMEM_BASE[2];
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
    return 0;
}
