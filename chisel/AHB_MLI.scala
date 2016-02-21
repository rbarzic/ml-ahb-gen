package AHB_MLI

import Chisel._
import cde.{Parameters, Field}
import junctions._

//class AHB_MLI(topParams: Parameters)  extends Module {
//  implicit val p = topParams
//  val io = new Bundle {
//    val jtag = new HastiMasterIO().flip
//    val imem = new HastiMasterIO().flip
//    val dmem = new HastiMasterIO().flip
//
//    val datamem = new HastiSlaveIO().flip
//    val codemem = new HastiSlaveIO().flip
//
//  }
//
//
//
//
//  val xbar = Module(new HastiXbar(3, Seq(datamem_afn, codemem_afn)))
//  val datamem_afn = (addr: UInt) => addr(31,28) === UInt(0)
//  val codemem_afn = (addr: UInt) => addr(31, 28) === UInt(2)
//
//  xbar.io.masters(0) <> io.jtag
//  xbar.io.masters(1) <> io.dmem
//  xbar.io.masters(2) <> io.imem
//
//  io.codemem <> xbar.io.slaves(0)
//  io.datamem <> xbar.io.slaves(1)
//
//
//}
//

class AHB_MLI extends Module {
  val io = new Bundle {
    val out = UInt(OUTPUT, 8)
  }
  io.out := UInt(42)
}


object AHB_MLI {
  def main(args: Array[String]): Unit = {
    val a = Module(new AHB_MLI)
  }
}
