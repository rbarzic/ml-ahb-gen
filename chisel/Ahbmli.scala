
package Ahbmli

import Chisel._
import cde.{Parameters, Field}
import junctions._

class Ahbmli  extends Module {
  implicit val p = Parameters.empty
  val io = new Bundle {
    val dside = new HastiMasterIO().flip
    val iside = new HastiMasterIO().flip


    val periph = new HastiSlaveIO().flip
    val tcm0 = new HastiSlaveIO().flip
    val tcm1 = new HastiSlaveIO().flip

  }

    val periph_afn = (addr: UInt) => addr (31,28) === UInt (15)
    val tcm0_afn = (addr: UInt) => addr (31,28) === UInt (0)
    val tcm1_afn = (addr: UInt) => addr (31,28) === UInt (2)


    val xbar = Module(new HastiXbar(2, Seq(periph_afn,tcm0_afn,tcm1_afn)))

    xbar.io.masters (0) <> io.dside
    xbar.io.masters (1) <> io.iside

    io.periph <> xbar.io.slaves(0)
    io.tcm0 <> xbar.io.slaves(1)
    io.tcm1 <> xbar.io.slaves(2)


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
