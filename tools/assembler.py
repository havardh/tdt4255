#!/usr/bin/python

import sys

registers = {
	'$0'    :  0,
	'$zero' :  0,
	'$1'    :  1,
	'$2'    :  2,
	'$3'    :  3,
	'$4'    :  4,
	'$5'    :  5,
	'$6'    :  6,
	'$7'    :  7,
	'$8'    :  8,
	'$9'    :  9,
	'$10'   : 10,
	'$11'   : 11,
	'$12'   : 12,
	'$13'   : 13,
	'$14'   : 14,
	'$15'   : 15,
	'$16'   : 16,
	'$17'   : 17,
	'$18'   : 18,
	'$19'   : 19,
	'$20'   : 20,
	'$21'   : 21,
	'$22'   : 22,
	'$23'   : 23,
	'$24'   : 24,
	'$25'   : 25,
	'$26'   : 26,
	'$27'   : 27,
	'$28'   : 28,
	'$29'   : 29,
	'$30'   : 30,
	'$31'   : 31,
}

# R-Type instructions, values are function numbers
r_type = {
	'add': 0b100000,
	'sub': 0b100010,
	'and': 0b100100,
	'or' : 0b100101,
	'slt': 0b101010,
	'jr' : 0b001000
}

j_type = {
	'j'  : 0b000010,
	'jal': 0b000011,
}

load_store = {
	'sw' : 0b101011,
	'lw' : 0b100011
}

def to_hex(value):
	value = int(value)
	if value >= 0:
		return "%0.4X" % value
	else:
		return "%0.4X" % (((abs(int(value)) ^ 0xffff) + 1) & 0xffff)

def translate_reg(name):
	if name in registers:
		return registers[name]
	else:
		print("Reference to unknown register "+name)
		exit(1)

def translate():
	line_no = 0
	mem_offset = 0
	for line in sys.stdin:
		line_no+=1
		line = line.lower().split("#")[0].strip()
		# Empty line
		if line == '':
			continue

		parts = line.replace(',', '').split(' ')

		# Translate all R-Type instructions
		if parts[0] in r_type and len(parts) == 4:
			code = translate_reg(parts[1]) << 11 | translate_reg(parts[2]) << 21 
			code |= translate_reg(parts[3]) << 16 | r_type[parts[0]]

		# JR r_type with only one operand
		elif parts[0] == 'jr' and len(parts) == 2:
			code = translate_reg(parts[1]) << 21 | r_type[parts[0]]

		# JType
		elif parts[0] in j_type:
			code = j_type[parts[0]] << 26 | int(parts[1])

		# Branch 
		elif parts[0] == 'beq' and len(parts) == 4:
			# Build upper 16 bits
			code = translate_reg(parts[1]) << (21-16) | translate_reg(parts[2]) <<  (16-16)
			code |= 0b000100 << (26-16)

			# Special case print, print code and lower bits
			print("0x%0.2X 0x%0.4X%s" % (mem_offset, code, to_hex(parts[3])))
			mem_offset += 1
			continue

		# LUI	
		elif parts[0] == 'lui' and len(parts) == 3:
			# Build upper 16 bits
			code = translate_reg(parts[1]) <<  (16-16) | 0b001111 << (26-16)

			# Special case print, print code and lower bits
			print("0x%0.2X 0x%0.4X%s" % (mem_offset, code, to_hex(parts[2])))
			mem_offset += 1
			continue

		# Load/store
		elif parts[0] in load_store and len(parts) == 3:
			target = parts[2].replace(')', '').split('(')
			code = translate_reg(parts[1]) <<  (16-16) | load_store[parts[0]] << (26-16)
			code |= translate_reg(target[1]) << (21-16)

			# Special case print, print code and lower bits
			print("0x%0.2X 0x%0.4X%s" % (mem_offset, code, to_hex(target[0])))
			mem_offset += 1
			continue

		else:
			print("Unrecognized opertaion '" + line + "' on line "+str(line_no))
			exit(1)


		print("0x%0.2X 0x%0.8X" % (mem_offset, code))
		mem_offset += 1


translate()