package vexriscv.demo
import vexriscv.plugin._
import vexriscv.ip.{DataCacheConfig, InstructionCacheConfig}
import vexriscv.{plugin, VexRiscv, VexRiscvConfig}
import spinal.core._
import spinal.lib.bus.amba4.axi.Axi4ReadOnly
import vexriscv.ip.fpu.FpuParameter

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi.Axi4ReadOnly
import spinal.lib.bus.avalon.AvalonMM
import spinal.lib.com.jtag.Jtag
import spinal.lib.eda.altera.{InterruptReceiverTag, QSysify, ResetEmitterTag}
import vexriscv.ip.{DataCacheConfig, InstructionCacheConfig}
import vexriscv.plugin._
import vexriscv.{VexRiscv, VexRiscvConfig, plugin}
/**
* Created by spinalvm on 15.06.17.
*/
// object GenFullNoMmuNoCache extends App{
// object GenSignate extends App{
object GenSignate{
    def main(args: Array[String]) {
        val report = SpinalVerilog{
            val cpuConfig = VexRiscvConfig(
                plugins = List(
                    new IBusCachedPlugin(
                        resetVector = 0xA0000000l,
                        prediction = DYNAMIC_TARGET,
                        config = InstructionCacheConfig(
                            cacheSize = 4096,
                            bytePerLine = 32,
                            wayCount = 1,
                            addressWidth = 32,
                            cpuDataWidth = 32,
                            memDataWidth = 32,
                            catchIllegalAccess = false,
                            catchAccessFault = false,
                            asyncTagMemory = false,
                            twoCycleRam = true,
                            twoCycleCache = true
                        )
                    ),
                    new DBusCachedPlugin(
                            config = new DataCacheConfig(
                            cacheSize        = 4096,
                            bytePerLine      = 32,
                            wayCount         = 1,
                            addressWidth     = 32,
                            cpuDataWidth     = 32,
                            memDataWidth     = 32,
                            catchAccessError = false,
                            catchIllegal     = false,
                            catchUnaligned   = false
                        )
                    ),
                    new PmpPlugin(
                        regions = 16,
                        granularity = 32,
                        ioRange = _(31 downto 28) === 0xf
                    ),
                    new DecoderSimplePlugin(
                        catchIllegalInstruction = true
                    ),
                    new RegFilePlugin(
                        regFileReadyKind = plugin.SYNC,
                        zeroBoot = false
                    ),
                    new IntAluPlugin,
                    new SrcPlugin(
                        separatedAddSub = false,
                        executeInsertion = true
                    ),
                    new FullBarrelShifterPlugin,
                    new HazardSimplePlugin(
                        bypassExecute = true,
                        bypassMemory = true,
                        bypassWriteBack = true,
                        bypassWriteBackBuffer = true,
                        pessimisticUseSrc = false,
                        pessimisticWriteRegFile = false,
                        pessimisticAddressMatch = false
                    ),
                    new MulPlugin,
                    new DivPlugin,
                    new CsrPlugin(CsrPluginConfig.small),
                    //new DebugPlugin(ClockDomain.current.clone(reset =
                    // Bool().setName("debugReset"))),
                    new BranchPlugin(
                        earlyBranch = false,
                        catchAddressMisaligned = true
                    ),
                    new FpuPlugin(
                        externalFpu = false,
                        simHalt = false,
                        p = FpuParameter(withDouble = false)
                    ),
                    new YamlPlugin("cpu0.yaml")
                )
            )
            // SpinalVerilog(cpu())
            //CPU instanciation
            val cpu = new VexRiscv(cpuConfig)
            // val cpu = SpinalVerilog(cpu())
            //CPU modifications to be an Avalon one
            cpu.setDefinitionName("VexRiscvSignate")
            cpu.rework {
                var iBus : Axi4ReadOnly = null
                for (plugin <- cpuConfig.plugins) plugin match {
                    case plugin: IBusSimplePlugin => {
                    plugin.iBus.setAsDirectionLess() //Unset IO properties of iBus
                    iBus = master(plugin.iBus.toAxi4ReadOnly().toFullConfig())
                    // iBus = master(plugin.iBus.toAxi4ReadOnly())
                        .setName("iBusAxi")
                        .addTag(ClockDomainTag(ClockDomain.current)) //Specify a clock domain to the iBus (used by QSysify)
                    }
                    case plugin: IBusCachedPlugin => {
                    plugin.iBus.setAsDirectionLess() //Unset IO properties of iBus
                    iBus = master(plugin.iBus.toAxi4ReadOnly().toFullConfig())
                    // iBus = master(plugin.iBus.toAxi4ReadOnly())
                        .setName("iBusAxi")
                        .addTag(ClockDomainTag(ClockDomain.current)) //Specify a clock domain to the iBus (used by QSysify)
                    }
                    case plugin: DBusSimplePlugin => {
                    plugin.dBus.setAsDirectionLess()
                    master(plugin.dBus.toAxi4Shared().toAxi4().toFullConfig())
                    // master(plugin.dBus.toAxi4Shared().toAxi4())
                        .setName("dBusAxi")
                        .addTag(ClockDomainTag(ClockDomain.current))
                    }
                    case plugin: DBusCachedPlugin => {
                    plugin.dBus.setAsDirectionLess()
                    master(plugin.dBus.toAxi4Shared().toAxi4().toFullConfig())
                    // master(plugin.dBus.toAxi4Shared().toAxi4())
                        .setName("dBusAxi")
                        .addTag(ClockDomainTag(ClockDomain.current))
                    }
                    case plugin: DebugPlugin => plugin.debugClockDomain {
                    plugin.io.bus.setAsDirectionLess()
                    val jtag = slave(new Jtag())
                        .setName("jtag")
                    jtag <> plugin.io.bus.fromJtag()
                    plugin.io.resetOut
                        .addTag(ResetEmitterTag(plugin.debugClockDomain))
                        .parent = null //Avoid the io bundle to be interpreted as a QSys conduit
                    }
                    case _ =>
                }
                for (plugin <- cpuConfig.plugins) plugin match {
                    case plugin: CsrPlugin => {
                    plugin.externalInterrupt
                        .addTag(InterruptReceiverTag(iBus, ClockDomain.current))
                    plugin.timerInterrupt
                        .addTag(InterruptReceiverTag(iBus, ClockDomain.current))
                    }
                    case _ =>
                }
            }
            cpu
        }
    }
}