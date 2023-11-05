.globl _start

# Data constants
.org 0x00000400
.data
bcd_number: .word   0x08010902


# Code segment
.org 0x00000200 
.text
_start:
        jal    main             # Call main
_end:
        ebreak                  # Software breakpoint
        j       _end


# ---------------------------------------------------------------
# main program
# ---------------------------------------------------------------
# Purpose: Prepares input parameters and calls the subroutine(s)
# ---------------------------------------------------------------

main:
        addi    a1, zero, bcd_number    # Prepare input argument
        jal     bcd2bin                 # Call bcd2bin subroutine
        ret


# ---------------------------------------------------------------
# bcd2bin subroutine
# ---------------------------------------------------------------
# Purpose: Convert a 4-byte BCD number (1 digit per byte)
#          to binary format
# ---------------------------------------------------------------
# INPUT:
#   a1 - Address of the 32-bit BCD number
# OUTPUT:
#   a0 - Converted binary value
# MODIFIES:
#   a0, a2, a3, a4, a5, t3, t4, t5
# ---------------------------------------------------------------

bcd2bin:
        addi    t3, zero, 10
        addi    t4, zero, 100
        addi    t5, zero, 1000

        lb      a2, 0(a1)
        mv      a0, a2

        lb      a3, 1(a1)
        mul     a3, a3, t3
        add     a0, a0, a3

        lb      a4, 2(a1)
        mul     a4, a4, t4
        add     a0, a0, a4

        lb      a5, 3(a1)
        mul     a5, a5, t5
        add     a0, a0, a5
        
        ret


# if whole source compile is OK the switch to core tab
#pragma qtrvsim tab core
