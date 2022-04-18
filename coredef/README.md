# Install sbt
cf. [Ubuntu and other Debian-based distributions](https://www.scala-sbt.org/1.x/docs/Installing-sbt-on-Linux.html#Ubuntu+and+other+Debian-based+distributions)

```sh
sudo apt-get update
sudo apt-get install apt-transport-https curl gnupg -yqq
echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo -H gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import
sudo chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg
sudo apt-get update
sudo apt-get install sbt
```

# Core Generation
```sh
git clone https://github.com/lp6m/VexRiscv_Ultra96.git
cd VexRiscv_Ultra96
git clone https://github.com/SpinalHDL/VexRiscv.git #e1620c68b2bfcff7ad1bc8ce665cf4ce29452141
cp coredef/GenSignate.scala ./VexRiscv/src/main/scala/vexriscv/demo/
cd VexRiscv
sbt "runMain vexriscv.demo.GenSignate"
```
You will obtain `VexRiscv/VexRiscvSignate.v`.


# VexRiscv rv32imfac core definition
Core definition in this project is based on the [reference RISC-V core definition](https://drive.google.com/drive/folders/1Na9IFJOZZJ40ytUySsXcclWIbijvF68w) of [SIGNATE 5th AI Edge Contest](https://signate.jp/competitions/537).  
Here we describe the difference from the reference core definition.  

  
```diff
--- a/src/main/scala/vexriscv/demo/GenSignate.scala
+++ b/src/main/scala/vexriscv/demo/GenSignate.scala
@@ -3,6 +3,7 @@ import vexriscv.plugin._
 import vexriscv.ip.{DataCacheConfig, InstructionCacheConfig}
 import vexriscv.{plugin, VexRiscv, VexRiscvConfig}
 import spinal.core._
+import vexriscv.ip.fpu.FpuParameter
 /**
 * Created by spinalvm on 15.06.17.
 */
@@ -11,17 +12,40 @@ object GenSignate extends App{
     def cpu() = new VexRiscv(
         config = VexRiscvConfig(
             plugins = List(
-                new IBusSimplePlugin(
+                new IBusCachedPlugin(
                     resetVector = 0xA0000000l,
-                    cmdForkOnSecondStage = false,
-                    cmdForkPersistence = false,
-                    prediction = DYNAMIC_TARGET, //STATIC,
-                    catchAccessFault = false,
-                    compressedGen = false
+                    prediction = STATIC,
+                    config = InstructionCacheConfig(
+                        cacheSize = 4096,
+                        bytePerLine = 32,
+                        wayCount = 1,
+                        addressWidth = 32,
+                        cpuDataWidth = 32,
+                        memDataWidth = 32,
+                        catchIllegalAccess = true,
+                        catchAccessFault = true,
+                        asyncTagMemory = false,
+                        twoCycleRam = true,
+                        twoCycleCache = true
+                    )
                 ),
-                new DBusSimplePlugin(
-                    catchAddressMisaligned = false,
-                    catchAccessFault = false
+                new DBusCachedPlugin(
+                        config = new DataCacheConfig(
+                        cacheSize        = 4096,
+                        bytePerLine      = 32,
+                        wayCount         = 1,
+                        addressWidth     = 32,
+                        cpuDataWidth     = 32,
+                        memDataWidth     = 32,
+                        catchAccessError = true,
+                        catchIllegal     = true,
+                        catchUnaligned   = true
+                    )
+                ),
+                new PmpPlugin(
+                    regions = 16,
+                    granularity = 32,
+                    ioRange = _(31 downto 28) === 0xf
                 ),
                 new DecoderSimplePlugin(
                     catchIllegalInstruction = true
@@ -54,6 +78,11 @@ object GenSignate extends App{
                     earlyBranch = false,
                     catchAddressMisaligned = true
                 ),
+                new FpuPlugin(
+                    externalFpu = false,
+                    simHalt = false,
+                    p = FpuParameter(withDouble = false)
+                ),
                 new YamlPlugin("cpu0.yaml")
             )
         )
```
The core architecture of the reference design is `rv32im`. In this project we add `FPUplugin` and changes the architecture to `rv32imfac`.  
According to the VexRiscv official document,  
  
>Can be integrated inside or outside the CPU via the FpuPlugin
Currently only compatible with the DBusCachedPlugin for load and store

so we replace `IBusSimplePlugin` and `DBusSimplePlugin` with `IBusCachedPlugin` and `DBusCachedPlugin`.  

The reference design used their own module to bridge RISC-V Bus to AXI port, but the bridge module cannot be used because the number/kind of pins of `IBus` and `DBus` are changed by replacing `SimplePlugin` with `CachedPlugin`.  

Instead of using the bridge module they created, we used the ability to AXI-ize the IBus and DBus that exist in VexRiscv itself.  

```scala
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
```