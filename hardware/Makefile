FLAGS = --ieee=synopsys --work=work -fexplicit

# All sources, only dependecies to sources left in the list allowed
SOURCES = src/mips_constant_pkg.vhd src/pipeline_types.vhd src/asserts.vhd src/full_adder.vhd \
src/adder.vhd src/control_unit.vhd src/alu_control.vhd src/alu_1bit.vhd src/alu.vhd \
src/sign_extend.vhd \
$(wildcard src/hazard/*vhd) \
$(wildcard src/stages/*.vhd) $(wildcard src/registers/*.vhd) $(wildcard src/hazards/*vhd) \
src/processor.vhd \
src/memory.vhd src/com.vhd src/register_file.vhd src/toplevel.vhd

# Test benches in order of execution
# TESTS = $(wildcard tests/hazard/*vhd) $(wildcard tests/*vhd) $(wildcard tests/stages/*vhd)
# TESTS = $(wildcard tests/hazard/*vhd) tests/stages/stage_id_tb.vhd
TESTS = $(wildcard tests/*vhd) $(wildcard tests/stages/*vhd) $(wildcard tests/hazards/*.vhd)

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
	ghdl --elab-run $(FLAGS) $(notdir $@) --stop-time=20000ns --vcd=$(notdir $@_trace.vcd)
	#gtkwave $(notdir $@_trace.vcd)

# Build all objects
build: $(OBJECTS)

# Run all tests
tests: $(TEST_BINARIES)

clean:
	rm -rf *.o e~* work* *.vcd *~ $(notdir $(BINARIES))
