FLAGS = --ieee=synopsys --work=work -fexplicit

# All sources, only dependecies to sources left in the list allowed
SOURCES = src/mips_constant_pkg.vhd src/pipeline_types.vhd src/asserts.vhd src/full_adder.vhd src/adder.vhd \
src/control_unit.vhd $(wildcard src/stages/*.vhd) $(wildcard src/registers/*.vhd) \
src/processor.vhd

# Test benches in order of execution
TESTS = $(wildcard tests/*vhd)

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
	ghdl --elab-run $(FLAGS) $(notdir $@) --stop-time=1000ns --vcd=$(notdir $@_trace.vcd)
	#gtkwave $@_trace.vcd

# Build all objects
build: $(OBJECTS)

# Run all tests
tests: $(TEST_BINARIES)

clean:
	rm -rf *.o e~* work* *.vcd *~ $(notdir $(BINARIES))
