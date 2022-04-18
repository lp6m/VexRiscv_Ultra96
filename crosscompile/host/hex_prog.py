fi = open('main_rtl.hex', 'r')
fo = open('riscv_imm.c','w')
flag = 0;
pc = 0;
print("unsigned int riscv_imm(unsigned volatile int *IMEM ) {",file=fo)
for data in fi:
    datas=data.replace('\n','')
    print("  IMEM[{0:>4}] = 0x{1};".format(pc,datas),file=fo)
    pc=pc+1
fi.close()
print("  return",pc,";",file=fo)
print("}",file=fo)
print("",file=fo)
fo.close()
