    .altmacro
    .macro memcpy src_begin, src_end, dst, tmp_reg
    LOCAL memcpy_1, memcpy_2
    j    memcpy_2
memcpy_1:
    lw   \tmp_reg, (\src_begin)
    sw   \tmp_reg, (\dst)
    add  \src_begin, \src_begin, 4
    add  \dst, \dst, 4
memcpy_2:
    bltu \src_begin, \src_end, memcpy_1
    .endm

    .macro memset dst_begin, dst_end, val_reg
    LOCAL memset_1, memset_2
    j    memset_2
memset_1:
    sw   \val_reg, (\dst_begin)
    add  \dst_begin, \dst_begin, 4
memset_2:
    bltu \dst_begin, \dst_end, memset_1
    .endm

    .section .text.start_
    .globl _start
    .globl main
##    .equ __C_STACK_TOP__, 0x1000
##    .equ __global_pointer__, 0x00000000
    
_start:
    li  x1, 0
    li  x2, 0
    li  x3, 0
    li  x4, 0
    li  x5, 0
    li  x6, 0
    li  x7, 0
    li  x8, 0
    li  x9, 0
    li  x10,0
    li  x11,0
    li  x12,0
    li  x13,0
    li  x14,0
    li  x15,0
    li  x16,0
    li  x17,0
    li  x18,0
    li  x19,0
    li  x20,0
    li  x21,0
    li  x22,0
    li  x23,0
    li  x24,0
    li  x25,0
    li  x26,0
    li  x27,0
    li  x28,0
    li  x29,0
    li  x30,0
    li  x31,0

    la  t0, _data_begin
    la  t1, _data_end
    la  t2, _data_region
    memcpy t0, t1, t2, s0 
    la  t0, _sdata_begin
    la  t1, _sdata_end
    la  t2, _sdata_region
    memcpy t0, t1, t2, s0 
    la  t0, _rodata_begin
    la  t1, _rodata_end
    la  t2, _rodata_region
    memcpy t0, t1, t2, s0 
    la  t0, _init_array_begin
    la  t1, _init_array_end
    la  t2, _init_array_region
    memcpy t0, t1, t2, s0
    la  t0, _bss_begin
    la t1, _bss_end
    memset t0, t1, x0  
    la  t0, _sbss_begin
    la  t1, _sbss_end
    memset t0, t1, x0  
    li t0 , 0
    li t1 , 0
    li t2 , 0
    li s0 , 0

    lui sp,      %hi(__C_STACK_TOP__)
    addi sp, sp, %lo(__C_STACK_TOP__)
    lui gp,      %hi(__global_pointer__)
    addi gp, gp, %lo(__global_pointer__)
    call main
    nop
.end _start

