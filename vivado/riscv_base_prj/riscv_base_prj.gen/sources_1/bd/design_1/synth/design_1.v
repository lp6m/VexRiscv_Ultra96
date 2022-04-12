//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Wed Apr 13 00:20:39 2022
//Host        : lp6m-ryzen running 64-bit Ubuntu 18.04.4 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=15,numReposBlks=15,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_zynq_ultra_ps_e_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   ();

  wire [31:0]MyRiscv_0_M00_AXI_ARADDR;
  wire [1:0]MyRiscv_0_M00_AXI_ARBURST;
  wire [3:0]MyRiscv_0_M00_AXI_ARCACHE;
  wire [0:0]MyRiscv_0_M00_AXI_ARID;
  wire [7:0]MyRiscv_0_M00_AXI_ARLEN;
  wire MyRiscv_0_M00_AXI_ARLOCK;
  wire [2:0]MyRiscv_0_M00_AXI_ARPROT;
  wire [3:0]MyRiscv_0_M00_AXI_ARQOS;
  wire MyRiscv_0_M00_AXI_ARREADY;
  wire [2:0]MyRiscv_0_M00_AXI_ARSIZE;
  wire [0:0]MyRiscv_0_M00_AXI_ARUSER;
  wire MyRiscv_0_M00_AXI_ARVALID;
  wire [31:0]MyRiscv_0_M00_AXI_AWADDR;
  wire [1:0]MyRiscv_0_M00_AXI_AWBURST;
  wire [3:0]MyRiscv_0_M00_AXI_AWCACHE;
  wire [0:0]MyRiscv_0_M00_AXI_AWID;
  wire [7:0]MyRiscv_0_M00_AXI_AWLEN;
  wire MyRiscv_0_M00_AXI_AWLOCK;
  wire [2:0]MyRiscv_0_M00_AXI_AWPROT;
  wire [3:0]MyRiscv_0_M00_AXI_AWQOS;
  wire MyRiscv_0_M00_AXI_AWREADY;
  wire [2:0]MyRiscv_0_M00_AXI_AWSIZE;
  wire [0:0]MyRiscv_0_M00_AXI_AWUSER;
  wire MyRiscv_0_M00_AXI_AWVALID;
  wire [0:0]MyRiscv_0_M00_AXI_BID;
  wire MyRiscv_0_M00_AXI_BREADY;
  wire [1:0]MyRiscv_0_M00_AXI_BRESP;
  wire [0:0]MyRiscv_0_M00_AXI_BUSER;
  wire MyRiscv_0_M00_AXI_BVALID;
  wire [31:0]MyRiscv_0_M00_AXI_RDATA;
  wire [0:0]MyRiscv_0_M00_AXI_RID;
  wire MyRiscv_0_M00_AXI_RLAST;
  wire MyRiscv_0_M00_AXI_RREADY;
  wire [1:0]MyRiscv_0_M00_AXI_RRESP;
  wire MyRiscv_0_M00_AXI_RVALID;
  wire [31:0]MyRiscv_0_M00_AXI_WDATA;
  wire MyRiscv_0_M00_AXI_WLAST;
  wire MyRiscv_0_M00_AXI_WREADY;
  wire [3:0]MyRiscv_0_M00_AXI_WSTRB;
  wire MyRiscv_0_M00_AXI_WVALID;
  wire [31:0]MyRiscv_0_M01_AXI_ARADDR;
  wire [1:0]MyRiscv_0_M01_AXI_ARBURST;
  wire [3:0]MyRiscv_0_M01_AXI_ARCACHE;
  wire [0:0]MyRiscv_0_M01_AXI_ARID;
  wire [7:0]MyRiscv_0_M01_AXI_ARLEN;
  wire MyRiscv_0_M01_AXI_ARLOCK;
  wire [2:0]MyRiscv_0_M01_AXI_ARPROT;
  wire [3:0]MyRiscv_0_M01_AXI_ARQOS;
  wire MyRiscv_0_M01_AXI_ARREADY;
  wire [2:0]MyRiscv_0_M01_AXI_ARSIZE;
  wire [0:0]MyRiscv_0_M01_AXI_ARUSER;
  wire MyRiscv_0_M01_AXI_ARVALID;
  wire [31:0]MyRiscv_0_M01_AXI_AWADDR;
  wire [1:0]MyRiscv_0_M01_AXI_AWBURST;
  wire [3:0]MyRiscv_0_M01_AXI_AWCACHE;
  wire [0:0]MyRiscv_0_M01_AXI_AWID;
  wire [7:0]MyRiscv_0_M01_AXI_AWLEN;
  wire MyRiscv_0_M01_AXI_AWLOCK;
  wire [2:0]MyRiscv_0_M01_AXI_AWPROT;
  wire [3:0]MyRiscv_0_M01_AXI_AWQOS;
  wire MyRiscv_0_M01_AXI_AWREADY;
  wire [2:0]MyRiscv_0_M01_AXI_AWSIZE;
  wire [0:0]MyRiscv_0_M01_AXI_AWUSER;
  wire MyRiscv_0_M01_AXI_AWVALID;
  wire [0:0]MyRiscv_0_M01_AXI_BID;
  wire MyRiscv_0_M01_AXI_BREADY;
  wire [1:0]MyRiscv_0_M01_AXI_BRESP;
  wire [0:0]MyRiscv_0_M01_AXI_BUSER;
  wire MyRiscv_0_M01_AXI_BVALID;
  wire [31:0]MyRiscv_0_M01_AXI_RDATA;
  wire [0:0]MyRiscv_0_M01_AXI_RID;
  wire MyRiscv_0_M01_AXI_RLAST;
  wire MyRiscv_0_M01_AXI_RREADY;
  wire [1:0]MyRiscv_0_M01_AXI_RRESP;
  wire MyRiscv_0_M01_AXI_RVALID;
  wire [31:0]MyRiscv_0_M01_AXI_WDATA;
  wire MyRiscv_0_M01_AXI_WLAST;
  wire MyRiscv_0_M01_AXI_WREADY;
  wire [3:0]MyRiscv_0_M01_AXI_WSTRB;
  wire MyRiscv_0_M01_AXI_WVALID;
  wire [15:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire [16:0]axi_bram_ctrl_1_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_1_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_1_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_1_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_1_BRAM_PORTA_EN;
  wire axi_bram_ctrl_1_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_1_BRAM_PORTA_WE;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out2;
  wire clk_wiz_0_clk_out3;
  wire clk_wiz_0_clk_out4;
  wire clk_wiz_0_clk_out5;
  wire clk_wiz_0_locked;
  wire [0:0]proc_sys_reset_5_peripheral_aresetn;
  wire [15:0]smartconnect_0_M00_AXI_ARADDR;
  wire [1:0]smartconnect_0_M00_AXI_ARBURST;
  wire [3:0]smartconnect_0_M00_AXI_ARCACHE;
  wire [7:0]smartconnect_0_M00_AXI_ARLEN;
  wire [0:0]smartconnect_0_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_0_M00_AXI_ARPROT;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire [2:0]smartconnect_0_M00_AXI_ARSIZE;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [15:0]smartconnect_0_M00_AXI_AWADDR;
  wire [1:0]smartconnect_0_M00_AXI_AWBURST;
  wire [3:0]smartconnect_0_M00_AXI_AWCACHE;
  wire [7:0]smartconnect_0_M00_AXI_AWLEN;
  wire [0:0]smartconnect_0_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_0_M00_AXI_AWPROT;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire [2:0]smartconnect_0_M00_AXI_AWSIZE;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [31:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RLAST;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [31:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WLAST;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [3:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;
  wire [16:0]smartconnect_0_M01_AXI_ARADDR;
  wire [1:0]smartconnect_0_M01_AXI_ARBURST;
  wire [3:0]smartconnect_0_M01_AXI_ARCACHE;
  wire [7:0]smartconnect_0_M01_AXI_ARLEN;
  wire [0:0]smartconnect_0_M01_AXI_ARLOCK;
  wire [2:0]smartconnect_0_M01_AXI_ARPROT;
  wire smartconnect_0_M01_AXI_ARREADY;
  wire [2:0]smartconnect_0_M01_AXI_ARSIZE;
  wire smartconnect_0_M01_AXI_ARVALID;
  wire [16:0]smartconnect_0_M01_AXI_AWADDR;
  wire [1:0]smartconnect_0_M01_AXI_AWBURST;
  wire [3:0]smartconnect_0_M01_AXI_AWCACHE;
  wire [7:0]smartconnect_0_M01_AXI_AWLEN;
  wire [0:0]smartconnect_0_M01_AXI_AWLOCK;
  wire [2:0]smartconnect_0_M01_AXI_AWPROT;
  wire smartconnect_0_M01_AXI_AWREADY;
  wire [2:0]smartconnect_0_M01_AXI_AWSIZE;
  wire smartconnect_0_M01_AXI_AWVALID;
  wire smartconnect_0_M01_AXI_BREADY;
  wire [1:0]smartconnect_0_M01_AXI_BRESP;
  wire smartconnect_0_M01_AXI_BVALID;
  wire [31:0]smartconnect_0_M01_AXI_RDATA;
  wire smartconnect_0_M01_AXI_RLAST;
  wire smartconnect_0_M01_AXI_RREADY;
  wire [1:0]smartconnect_0_M01_AXI_RRESP;
  wire smartconnect_0_M01_AXI_RVALID;
  wire [31:0]smartconnect_0_M01_AXI_WDATA;
  wire smartconnect_0_M01_AXI_WLAST;
  wire smartconnect_0_M01_AXI_WREADY;
  wire [3:0]smartconnect_0_M01_AXI_WSTRB;
  wire smartconnect_0_M01_AXI_WVALID;
  wire [0:0]xlconstant_0_dout;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARUSER;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWUSER;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID;
  wire [127:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID;
  wire [127:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID;
  wire zynq_ultra_ps_e_0_pl_clk0;
  wire zynq_ultra_ps_e_0_pl_clk1;
  wire zynq_ultra_ps_e_0_pl_resetn0;
  wire zynq_ultra_ps_e_0_pl_resetn1;

  design_1_axi_bram_ctrl_0_2 DMEM_CONTROL
       (.bram_addr_a(axi_bram_ctrl_1_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_1_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_1_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_1_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_1_BRAM_PORTA_RST),
        .bram_we_a(axi_bram_ctrl_1_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_1_BRAM_PORTA_DIN),
        .s_axi_aclk(zynq_ultra_ps_e_0_pl_clk1),
        .s_axi_araddr(smartconnect_0_M01_AXI_ARADDR),
        .s_axi_arburst(smartconnect_0_M01_AXI_ARBURST),
        .s_axi_arcache(smartconnect_0_M01_AXI_ARCACHE),
        .s_axi_aresetn(proc_sys_reset_5_peripheral_aresetn),
        .s_axi_arlen(smartconnect_0_M01_AXI_ARLEN),
        .s_axi_arlock(smartconnect_0_M01_AXI_ARLOCK),
        .s_axi_arprot(smartconnect_0_M01_AXI_ARPROT),
        .s_axi_arready(smartconnect_0_M01_AXI_ARREADY),
        .s_axi_arsize(smartconnect_0_M01_AXI_ARSIZE),
        .s_axi_arvalid(smartconnect_0_M01_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_0_M01_AXI_AWADDR),
        .s_axi_awburst(smartconnect_0_M01_AXI_AWBURST),
        .s_axi_awcache(smartconnect_0_M01_AXI_AWCACHE),
        .s_axi_awlen(smartconnect_0_M01_AXI_AWLEN),
        .s_axi_awlock(smartconnect_0_M01_AXI_AWLOCK),
        .s_axi_awprot(smartconnect_0_M01_AXI_AWPROT),
        .s_axi_awready(smartconnect_0_M01_AXI_AWREADY),
        .s_axi_awsize(smartconnect_0_M01_AXI_AWSIZE),
        .s_axi_awvalid(smartconnect_0_M01_AXI_AWVALID),
        .s_axi_bready(smartconnect_0_M01_AXI_BREADY),
        .s_axi_bresp(smartconnect_0_M01_AXI_BRESP),
        .s_axi_bvalid(smartconnect_0_M01_AXI_BVALID),
        .s_axi_rdata(smartconnect_0_M01_AXI_RDATA),
        .s_axi_rlast(smartconnect_0_M01_AXI_RLAST),
        .s_axi_rready(smartconnect_0_M01_AXI_RREADY),
        .s_axi_rresp(smartconnect_0_M01_AXI_RRESP),
        .s_axi_rvalid(smartconnect_0_M01_AXI_RVALID),
        .s_axi_wdata(smartconnect_0_M01_AXI_WDATA),
        .s_axi_wlast(smartconnect_0_M01_AXI_WLAST),
        .s_axi_wready(smartconnect_0_M01_AXI_WREADY),
        .s_axi_wstrb(smartconnect_0_M01_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_0_M01_AXI_WVALID));
  design_1_axi_bram_ctrl_0_0 IMEM_CONTROL
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .s_axi_aclk(zynq_ultra_ps_e_0_pl_clk1),
        .s_axi_araddr(smartconnect_0_M00_AXI_ARADDR),
        .s_axi_arburst(smartconnect_0_M00_AXI_ARBURST),
        .s_axi_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .s_axi_aresetn(proc_sys_reset_5_peripheral_aresetn),
        .s_axi_arlen(smartconnect_0_M00_AXI_ARLEN),
        .s_axi_arlock(smartconnect_0_M00_AXI_ARLOCK),
        .s_axi_arprot(smartconnect_0_M00_AXI_ARPROT),
        .s_axi_arready(smartconnect_0_M00_AXI_ARREADY),
        .s_axi_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .s_axi_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .s_axi_awburst(smartconnect_0_M00_AXI_AWBURST),
        .s_axi_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .s_axi_awlen(smartconnect_0_M00_AXI_AWLEN),
        .s_axi_awlock(smartconnect_0_M00_AXI_AWLOCK),
        .s_axi_awprot(smartconnect_0_M00_AXI_AWPROT),
        .s_axi_awready(smartconnect_0_M00_AXI_AWREADY),
        .s_axi_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .s_axi_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .s_axi_bready(smartconnect_0_M00_AXI_BREADY),
        .s_axi_bresp(smartconnect_0_M00_AXI_BRESP),
        .s_axi_bvalid(smartconnect_0_M00_AXI_BVALID),
        .s_axi_rdata(smartconnect_0_M00_AXI_RDATA),
        .s_axi_rlast(smartconnect_0_M00_AXI_RLAST),
        .s_axi_rready(smartconnect_0_M00_AXI_RREADY),
        .s_axi_rresp(smartconnect_0_M00_AXI_RRESP),
        .s_axi_rvalid(smartconnect_0_M00_AXI_RVALID),
        .s_axi_wdata(smartconnect_0_M00_AXI_WDATA),
        .s_axi_wlast(smartconnect_0_M00_AXI_WLAST),
        .s_axi_wready(smartconnect_0_M00_AXI_WREADY),
        .s_axi_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_0_M00_AXI_WVALID));
  design_1_MyRiscv_0_0 MyRiscv_0
       (.m00_axi_aclk(zynq_ultra_ps_e_0_pl_clk1),
        .m00_axi_araddr(MyRiscv_0_M00_AXI_ARADDR),
        .m00_axi_arburst(MyRiscv_0_M00_AXI_ARBURST),
        .m00_axi_arcache(MyRiscv_0_M00_AXI_ARCACHE),
        .m00_axi_aresetn(proc_sys_reset_5_peripheral_aresetn),
        .m00_axi_arid(MyRiscv_0_M00_AXI_ARID),
        .m00_axi_arlen(MyRiscv_0_M00_AXI_ARLEN),
        .m00_axi_arlock(MyRiscv_0_M00_AXI_ARLOCK),
        .m00_axi_arprot(MyRiscv_0_M00_AXI_ARPROT),
        .m00_axi_arqos(MyRiscv_0_M00_AXI_ARQOS),
        .m00_axi_arready(MyRiscv_0_M00_AXI_ARREADY),
        .m00_axi_arsize(MyRiscv_0_M00_AXI_ARSIZE),
        .m00_axi_aruser(MyRiscv_0_M00_AXI_ARUSER),
        .m00_axi_arvalid(MyRiscv_0_M00_AXI_ARVALID),
        .m00_axi_awaddr(MyRiscv_0_M00_AXI_AWADDR),
        .m00_axi_awburst(MyRiscv_0_M00_AXI_AWBURST),
        .m00_axi_awcache(MyRiscv_0_M00_AXI_AWCACHE),
        .m00_axi_awid(MyRiscv_0_M00_AXI_AWID),
        .m00_axi_awlen(MyRiscv_0_M00_AXI_AWLEN),
        .m00_axi_awlock(MyRiscv_0_M00_AXI_AWLOCK),
        .m00_axi_awprot(MyRiscv_0_M00_AXI_AWPROT),
        .m00_axi_awqos(MyRiscv_0_M00_AXI_AWQOS),
        .m00_axi_awready(MyRiscv_0_M00_AXI_AWREADY),
        .m00_axi_awsize(MyRiscv_0_M00_AXI_AWSIZE),
        .m00_axi_awuser(MyRiscv_0_M00_AXI_AWUSER),
        .m00_axi_awvalid(MyRiscv_0_M00_AXI_AWVALID),
        .m00_axi_bid(MyRiscv_0_M00_AXI_BID),
        .m00_axi_bready(MyRiscv_0_M00_AXI_BREADY),
        .m00_axi_bresp(MyRiscv_0_M00_AXI_BRESP),
        .m00_axi_buser(MyRiscv_0_M00_AXI_BUSER),
        .m00_axi_bvalid(MyRiscv_0_M00_AXI_BVALID),
        .m00_axi_init_axi_txn(xlconstant_0_dout),
        .m00_axi_rdata(MyRiscv_0_M00_AXI_RDATA),
        .m00_axi_rid(MyRiscv_0_M00_AXI_RID),
        .m00_axi_rlast(MyRiscv_0_M00_AXI_RLAST),
        .m00_axi_rready(MyRiscv_0_M00_AXI_RREADY),
        .m00_axi_rresp(MyRiscv_0_M00_AXI_RRESP),
        .m00_axi_ruser(1'b0),
        .m00_axi_rvalid(MyRiscv_0_M00_AXI_RVALID),
        .m00_axi_wdata(MyRiscv_0_M00_AXI_WDATA),
        .m00_axi_wlast(MyRiscv_0_M00_AXI_WLAST),
        .m00_axi_wready(MyRiscv_0_M00_AXI_WREADY),
        .m00_axi_wstrb(MyRiscv_0_M00_AXI_WSTRB),
        .m00_axi_wvalid(MyRiscv_0_M00_AXI_WVALID),
        .m01_axi_aclk(zynq_ultra_ps_e_0_pl_clk1),
        .m01_axi_araddr(MyRiscv_0_M01_AXI_ARADDR),
        .m01_axi_arburst(MyRiscv_0_M01_AXI_ARBURST),
        .m01_axi_arcache(MyRiscv_0_M01_AXI_ARCACHE),
        .m01_axi_aresetn(proc_sys_reset_5_peripheral_aresetn),
        .m01_axi_arid(MyRiscv_0_M01_AXI_ARID),
        .m01_axi_arlen(MyRiscv_0_M01_AXI_ARLEN),
        .m01_axi_arlock(MyRiscv_0_M01_AXI_ARLOCK),
        .m01_axi_arprot(MyRiscv_0_M01_AXI_ARPROT),
        .m01_axi_arqos(MyRiscv_0_M01_AXI_ARQOS),
        .m01_axi_arready(MyRiscv_0_M01_AXI_ARREADY),
        .m01_axi_arsize(MyRiscv_0_M01_AXI_ARSIZE),
        .m01_axi_aruser(MyRiscv_0_M01_AXI_ARUSER),
        .m01_axi_arvalid(MyRiscv_0_M01_AXI_ARVALID),
        .m01_axi_awaddr(MyRiscv_0_M01_AXI_AWADDR),
        .m01_axi_awburst(MyRiscv_0_M01_AXI_AWBURST),
        .m01_axi_awcache(MyRiscv_0_M01_AXI_AWCACHE),
        .m01_axi_awid(MyRiscv_0_M01_AXI_AWID),
        .m01_axi_awlen(MyRiscv_0_M01_AXI_AWLEN),
        .m01_axi_awlock(MyRiscv_0_M01_AXI_AWLOCK),
        .m01_axi_awprot(MyRiscv_0_M01_AXI_AWPROT),
        .m01_axi_awqos(MyRiscv_0_M01_AXI_AWQOS),
        .m01_axi_awready(MyRiscv_0_M01_AXI_AWREADY),
        .m01_axi_awsize(MyRiscv_0_M01_AXI_AWSIZE),
        .m01_axi_awuser(MyRiscv_0_M01_AXI_AWUSER),
        .m01_axi_awvalid(MyRiscv_0_M01_AXI_AWVALID),
        .m01_axi_bid(MyRiscv_0_M01_AXI_BID),
        .m01_axi_bready(MyRiscv_0_M01_AXI_BREADY),
        .m01_axi_bresp(MyRiscv_0_M01_AXI_BRESP),
        .m01_axi_buser(MyRiscv_0_M01_AXI_BUSER),
        .m01_axi_bvalid(MyRiscv_0_M01_AXI_BVALID),
        .m01_axi_init_axi_txn(xlconstant_0_dout),
        .m01_axi_rdata(MyRiscv_0_M01_AXI_RDATA),
        .m01_axi_rid(MyRiscv_0_M01_AXI_RID),
        .m01_axi_rlast(MyRiscv_0_M01_AXI_RLAST),
        .m01_axi_rready(MyRiscv_0_M01_AXI_RREADY),
        .m01_axi_rresp(MyRiscv_0_M01_AXI_RRESP),
        .m01_axi_ruser(1'b0),
        .m01_axi_rvalid(MyRiscv_0_M01_AXI_RVALID),
        .m01_axi_wdata(MyRiscv_0_M01_AXI_WDATA),
        .m01_axi_wlast(MyRiscv_0_M01_AXI_WLAST),
        .m01_axi_wready(MyRiscv_0_M01_AXI_WREADY),
        .m01_axi_wstrb(MyRiscv_0_M01_AXI_WSTRB),
        .m01_axi_wvalid(MyRiscv_0_M01_AXI_WVALID),
        .riscv_clk(zynq_ultra_ps_e_0_pl_clk1),
        .riscv_resetn(proc_sys_reset_5_peripheral_aresetn));
  design_1_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTA_ADDR}),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE));
  design_1_blk_mem_gen_0_1 blk_mem_gen_1
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_1_BRAM_PORTA_ADDR}),
        .clka(axi_bram_ctrl_1_BRAM_PORTA_CLK),
        .dina(axi_bram_ctrl_1_BRAM_PORTA_DIN),
        .douta(axi_bram_ctrl_1_BRAM_PORTA_DOUT),
        .ena(axi_bram_ctrl_1_BRAM_PORTA_EN),
        .rsta(axi_bram_ctrl_1_BRAM_PORTA_RST),
        .wea(axi_bram_ctrl_1_BRAM_PORTA_WE));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(zynq_ultra_ps_e_0_pl_clk0),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(clk_wiz_0_clk_out2),
        .clk_out3(clk_wiz_0_clk_out3),
        .clk_out4(clk_wiz_0_clk_out4),
        .clk_out5(clk_wiz_0_clk_out5),
        .locked(clk_wiz_0_locked),
        .resetn(zynq_ultra_ps_e_0_pl_resetn0));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(zynq_ultra_ps_e_0_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
  design_1_proc_sys_reset_0_1 proc_sys_reset_1
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(zynq_ultra_ps_e_0_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .slowest_sync_clk(clk_wiz_0_clk_out2));
  design_1_proc_sys_reset_1_0 proc_sys_reset_2
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(zynq_ultra_ps_e_0_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .slowest_sync_clk(clk_wiz_0_clk_out3));
  design_1_proc_sys_reset_2_0 proc_sys_reset_3
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(zynq_ultra_ps_e_0_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .slowest_sync_clk(clk_wiz_0_clk_out4));
  design_1_proc_sys_reset_3_0 proc_sys_reset_4
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(zynq_ultra_ps_e_0_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .slowest_sync_clk(clk_wiz_0_clk_out5));
  design_1_proc_sys_reset_0_2 proc_sys_reset_5
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(zynq_ultra_ps_e_0_pl_resetn1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_5_peripheral_aresetn),
        .slowest_sync_clk(zynq_ultra_ps_e_0_pl_clk1));
  design_1_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(smartconnect_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(smartconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_buser(1'b0),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .M01_AXI_araddr(smartconnect_0_M01_AXI_ARADDR),
        .M01_AXI_arburst(smartconnect_0_M01_AXI_ARBURST),
        .M01_AXI_arcache(smartconnect_0_M01_AXI_ARCACHE),
        .M01_AXI_arlen(smartconnect_0_M01_AXI_ARLEN),
        .M01_AXI_arlock(smartconnect_0_M01_AXI_ARLOCK),
        .M01_AXI_arprot(smartconnect_0_M01_AXI_ARPROT),
        .M01_AXI_arready(smartconnect_0_M01_AXI_ARREADY),
        .M01_AXI_arsize(smartconnect_0_M01_AXI_ARSIZE),
        .M01_AXI_arvalid(smartconnect_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(smartconnect_0_M01_AXI_AWADDR),
        .M01_AXI_awburst(smartconnect_0_M01_AXI_AWBURST),
        .M01_AXI_awcache(smartconnect_0_M01_AXI_AWCACHE),
        .M01_AXI_awlen(smartconnect_0_M01_AXI_AWLEN),
        .M01_AXI_awlock(smartconnect_0_M01_AXI_AWLOCK),
        .M01_AXI_awprot(smartconnect_0_M01_AXI_AWPROT),
        .M01_AXI_awready(smartconnect_0_M01_AXI_AWREADY),
        .M01_AXI_awsize(smartconnect_0_M01_AXI_AWSIZE),
        .M01_AXI_awvalid(smartconnect_0_M01_AXI_AWVALID),
        .M01_AXI_bready(smartconnect_0_M01_AXI_BREADY),
        .M01_AXI_bresp(smartconnect_0_M01_AXI_BRESP),
        .M01_AXI_buser(1'b0),
        .M01_AXI_bvalid(smartconnect_0_M01_AXI_BVALID),
        .M01_AXI_rdata(smartconnect_0_M01_AXI_RDATA),
        .M01_AXI_rlast(smartconnect_0_M01_AXI_RLAST),
        .M01_AXI_rready(smartconnect_0_M01_AXI_RREADY),
        .M01_AXI_rresp(smartconnect_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(smartconnect_0_M01_AXI_RVALID),
        .M01_AXI_wdata(smartconnect_0_M01_AXI_WDATA),
        .M01_AXI_wlast(smartconnect_0_M01_AXI_WLAST),
        .M01_AXI_wready(smartconnect_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(smartconnect_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(smartconnect_0_M01_AXI_WVALID),
        .S00_AXI_araddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR),
        .S00_AXI_arburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST),
        .S00_AXI_arcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE),
        .S00_AXI_arid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID),
        .S00_AXI_arlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN),
        .S00_AXI_arlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK),
        .S00_AXI_arprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT),
        .S00_AXI_arqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS),
        .S00_AXI_arready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY),
        .S00_AXI_arsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE),
        .S00_AXI_aruser(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARUSER),
        .S00_AXI_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID),
        .S00_AXI_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR),
        .S00_AXI_awburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST),
        .S00_AXI_awcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE),
        .S00_AXI_awid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID),
        .S00_AXI_awlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN),
        .S00_AXI_awlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK),
        .S00_AXI_awprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT),
        .S00_AXI_awqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS),
        .S00_AXI_awready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY),
        .S00_AXI_awsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE),
        .S00_AXI_awuser(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWUSER),
        .S00_AXI_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID),
        .S00_AXI_bid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID),
        .S00_AXI_bready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY),
        .S00_AXI_bresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP),
        .S00_AXI_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID),
        .S00_AXI_rdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA),
        .S00_AXI_rid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID),
        .S00_AXI_rlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST),
        .S00_AXI_rready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY),
        .S00_AXI_rresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP),
        .S00_AXI_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID),
        .S00_AXI_wdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA),
        .S00_AXI_wlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST),
        .S00_AXI_wready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY),
        .S00_AXI_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB),
        .S00_AXI_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID),
        .S01_AXI_araddr(MyRiscv_0_M00_AXI_ARADDR),
        .S01_AXI_arburst(MyRiscv_0_M00_AXI_ARBURST),
        .S01_AXI_arcache(MyRiscv_0_M00_AXI_ARCACHE),
        .S01_AXI_arid(MyRiscv_0_M00_AXI_ARID),
        .S01_AXI_arlen(MyRiscv_0_M00_AXI_ARLEN),
        .S01_AXI_arlock(MyRiscv_0_M00_AXI_ARLOCK),
        .S01_AXI_arprot(MyRiscv_0_M00_AXI_ARPROT),
        .S01_AXI_arqos(MyRiscv_0_M00_AXI_ARQOS),
        .S01_AXI_arready(MyRiscv_0_M00_AXI_ARREADY),
        .S01_AXI_arsize(MyRiscv_0_M00_AXI_ARSIZE),
        .S01_AXI_aruser(MyRiscv_0_M00_AXI_ARUSER),
        .S01_AXI_arvalid(MyRiscv_0_M00_AXI_ARVALID),
        .S01_AXI_awaddr(MyRiscv_0_M00_AXI_AWADDR),
        .S01_AXI_awburst(MyRiscv_0_M00_AXI_AWBURST),
        .S01_AXI_awcache(MyRiscv_0_M00_AXI_AWCACHE),
        .S01_AXI_awid(MyRiscv_0_M00_AXI_AWID),
        .S01_AXI_awlen(MyRiscv_0_M00_AXI_AWLEN),
        .S01_AXI_awlock(MyRiscv_0_M00_AXI_AWLOCK),
        .S01_AXI_awprot(MyRiscv_0_M00_AXI_AWPROT),
        .S01_AXI_awqos(MyRiscv_0_M00_AXI_AWQOS),
        .S01_AXI_awready(MyRiscv_0_M00_AXI_AWREADY),
        .S01_AXI_awsize(MyRiscv_0_M00_AXI_AWSIZE),
        .S01_AXI_awuser(MyRiscv_0_M00_AXI_AWUSER),
        .S01_AXI_awvalid(MyRiscv_0_M00_AXI_AWVALID),
        .S01_AXI_bid(MyRiscv_0_M00_AXI_BID),
        .S01_AXI_bready(MyRiscv_0_M00_AXI_BREADY),
        .S01_AXI_bresp(MyRiscv_0_M00_AXI_BRESP),
        .S01_AXI_buser(MyRiscv_0_M00_AXI_BUSER),
        .S01_AXI_bvalid(MyRiscv_0_M00_AXI_BVALID),
        .S01_AXI_rdata(MyRiscv_0_M00_AXI_RDATA),
        .S01_AXI_rid(MyRiscv_0_M00_AXI_RID),
        .S01_AXI_rlast(MyRiscv_0_M00_AXI_RLAST),
        .S01_AXI_rready(MyRiscv_0_M00_AXI_RREADY),
        .S01_AXI_rresp(MyRiscv_0_M00_AXI_RRESP),
        .S01_AXI_rvalid(MyRiscv_0_M00_AXI_RVALID),
        .S01_AXI_wdata(MyRiscv_0_M00_AXI_WDATA),
        .S01_AXI_wlast(MyRiscv_0_M00_AXI_WLAST),
        .S01_AXI_wready(MyRiscv_0_M00_AXI_WREADY),
        .S01_AXI_wstrb(MyRiscv_0_M00_AXI_WSTRB),
        .S01_AXI_wvalid(MyRiscv_0_M00_AXI_WVALID),
        .S02_AXI_araddr(MyRiscv_0_M01_AXI_ARADDR),
        .S02_AXI_arburst(MyRiscv_0_M01_AXI_ARBURST),
        .S02_AXI_arcache(MyRiscv_0_M01_AXI_ARCACHE),
        .S02_AXI_arid(MyRiscv_0_M01_AXI_ARID),
        .S02_AXI_arlen(MyRiscv_0_M01_AXI_ARLEN),
        .S02_AXI_arlock(MyRiscv_0_M01_AXI_ARLOCK),
        .S02_AXI_arprot(MyRiscv_0_M01_AXI_ARPROT),
        .S02_AXI_arqos(MyRiscv_0_M01_AXI_ARQOS),
        .S02_AXI_arready(MyRiscv_0_M01_AXI_ARREADY),
        .S02_AXI_arsize(MyRiscv_0_M01_AXI_ARSIZE),
        .S02_AXI_aruser(MyRiscv_0_M01_AXI_ARUSER),
        .S02_AXI_arvalid(MyRiscv_0_M01_AXI_ARVALID),
        .S02_AXI_awaddr(MyRiscv_0_M01_AXI_AWADDR),
        .S02_AXI_awburst(MyRiscv_0_M01_AXI_AWBURST),
        .S02_AXI_awcache(MyRiscv_0_M01_AXI_AWCACHE),
        .S02_AXI_awid(MyRiscv_0_M01_AXI_AWID),
        .S02_AXI_awlen(MyRiscv_0_M01_AXI_AWLEN),
        .S02_AXI_awlock(MyRiscv_0_M01_AXI_AWLOCK),
        .S02_AXI_awprot(MyRiscv_0_M01_AXI_AWPROT),
        .S02_AXI_awqos(MyRiscv_0_M01_AXI_AWQOS),
        .S02_AXI_awready(MyRiscv_0_M01_AXI_AWREADY),
        .S02_AXI_awsize(MyRiscv_0_M01_AXI_AWSIZE),
        .S02_AXI_awuser(MyRiscv_0_M01_AXI_AWUSER),
        .S02_AXI_awvalid(MyRiscv_0_M01_AXI_AWVALID),
        .S02_AXI_bid(MyRiscv_0_M01_AXI_BID),
        .S02_AXI_bready(MyRiscv_0_M01_AXI_BREADY),
        .S02_AXI_bresp(MyRiscv_0_M01_AXI_BRESP),
        .S02_AXI_buser(MyRiscv_0_M01_AXI_BUSER),
        .S02_AXI_bvalid(MyRiscv_0_M01_AXI_BVALID),
        .S02_AXI_rdata(MyRiscv_0_M01_AXI_RDATA),
        .S02_AXI_rid(MyRiscv_0_M01_AXI_RID),
        .S02_AXI_rlast(MyRiscv_0_M01_AXI_RLAST),
        .S02_AXI_rready(MyRiscv_0_M01_AXI_RREADY),
        .S02_AXI_rresp(MyRiscv_0_M01_AXI_RRESP),
        .S02_AXI_rvalid(MyRiscv_0_M01_AXI_RVALID),
        .S02_AXI_wdata(MyRiscv_0_M01_AXI_WDATA),
        .S02_AXI_wlast(MyRiscv_0_M01_AXI_WLAST),
        .S02_AXI_wready(MyRiscv_0_M01_AXI_WREADY),
        .S02_AXI_wstrb(MyRiscv_0_M01_AXI_WSTRB),
        .S02_AXI_wvalid(MyRiscv_0_M01_AXI_WVALID),
        .aclk(zynq_ultra_ps_e_0_pl_clk1),
        .aresetn(proc_sys_reset_5_peripheral_aresetn));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  design_1_zynq_ultra_ps_e_0_0 zynq_ultra_ps_e_0
       (.maxigp0_araddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR),
        .maxigp0_arburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST),
        .maxigp0_arcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE),
        .maxigp0_arid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID),
        .maxigp0_arlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN),
        .maxigp0_arlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK),
        .maxigp0_arprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT),
        .maxigp0_arqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS),
        .maxigp0_arready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY),
        .maxigp0_arsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE),
        .maxigp0_aruser(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARUSER),
        .maxigp0_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID),
        .maxigp0_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR),
        .maxigp0_awburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST),
        .maxigp0_awcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE),
        .maxigp0_awid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID),
        .maxigp0_awlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN),
        .maxigp0_awlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK),
        .maxigp0_awprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT),
        .maxigp0_awqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS),
        .maxigp0_awready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY),
        .maxigp0_awsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE),
        .maxigp0_awuser(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWUSER),
        .maxigp0_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID),
        .maxigp0_bid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID),
        .maxigp0_bready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY),
        .maxigp0_bresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP),
        .maxigp0_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID),
        .maxigp0_rdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA),
        .maxigp0_rid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID),
        .maxigp0_rlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST),
        .maxigp0_rready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY),
        .maxigp0_rresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP),
        .maxigp0_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID),
        .maxigp0_wdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA),
        .maxigp0_wlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST),
        .maxigp0_wready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY),
        .maxigp0_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB),
        .maxigp0_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID),
        .maxihpm0_fpd_aclk(zynq_ultra_ps_e_0_pl_clk1),
        .pl_clk0(zynq_ultra_ps_e_0_pl_clk0),
        .pl_clk1(zynq_ultra_ps_e_0_pl_clk1),
        .pl_ps_irq0(1'b0),
        .pl_resetn0(zynq_ultra_ps_e_0_pl_resetn0),
        .pl_resetn1(zynq_ultra_ps_e_0_pl_resetn1));
endmodule
