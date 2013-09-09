FLAGS = --ieee=synopsys --work=work -fexplicit

build:
	ghdl -a $(FLAGS) shifter_1bit.vhd
	ghdl -a $(FLAGS) shifter_1bit_tb.vhd
	ghdl -e $(FLAGS) shifter_1bit_tb
#	ghdl -a $(FLAGS) shifter.vhd
#	ghdl -a $(FLAGS) shifter_tb.vhd
#	ghdl -e $(FLAGS) shifter_tb


run: build
	ghdl -r $(FLAGS) shifter_1bit_tb --vcd=trace.vcd
#	ghdl -r $(FLAGS) shifter_tb --vcd=trace.vcd

clean:
	rm -rf *.o e~* work* shifter_1bit_tb shifter_tb *.vcd *~
