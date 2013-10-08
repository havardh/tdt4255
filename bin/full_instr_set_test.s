# 
# This test program utilizes all of our implemented instructions, both required
# and the additional, and produces a deterministic data pattern in data memory.
#

#.memory_in_start:
#    0x0 0x1    # Constant used during calculations
#    0x1 0x10   # First iteration count
#    0x2 0x20   # Second interation count
#    0x3 11100b # First pattern used in AND and OR tests
#    0x4 10101b # Second test pattern
#.memory_in_end:

#.memory_out_start:
#    ## Initial content should remain unchanged
#    0x0 0x1    
#    0x1 0x10   
#    0x2 0x20   
#    0x3 11100b 
#    0x4 10101b 

#    0xa 11101b # OR result
#    0xb 10100b # AND result
#    0xc 0x11   # 0x10 + 1
#    0xd 0x21   # 0x20 + 1
#.memory_out_end:


lw $1, 0($0) # Load constant one into memory
lw $1, 0($0) # Load constant one into memory
j 7          # After function
sw $1, 5($0) # Store 1 to 0x5, this will indicate that the jump failed

# Add one function, $2 is input $3 is output, expects $1 to be 1
add $3, $2, $1
jr $31         # Return to caller
sw $1, 6($0)   # Write 1 to memory location 6 if jr fail

# Begin test code
lw $2, 3($0)
lw $3, 4($0)  # Load test patterns

or $4, $2, $3
sw $4, 10($0)
and $4, $2, $3
sw $4, 11($0)

# Test JAL
lw $2, 1($0)  # Load 
jal 4
sw $3, 12($0) # Store 10th fib number to 0xc

lw $2, 2($0)
jal 4
sw $3, 13($0) # Store 20th fib number to 0xd

beq $0, $0, -1 # Halt execution
sw $1, 6($0)   # Store 1 to 0x6, this will indicate that the beq failed

