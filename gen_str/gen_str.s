#----------------------------------------------------------------
# Assebmler version of generate_string for maxdiff program (64 bit)
#----------------------------------------------------------------

	.text
	.type gen_str, @function
	.globl gen_str	

gen_str:	

	#Kolejne argumenty w rejestrach rdi, rsi, rdx, rcx
	#Nie wolno zmienić zawartości rbp,rbx,r12,r13,r14,r15

    #  ( char∗s ,  int  c ,  int  n ,  int  inc ) ;

    MOV %rdi, %rax
next_c:
    MOV %rsi, (%rdi)
    INC %rdi
    DEC %rdx

    CMP $0, %rcx
    JE hop
    INC %rsi
hop:

    CMP $0, %rdx
    JNE next_c

    ret
