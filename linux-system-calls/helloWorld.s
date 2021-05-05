@ --------
@ swi: software interrupt. 
@ The SWI instruction causes a SWI exception. 
@ This means that the processor state changes to ARM, the processor mode changes to Supervisor, 
@ the CPSR is saved to the Supervisor Mode SPSR, and execution branches to the SWI vector.
@ -------

.equ STDOUT,    1       @ #define STDOUT    1
.equ MSG_LEN,   14      @ #define MSG_LEN   14
.equ WRITE,     4

.data
LITERAL_MSG: .asciz "Hello, world!\n"

.text
@ save memory addres of character string 
msg: .word   LITERAL_MSG     @ char *msg = "Hello, world!\n";

.global main
main:
@    write(STDOUT, MSG, MSG_LEN);
    @ save program state, ie, push relevant registries to the Call Stack
    push {r7, lr}
    mov r0, #STDOUT
    ldr r1, msg
    mov r2, #MSG_LEN
    mov r7, #WRITE
    @ actual system call
    swi #0
    @ pop from Call Stack
    pop {r7, lr}

@   return 0
    mov r0, #0
    bx lr
