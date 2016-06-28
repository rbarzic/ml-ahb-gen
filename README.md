[![Build Status](https://travis-ci.org/rbarzic/ml-ahb-gen.svg?branch=master)](https://travis-ci.org/rbarzic/ml-ahb-gen)

# ml-ahb-gen
A Verilog AMBA AHB Multilayer interconnect generator

Based on the Hasti multilayer interconnect (https://github.com/ucb-bar/junctions) (written in Chisel).
Using JSON as the input format (see example.json)

Note : you must have sbt in your path.
## Checkout 

```bash
git clone  --recursive   https://github.com/rbarzic/ml-ahb-gen.git
```

## Usage :

```bash
make all JSON=<path to your JSON file>
```
(just use ```make all``` to try out)

Resulting Verilog file is  chisel/Ahbmli.v
