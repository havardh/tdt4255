FLAGS = --ieee=synopsys --work=work -fexplicit

# All sources, only dependecies to sources left in the list allowed

SOURCES = mips_constant_pkg.vhd asserts.vhd sign_extend.vhd control_unit.vhd full_adder.vhd adder.vhd alu_1bit.vhd alu.vhd register_file.vhd alu_control.vhd processor.vhd

# Test benches in order of execution
#TESTS = control_unit_tb.vhd alu_control.vhd processor_tb.vhd
TESTS = control_unit_tb.vhd alu_control_tb.vhd processor_tb.vhd

OBJECTS = $(SOURCES:.vhd=.o) $(TESTS:.vhd=.o)
TEST_BINARIES = $(TESTS:.vhd=)
BINARIES = $(SOURCES:.vhd=) $(TESTS:.vhd=)

all: $(OBJECTS)

# Keep intermediatefilestouch
.PHONY: build

# Generic add target
%.o: %.vhd
	ghdl -a $(FLAGS) $<

# Generic elaborate and run target for test benches
$(TEST_BINARIES): $(OBJECTS)
	ghdl --elab-run $(FLAGS) $@ --stop-time=1000ns --vcd=$@_trace.vcd
	#gtkwave $@_trace.vcd

# Build all objects
build: $(OBJECTS)

# Run all tests
tests: $(TEST_BINARIES)

clean:
	rm -rf *.o e~* work* *.vcd *~ $(OBJECTS) $(BINARIES)
