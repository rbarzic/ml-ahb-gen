
package Ahbmli

import Chisel._
import cde.{Parameters, Field}
import junctions._

class Ahbmli  extends Module {
  implicit val p = Parameters.empty
  val io = new Bundle {
    val jtag = new HastiMasterIO().flip
    val dmem = new HastiMasterIO().flip
    val imem = new HastiMasterIO().flip


    val datamem = new HastiSlaveIO().flip
    val codemem = new HastiSlaveIO().flip

  }

    val datamem_afn = (addr: UInt) => addr (31,28) === UInt (2)
    val codemem_afn = (addr: UInt) => addr (31,28) === UInt (0)


    val xbar = Module(new HastiXbar(3, Seq(datamem_afn,codemem_afn)))

    xbar.io.masters (0) <> io.jtag
    xbar.io.masters (1) <> io.dmem
    xbar.io.masters (2) <> io.imem

    io.datamem <> xbar.io.slaves(0)
    io.codemem <> xbar.io.slaves(1)


}


class AhbmliTests(c: Ahbmli) extends Tester(c) {
  step(1)
}

object Ahbmli {
  def main(args: Array[String]): Unit = {
    val tutArgs = args.slice(1, args.length)
    chiselMainTest(tutArgs, () => Module(new Ahbmli())) {
      c => new AhbmliTests(c) }
  }
}
