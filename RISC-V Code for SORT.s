.data
A: .word 27,20,2,24,7,19,2,10,10,22

.text
la   x10, A          # put the base address of array A in x10
addi x11, x0, 10     # put the length of array A in x11
addi x5,  x0, 0      # the temperary variable i
addi x6,  x0, 0      # the temperary variable j
addi x7,  x0, 0      # the temperary variable temp

# insert your code here
Loop1:
    bge x5, x11, exit
    addi x6, x5, 0
Loop2:
    addi x6, x6, 1
    bge x6, x11, END
    slli x28, x5, 2
    slli x29, x6, 2
    add x28, x28, x10
    add x29, x29, x10
    lw x30, 0(x28)
    lw x31, 0(x29)
    bge x31, x30, Loop2
    addi x7, x30, 0
    sw x31, 0(x28)
    sw x7, 0(x29)
    jal x0, Loop2
END:
    addi x5, x5, 1
    jal x0, Loop1


exit:
nop