OUTPUT_ARCH( "riscv" )
ENTRY(_start)

MEMORY {
  ROM (rx) : ORIGIN = 0xA0000000, LENGTH = 64K  /*start from 0xA0000000 to 0xA000FFFF*/
  RAM (wx) : ORIGIN = 0xA0020000, LENGTH = 64K  /*start from 0xA0020000 to 0xA0002FFF*/
}

SECTIONS {

  /* code segment */

  .text.start_ : {
    *(.text.start_)
  } >ROM

  .text ALIGN(4) : {
    *(.text .text.*)
    . = ALIGN(4) ;
    _etext = ABSOLUTE(.) ;
   } >ROM

  /* Start RAM regions */
  /* data segment */
  .data  :
  AT ( _etext )
   {
    _data_region = ABSOLUTE(.) ;
    *(.data .data.*)
    . = ALIGN(4) ;
  } >RAM
  _data_begin = LOADADDR( .data ) ;
  _data_end = LOADADDR( .data ) + SIZEOF( .data ) ;

  /* sdata segment */
  .sdata ALIGN(4) :
  AT ( _etext + SIZEOF( .data) )
   {
    _sdata_region = ABSOLUTE(.) ;
    *(.sdata .sdata.*)
    . = ALIGN(4) ;
   } >RAM
  _sdata_begin = LOADADDR( .sdata ) ;
  _sdata_end = LOADADDR( .sdata ) + SIZEOF( .sdata ) ;

  /* rodata segment */
  .rodata  ALIGN(4) :
  AT ( _etext + SIZEOF( .data) + SIZEOF( .sdata) )
   {
    _rodata_region = ABSOLUTE(.) ;
    *(.rodata .rodata.* .srodata .srodata.*)
    . = ALIGN(4) ;
  } >RAM
  _rodata_begin = LOADADDR( .rodata ) ;
  _rodata_end = LOADADDR( .rodata ) + SIZEOF( .rodata ) ;

    /* init_array segment */
  .init_array  ALIGN(4) :
  AT ( _etext + SIZEOF( .data) + SIZEOF( .sdata) + SIZEOF( .rodata) )
   {
    _init_array_region = ABSOLUTE(.) ;
    *(.init_array .init_array.*)
    . = ALIGN(4) ;
  } >RAM
  _init_array_begin = LOADADDR( .init_array ) ;
  _init_array_end = LOADADDR( .init_array ) + SIZEOF( .init_array ) ;

  /* bss segment */
  .bss ALIGN(4) : {
    _bss_begin = ABSOLUTE(.) ;
    *(.bss .bss.* )
    *(.comm .common)
    . = ALIGN(4) ;
    _bss_end = ABSOLUTE(.) ;
  } >RAM

  .sbss ALIGN(4) : {
    _sbss_begin = ABSOLUTE(.) ;
    *(.sbss .sbss.*)
    *(.scomm .scommon)
    . = ALIGN(4) ;
    _sbss_end = ABSOLUTE(.) ;
  } >RAM


  PROVIDE(__global_pointer__ = ABSOLUTE(.) );
  PROVIDE(__C_STACK_TOP__ = ORIGIN(RAM) + LENGTH(RAM) ) ;
  _end = .;
  PROVIDE(__end = .);

  /* End of uninitalized data segement */


  /DISCARD/ : {
    *(.eh_frame .eh_frame.*)
  }
}
