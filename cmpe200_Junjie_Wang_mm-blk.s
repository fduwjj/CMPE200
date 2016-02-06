# FP program
        .data
matrix_a:
        .word   1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12
        .word  13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24
        .word  25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36
        .word  37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48
        .word  49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60
        .word  61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72
        .word  73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84
        .word  85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96
        .word  97, 98, 99,100,101,102,103,104,105,106,107,108
        .word 109,110,111,112,113,114,115,116,117,118,119,120
        .word 121,122,123,124,125,126,127,128,129,130,131,132
        .word 133,134,135,136,137,138,139,140,141,142,143,144

matrix_b:
        .word 133,134,135,136,137,138,139,140,141,142,143,144
        .word 121,122,123,124,125,126,127,128,129,130,131,132
        .word 109,110,111,112,113,114,115,116,117,118,119,120
        .word  97, 98, 99,100,101,102,103,104,105,106,107,108
        .word  85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96
        .word  73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84
        .word  61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72
        .word  49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60
        .word  37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48
        .word  25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36
        .word  13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24
        .word   1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12

matrix_c:
        .word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        .word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        .word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        .word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        .word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        .word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        .word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        .word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        .word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        .word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        .word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        .word   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0

bs:     .word 4
n:      .word 12

nline:  .asciiz "\n"                #Define new line string
sp: .asciiz " "
msga: .asciiz "Matrix A is: \n"
msgb: .asciiz "Matrix B is: \n"
msgc: .asciiz "Matrix C=A*B is: \n"

        .text
        .globl main
main:

        la  $s0, bs 
        lw  $s0, 0($s0)
        la  $s1, n
        lw  $s1, 0($s1)
        la  $s2, matrix_a
        la  $s3, matrix_b
        la  $s4, matrix_c

        la  $a0, msga
        la  $a1, matrix_a
        jal PRINT_MAT 
        la  $a0, msgb
        la  $a1, matrix_b
        jal PRINT_MAT 

# Your CODE HERE
        addi $t1, $zero, 0  # t1 is i, inital = 0
        sll $s5, $s1, 2     # s5 is 4 * n
        sll $s6, $s0, 2     # s6 is 4 * b
        sub $s7, $s5, $s6   # s7 is 4 * (n - b)
        mul $t8, $s5, $s0   # t8 is 4 * (n * b)
        subi $t9, $t8, 4    # t9 is 4 * (n * b) - 4
        sub $t0, $t8, $s6   # t0 is 4 * (n * b) - 4 * b
        sub $v0, $t8, $s5   # v0 is 4 * (n * b) - 4 * n
        mul $v1, $s5, $s1   # Get 4 * n * n
        sub $v1, $v1, $s6   # v1 is 4 * n * n - 4 * b
loop1:
        addi $t2, $zero, 0  # t2 is j, initial = 0
loop2: 
        addi $t3, $zero, 0  # t3 is k, initial = 0    
loop3:
        addi $t4, $zero, 0  # t4 is ii, b times of iteration       
loop4:
        addi $t5, $zero, 0  # t5 is jj, b times of iteration
loop5:
        addi $t6, $zero, 0  # t6 is kk, set kk = 0
        lw $a2, 0($s4)      # Load the c[ii,jj]
loop6:
        lw $a0, 0($s2)      # Get a[ii,kk]
        lw $a1, 0($s3)      # Get b[kk,jj]
        addi $s2, $s2, 4    # Move Forward by one item
        add $s3, $s3, $s5   # Move Forward by one item (new row)
        mul $a0, $a0, $a1   # Get a[ii,kk] * b[kk,jj]
        add $a2, $a2, $a0   # Add to the temp value
        addi $t6, $t6, 1    # Increment loop counter (kk) by 1
        blt $t6, $s0, loop6 # If kk less than b, continue the loop6

        sw  $a2, 0($s4)     # Store value to c[ii,jj]

        sub $s2, $s2, $s6   # Return the start of the row in matrix a
        sub $s3, $s3, $t9   # Move to the next column of one row block of b
        addi $s4, $s4, 4    # Move Forward by one item in the row of matrix c
        addi $t5, $t5, 1    # Increment loop counter (jj) by 1
        blt $t5, $s0, loop5 # If jj less than b, continue the loop5

        add $s2, $s2, $s5   # Get to the next row of matrix a
        sub $s3, $s3, $s6   # Move back to the original position of b
        add $s4, $s4, $s7   # Get to the next row of matrix c by add 4 * (n - b)
        addi $t4, $t4, 1    # Increment loop counter (ii) by 1
        blt $t4, $s0, loop4 # If ii less than b, continue the loop4

        sub $s2, $s2, $t0   # Move to the next column block for the same row of a
        add $s3, $s3, $t8   # Move to the next row block for the same column in b
        sub $s4, $s4, $t8   # Move back to the original position of c        
        add $t3, $t3, $s0   # Increment loop counter (k) by b
        blt $t3, $s1, loop3 # If k less than N, continue the loop3

        sub $s2, $s2, $s5   # Move back to the original position of a
        sub $s3, $s3, $v1   # Move to the next column block of b
        add $s4, $s4, $s6   # Move to the next column block of c
        add $t2, $t2, $s0   # Increment loop counter (j) by b
        blt $t2, $s1, loop2 # If j less than N, continue the loop2

        add $s2, $s2, $t8   # Move to the next row block of a
        sub $s3, $s3, $s5   # Move back to the beginning of b
        add $s4, $s4, $v0   # Move to the next row block of c
        add $t1, $t1, $s0   # Increment loop counter (i) by b
        blt $t1, $s1, loop1 # If i less than N, continue the loop1


# End CODE

        la  $a0, msgc
        la  $a1, matrix_c
        jal PRINT_MAT 

#   Exit
        li   $v0,10
        syscall


PRINT_MAT:  li  $v0,4
        syscall
        addi $a2,$0,0   
PL4:    bge $a2,$s1,PL1
        addi $a3,$0,0
PL3:    bge $a3,$s1,PL2

        lw  $a0,0($a1)
        li  $v0,1
        syscall
        la  $a0,sp
        li  $v0,4
        syscall
        addi $a1,$a1,4
        addi $a3,$a3,1
        b   PL3

PL2:    addi    $a2,$a2,1
        la  $a0,nline
        li  $v0,4
        syscall
        b   PL4
PL1:    jr  $ra
