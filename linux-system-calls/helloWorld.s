.equ STDOUT,    1       @ #define STDOUT    1
.equ MSG_LEN,   14      @ #define MSG_LEN   14
.equ WRITE,     4

.data
LITERAL_MSG: .asciz "Hello, world!\n"

.text
msg: .word   LITERAL_MSG     @ char *msg = "Hello, world!\n";

.global main
main:
@    write(STDOUT, MSG, MSG_LEN);
    push {r7, lr}
    mov r0, #STDOUT
    ldr r1, msg
    mov r2, #MSG_LEN
    mov r7, #WRITE
    swi #0
    pop {r7, lr}

@   return 0
    mov r0, #0
    bx lr