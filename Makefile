JSON ?= example.json

gen_chisel:
	python ml_ahb_gen.py --json=$(JSON)  --outdir=chisel

gen_v:
	cd chisel && sbt "run --genHarness --backend v"

all:  gen_chisel gen_v


.PHONY: gen_chisel gen_v
