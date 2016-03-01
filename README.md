[![Build Status](https://travis-ci.org/rbarzic/ml-ahb-gen.svg?branch=master)](https://travis-ci.org/rbarzic/ml-ahb-gen)

# ml-ahb-gen
A Verilog AMBA AHB Multilayer interconnect generator

Based on the Hasti multilayer interconnect (https://github.com/ucb-bar/junctions) (written in Chisel).
Using JSON as the input format (see example.json)

Note : you must have sbt in your path.

Usage :

```bash
make JSON=<path to your JSON file>
```


Resulting Verilog file is  chisel/Ahbmli.v
