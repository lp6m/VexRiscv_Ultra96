#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <time.h>
#include <stdlib.h>
#include <fcntl.h>
#include <dirent.h>
#include <unistd.h>
#include <cstring>
#include <iostream>

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

volatile int* DMEM_BASE;
volatile unsigned int* IMEM_BASE;
#define DMEM_OFFSET 1024*16 //later half of DMEM_CONTROL is used data i/o

extern unsigned int riscv_imm(volatile unsigned int *IMEM );

int main()
{
    int uio0_fd = open("/dev/uio0", O_RDWR | O_SYNC);
    DMEM_BASE = (int*) mmap(NULL, 0x20000, PROT_READ|PROT_WRITE, MAP_SHARED, uio0_fd, 0);
    int uio1_fd = open("/dev/uio1", O_RDWR | O_SYNC);
    IMEM_BASE = (unsigned int*) mmap(NULL, 0x10000, PROT_READ|PROT_WRITE, MAP_SHARED, uio1_fd, 0);

    //write instruction
    riscv_imm(IMEM_BASE);
    //TEST start
	srand(100);
	bool all_ok = true;
	for(int i = 0; i < 100; i++){
		float a = (rand()%100)/100.0f;
		float b = (rand()%100)/100.0f;
        //set input data
        volatile float* DMEM_BASE_FLOAT = (volatile float*) DMEM_BASE;
		DMEM_BASE_FLOAT[DMEM_OFFSET + 0] = a;
		DMEM_BASE_FLOAT[DMEM_OFFSET + 1] = b;
		//reset to launch RISC-V core
		pl_resetn_1();
		//wait RISC-V execution completion by waiting some period or using polling
		usleep(100);
		//get output data
		float c = DMEM_BASE_FLOAT[DMEM_OFFSET + 2];
		printf("%f+%f=%f:", a, b, c);
		if (a + b == c){
			printf("OK\n");
		} else {
			printf("NG\n");
			all_ok = false;
		}
	}
	if (all_ok) printf("ALL PASSED\n");
    return 0;
}
