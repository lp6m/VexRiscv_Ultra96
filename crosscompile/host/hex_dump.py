#!/usr/bin/python3

from sys import argv

filename = argv[1] + '.hex'
workfile = argv[1] + '_rtl.hex'
work_addr = 0xa0000000
work_region = 4096
found_region=0
mr_addr=0
mem_regions = {}
ln_list = list()

with open(filename, 'r') as f:
    for line in f:
        #print(line, end='')
        if '@' in line:
            mr_addr = int(line.lstrip('@'), 16)
            #print("Got address ", mr_addr)
            #ln_list.clear()
            found_region+=1
            mem_regions.update({mr_addr : ln_list})
        elif found_region!=0:
            ln = line.split()
            #print(ln)
            ln_list.extend(ln)
            idx = len(ln_list)
            mem_regions.update({mr_addr : idx})

f.close()
#print(mem_regions)
with open(workfile, 'w') as fout:
    start_index=0
    stop_index =0
    for x in mem_regions:
        stop_index = mem_regions[x];
        print("Found address ", hex(x));
        #print("start index = ", start_index)
        #print("stop  index = ", stop_index)
        for i in range(start_index, stop_index, 4):
            instr = (ln_list[i+3] + ln_list[i+2] + ln_list[i+1] + ln_list[i] + '\n')
            #print(instr, end='')
            fout.write(instr)
        start_index = stop_index
    stop_index = work_region
    #print("remaining indexes: ", start_index, stop_index)
    for j in range(start_index, stop_index, 4):
        fout.write('00000000\n')

fout.close()


