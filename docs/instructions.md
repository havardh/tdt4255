Instruction set overview:
========================

R-TYPE: 
======
| 6b op | 5b r-dest | 5b r-src1 | 5b r-src2 | 5b shamt | 6 b func |


ADD    000000 xxxxx xxxxx xxxxx xxxxx 100000
SUB    000000 xxxxx xxxxx xxxxx xxxxx 100010
SLT    000000 xxxxx xxxxx xxxxx xxxxx 101010
AND    000000 xxxxx xxxxx xxxxx xxxxx 100100
OR     000000 xxxxx xxxxx xxxxx xxxxx 100101

I-TYPE:
======
| 6b op | 5b r-dest | 5b r-src | 16b imm |
LDI    ?????? xxxxx ----- ????????????????  *
LOAD
STORE

J-TYPE:
=======
| 6b op | 26b intermediate |
J      000010 xxxxxxxxxxxxxxxxxxxxxxxxxx
BEZ    ?????? xxxxxxxxxxxxxxxxxxxxxxxxxx  *


* Not a part of the standard MIPS instruction set?
