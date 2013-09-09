FLAGS = --ieee=synopsys --work=work -fexplicit

build:
	ghdl -a $(FLAGS) shifter.vhd
	ghdl -a $(FLAGS) shifter_tb.vhd
	ghdl -e $(FLAGS) shifter_tb

run: build
	ghdl -r $(FLAGS) shifter_tb --vcd=trace.vcd

clean:
	rm -rf *.o e~* work* shifter_tb *.vcd *~
