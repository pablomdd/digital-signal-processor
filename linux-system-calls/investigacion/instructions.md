# Actividad autónoma 1
### Investigue los siguiente términos del sistema operativo Linux
**Llamada al sistema write**
write() writes up to count bytes from the buffer starting at buf
       to the file referred to by the file descriptor fd.
https://man7.org/linux/man-pages/man2/write.2.html

**Entrada, salida y error estándar**
In Linux, stdin is the standard input stream. This accepts text as its input. Text output from the command to the shell is delivered via the stdout (standard out) stream. Error messages from the command are sent through the stderr (standard error) stream.

Streams in Linux—like almost everything else—are treated as though they were files. You can read text from a file, and you can write text into a file. Both of these actions involve a stream of data. So the concept of handling a stream of data as a file isn’t that much of a stretch.

Each file associated with a process is allocated a unique number to identify it. This is known as the file descriptor. Whenever an action is required to be performed on a file, the file descriptor is used to identify the file.

These values are always used for stdin, stdout, and stderr:

0: stdin
1: stdout
2: stderr
Source: https://www.howtogeek.com/435903/what-are-stdin-stdout-and-stderr-on-linux/ 

### Investigue los siguientes términos correspondientes al compilador de C
**Punteros.**
A pointer is a variable whose value is the address of another variable, i.e., direct address of the memory location.

**Declaración de funciones.**
A function declaration tells the compiler about the number of parameters function takes, data-types of parameters and return type of function. Putting parameter names in function declaration is optional in the function declaration, but it is necessary to put them in the definition. 
It is always recommended to declare a function before it is used (See this, this and this for details)

In C, we can do both declaration and definition at the same place
https://www.geeksforgeeks.org/functions-in-c/

**Macros del preprocesador.**
A macro is a fragment of code which has been given a name. Whenever the name is used, it is replaced by the contents of the macro. There are two kinds of macros. They differ mostly in what they look like when they are used. Object-like macros resemble data objects when used, function-like macros resemble function calls

**Literal de cadena de caracteres.**


### Investigue los siguientes macros del preprocesador de C:
**`#define`**
 You can define a macro in C using the #define preprocessor directive.

**`#include`**
The #include preprocessor is used to include header files to C programs
programiz.com/c-programming/c-preprocessor-macros

### Investigue las siguientes directivas de ensamblador:
**`.equ`**
The EQU directive gives a symbolic name to a numeric constant, a register-relative value or a PC-relative value.

```
name EQU expr{, type}
```
https://www.keil.com/support/man/docs/armasm/armasm_dom1361290008953.htm

**`.data`**
The DATA directive is no longer required. It is ignored by the assembler.
https://www.keil.com/support/man/docs/armasm/armasm_dom1361290005244.htm

**`.text`**
Tell the assmbler to put the lines that follows .text in the text segment

I.e.: the lines that follows .text will considered as assembler instructions 

**`.global`**
Three directives identify global symbols that are defined externally or can be referenced externally:

The .def directive identifies a symbol that is defined in the current module and can be accessed by other files. The assembler places this symbol in the symbol table.

The .ref directive identifies a symbol that is used in the current module but is defined in another module. The linker resolves this symbol's definition at link time.

The .global directive acts as a .ref or a .def, as needed.

**`.word`**
The .int, .unint, .long, .ulong, .word, and .uword directives place one or more values into consecutive words in the current section. Each value is placed in a 32-bit word by itself and is aligned on a word boundary. A value can be either:

An expression that the assembler evaluates and treats as a 32-bit signed or unsigned number
A character string enclosed in double quotes. Each character in a string represents a separate value and is stored alone in the least significant eight bits of a 32-bit field, which is padded with 0s.
https://downloads.ti.com/docs/esd/SPNU118O/Content/SPNU118O_HTML/assembler_directives.html#IDintworddesc

### Investigue las siguientes instrucciones del ensamblador para Arm Cortex-A53:
**push**, **pop**
Push registers onto, and pop registers off a full descending stack
```
PUSH{cond} reglist

POP{cond} reglist
```
where:

`cond`
is an optional condition code.

`reglist`
is a non-empty list of registers, enclosed in braces.It can contain register ranges. It must be comma separated if it contains more than one register or register range.

PUSH is a synonym for STMDB sp!, reglist and POP is a synonym for LDMIA sp! reglist. PUSH and POP are the preferred mnemonics in these cases
https://developer.arm.com/documentation/dui0802/b/A32-and-T32-Instructions/PUSH-and-POP?lang=en
**swi** -> `svc`
Supervisor Call.
The SVC instruction causes an exception. This means that the processor mode changes to Supervisor, the CPSR is saved to the Supervisor mode SPSR, and execution branches to the SVC vector.

imm is ignored by the processor. However, it can be retrieved by the exception handler to determine what service is being requested.

``SVC{cond} #imm``

https://developer.arm.com/documentation/dui0802/b/A32-and-T32-Instructions/SVC?lang=en

**bl**
Branch, Branch with Link, Branch and exchange instruction set, Branch with Link and exchange instruction set.
```
op1{cond}{.W} label

op2{cond} Rm
```
https://developer.arm.com/documentation/dui0802/b/A32-and-T32-Instructions/B--BL--BX--and-BLX?lang=en


### Investigue la función de los siguientes registros:
**lr**
The Link Register (LR) stores the return address when a subroutine call is made. It can also be used as a general-purpose register if the return address is stored on the stack. The LR maps to register 30. Unlike in AArch32 state, the LR is distinct from the Exception Link Registers (ELRs) and is therefore unbanked.

https://developer.arm.com/documentation/dui0801/a/Overview-of-AArch64-state/Link-registers

**pc**
In AArch64 state, the Program Counter (PC) contains the address of the currently executing instruction. It is incremented by the size of the instruction executed, which is always four bytes.

https://developer.arm.com/documentation/dui0801/a/Overview-of-AArch64-state/Program-Counter-in-AArch64-state?lang=en