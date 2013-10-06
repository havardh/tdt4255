# 
# This test program utilizes all of our implemented instructions, both required
# and the additional, and produces a deterministic data pattern in data memory.
#

.memory_in_start:
    0x0 0x1    # Constant used during calculations
    0x1 0x10   # First iteration count
    0x2 0x20   # Second interation count
    0x3 11100b # First pattern used in AND and OR tests
    0x4 10101b # Second test pattern
.memory_in_end:

.memory_out_start:
    ## Initial content should remain unchanged
    0x0 0x1    
    0x1 0x10   
    0x2 0x20   
    0x3 11100b 
    0x4 10101b 

    0xa 11101b # OR result
    0xb 10100b # AND result
    0xc 0x37   # 10th fib number 55
    0xd 0x1A6D # 20th fib number 6765
.memory_out_end:


lw $1, 0($0) # Load constant one into memory
j -AFTER FUNCTION
sw $1, 5($0) # Store 1 to 0x5, this will indicate that the jump failed

# Begin fib function, assumes that 1 is $1 and the number of iterations are in $2
fibonacci:
$4 = 0 # 0th fib number
$5 = 1

$6 = $4 + $5
$4 = $5
$5 = $6
$2 = $2 - 1
$6 = $2 < $1   # Loop untill $6 == 0
beq $6, $0, -6 # Jump back to $6 = $4 + $5
$2 = $4        # Store result in $2
jr $31         # Return to caller

# Begin test code
lw $2, 3($0)
lw $3, 4($0)  # Load test patterns

or $4, $2, $3
sw $4, 10($0)
and $4, $2, $3
sw $4, 11($0)

# Calculate fibb numbers
lw $2, 1($0)
jal FIBONACCI FUNCTION
sw $2, 12($0) # Store 10th fib number to 0xc

lw $2, 2($0)
jal FIBONACCI FUNCTION
sw $2, 13($0) # Store 20th fib number to 0xd

beq $0, $0, -1 # Halt execution
sw $1, 6($0)   # Store 1 to 0x6, this will indicate that the beq failed

