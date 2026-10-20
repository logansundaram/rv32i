.PHONY: lint


lint:
	verilator --lint-only -Wall rtl/rv32i_core