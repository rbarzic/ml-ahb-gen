JSON ?= nanorv32_ahbmli.json

gen_chisel:
	python ml_ahb_gen.py --json=$(JSON)  --outdir=chisel

gen_v:
	cd chisel && sbt "run --genHarness --backend v"
