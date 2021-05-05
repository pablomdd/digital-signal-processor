@ ssize_t write(int fd, const void *buf, size_t count);
.global write
.equ STDOUT, 1   @ #define STDOUT 1
.equ MSG_LEN, 14 @ #define MSG_LEN 14

.data
LITERAL_MSG: .asciz "Hello, world!\n"

.text
msg: .word LITERAL_MSG @ char *msg = "Hello, world!\n"

.global main
main:
@ write(STDOUT, msg, MSG_LEN);
    push {lr}
    mov r0, #STDOUT
    ldr r1, msg
    mov r3, #MSG_LEN
    @ jump to the 'write' subrutine: `lr (lr <- pc + 1`
    bl write
    pop {lr}

    @ return 0
    mov r0, #0
    bx lr