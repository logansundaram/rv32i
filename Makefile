.PHONY: lint


lint:
	verilator --lint-only -Wall rtl/rv32i_pkg.sv $(filter-out rtl/rv32i_pkg.sv, $(wildcard rtl/*.sv)) --top-module rv32i_core