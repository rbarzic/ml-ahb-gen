# A chisel generator for hasti multi-layer interconnect
import AutoVivification as av
import json
import argparse

# The template for the main file
tpl_file="""
package Ahbmli

import Chisel._
import cde.{{Parameters, Field}}
import junctions._

class Ahbmli  extends Module {{
  implicit val p = Parameters.empty
    val ahbmli_params = p.alter(
    (pname,site,here,up) => pname match {{

      case HastiKey("TL") =>
        HastiParameters(
          addrBits = 32,
          dataBits = 32)

      case HastiId => "TL"
  }}
  )


  val io = new Bundle {{
{master_ios}

{slave_ios}
  }}

{decoding_fns}

{xbar_inst}

{master_connect}
{slave_connect}

}}


class AhbmliTests(c: Ahbmli) extends Tester(c) {{
  step(1)
}}

object Ahbmli {{
  def main(args: Array[String]): Unit = {{
    chiselMain(Array("--backend", "v"), () => Module(new Ahbmli()))
  }}
}}
"""
# smaller templates for code snippets (see string.format in Python doc if you are not familiar
# with the format)
tpl_master_ios = "    val {m_name} = (new HastiMasterIO()(ahbmli_params) ).flip\n"
tpl_slave_ios = "    val {s_name} = (new HastiSlaveIO()(ahbmli_params) ).flip\n"

tpl_master_connect = "    xbar.io.masters ({m_idx}) <> io.{m_name}\n"
tpl_slave_connect =  "    io.{s_name} <> xbar.io.slaves({s_idx})\n"

tpl_decoding_fns = "    val {fn_name} = (addr: UInt) => addr ({addr_msb},{addr_lsb}) === UInt ({addr_val})\n"
tpl_xbar_inst = "    val xbar = Module(new HastiXbar({nb_masters}, Seq({fn_list}))(ahbmli_params))"




#ml_ahb = av.AutoVivification()
#
#
#ml_ahb['masters'] = ['jtag','dmem','imem']
#
#ml_ahb['slaves']['codemem']['address_range'] = [31,28]
#ml_ahb['slaves']['codemem']['address_value'] = 0
#
#ml_ahb['slaves']['datamem']['address_range'] = [31,28]
#ml_ahb['slaves']['datamem']['address_value'] = 2
#
#
#
#print(json.dumps (ml_ahb,
#      sort_keys=True,
#      indent=4, separators=(',', ': ')))
#


def master_connect(spec):
    txt = ""
    for i,m in enumerate(spec['masters']):
        d = dict()
        d['m_name'] = m
        d['m_idx']  = i
        txt += tpl_master_connect.format(**d)
    return txt

def slave_connect(spec):
    txt = ""
    for i,s in enumerate(spec['slaves'].keys()):
        d = dict()
        d['s_name'] = s
        d['s_idx']  = i
        txt += tpl_slave_connect.format(**d)
    return txt



def decoding_fns(spec):
    txt = ""
    for i,s in enumerate(spec['slaves'].keys()):
        d = dict()
        d['fn_name'] = s + "_afn"
        d['addr_msb'],d['addr_lsb']  = spec['slaves'][s]['address_range']
        d['addr_val']= spec['slaves'][s]['address_value']
        txt += tpl_decoding_fns.format(**d)
    return txt


def master_ios(spec):
    txt = ""
    for m in spec['masters']:
        d = dict()
        d['m_name'] = m
        txt += tpl_master_ios.format(**d)
    return txt

def slave_ios(spec):
    txt = ""
    for s in spec['slaves'].keys():
        d = dict()
        d['s_name'] = s
        txt += tpl_slave_ios.format(**d)
    return txt


def xbar_inst(spec):
    txt = ""
    d = dict()
    d['fn_list']= ','.join([s+"_afn" for s in spec['slaves'].keys()])
    d['nb_masters'] = len(spec['masters'])
    txt += tpl_xbar_inst.format(**d)
    return txt


def get_args():
    """
    Get command line arguments
    """

    parser = argparse.ArgumentParser(description="""
    A Chisel generator for HASTI (AHB multilayer interconnect)
    """)

    parser.add_argument('--json', action='store', dest='json',
                        help='JSON file for the configuartion of the interconnect')

    parser.add_argument('--outdir', action='store', dest='outdir',
                        help='Directory where to store the chisel file')

    parser.add_argument('--version', action='version', version='%(prog)s 0.1')
    return parser.parse_args()




if __name__ == '__main__':

    args = get_args()
    ml_ahb = None
    with open(args.json) as f:
        print "-I- Reading JSON file " + args.json
        ml_ahb = json.load(f)

    d=dict()
    d['master_connect'] = master_connect(ml_ahb)
    d['slave_connect']  = slave_connect(ml_ahb)
    d['decoding_fns']   = decoding_fns(ml_ahb)
    d['xbar_inst']      = xbar_inst(ml_ahb)
    d['master_ios']      = master_ios(ml_ahb)
    d['slave_ios']      = slave_ios(ml_ahb)
    txt = tpl_file.format(**d)

    outfile_name = args.outdir + "/Ahbmli.scala"
    with open(outfile_name,'w') as f:
        f.write(txt)
