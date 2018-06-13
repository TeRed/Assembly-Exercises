#----------------------------------------------------------------
# Assebmler version of generate_string for maxdiff program (64 bit)
#----------------------------------------------------------------

	.text
	.type fun, @function
	.globl fun	

fun:	

	#Kolejne argumenty w rejestrach rdi, rsi, rdx, rcx
	#Nie wolno zmienić zawartości rbp,rbx,r12,r13,r14,r15

    #  (char∗s, char *a, char *b) ;

    MOV %rdi, %rax
next:
    #XOR %r8, %r8
    MOV (%rsi), %r8
    MOV %r8, (%rdi)
    INC %rdi
    INC %rsi

    #XOR %r8, %r8
    MOV (%rdx), %r8
    MOV %r8, (%rdi)
    INC %rdi
    INC %rdx

    CMP $0, (%rsi)
    JE fill_rdx
    CMP $0, (%rdx)
    JE fill_rsi
    JMP next

fill_rsi:
    #XOR %r8, %r8
    MOV (%rsi), %r8
    MOV %r8, (%rdi)
    INC %rdi
    INC %rsi

    CMP $0, (%rsi)
    JNE fill_rsi

fill_rdx:
    #XOR %r8, %r8
    MOV (%rdx), %r8
    MOV %r8, (%rdi)
    INC %rdi
    INC %rdx

    CMP $0, (%rdx)
    JNE fill_rdx

    ret
