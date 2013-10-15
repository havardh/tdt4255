FLAGS = --ieee=synopsys --work=work -fexplicit

# All sources, only dependecies to sources left in the list allowed

SOURCES = mips_constant_pkg.vhd pipeline_types.vhd asserts.vhd full_adder.vhd adder.vhd stage_pc_next.vhd

# Test benches in order of execution
TESTS = stage_pc_next_tb.vhd

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
