#define REGINT(address) *(volatile int*)(address)
#define REGUINT(address) *(volatile unsigned int*)(address)
#define REGINTPOINT(address) (volatile int*)(address)
#define REGFLOAT(address) *(volatile float*)(address)
#define DMEM_BASE  (0xA0030000)

int main(){

    float a = REGFLOAT(DMEM_BASE);
    float b = REGFLOAT(DMEM_BASE+4);
    float c = a + b;
    REGFLOAT(DMEM_BASE+8) = c;

    while(1){

    }
    return 1;

}
