#!/bin/sh
set -e
riscv-none-elf-objcopy -O verilog --verilog-data-width=4 \
  --change-addresses -0x80000000 "$1" "$2"