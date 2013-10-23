#!/bin/bash

find hardware/src -iname '*vhd*' -exec cp -v \{\} system/system/pcores/mips_pipelined_v1_00_a/hdl/vhdl/ \;
cp -rv hardware/tests system/system/pcores/mips_pipelined_v1_00_a/hdl/vhdl

# Remove implementation file if it exists so the processor will be recompiled
rm -vf system/system/implementation/mips_pipelined_0_wrapper*

echo "Successfully copied all files from hardware/ to pcores/"
