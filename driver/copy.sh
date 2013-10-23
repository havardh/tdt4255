#!/bin/bash

find hardware/src -iname '*vhd*' -exec cp -v \{\} system/system/pcores/mips_pipelined_v1_00_a/hdl/vhdl/ \;
cp -rv hardware/tests system/system/pcores/mips_pipelined_v1_00_a/hdl/vhdl

echo "Successfully copied all files from hardware/ to pcores/"