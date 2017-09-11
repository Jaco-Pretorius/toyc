.text
        align 4
.globl entry_function
        .type entry_function,@function

entry_function:
    movl $42, %eax
    ret
