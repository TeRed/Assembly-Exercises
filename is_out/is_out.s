#----------------------------------------------------------------
# Assebmler version of generate_string for maxdiff program (64 bit)
#----------------------------------------------------------------

	.text
	.type is_out, @function
	.globl is_out

is_out:	

	#Kolejne argumenty w rejestrach rdi, rsi, rdx, rcx
	#Nie wolno zmienić zawartości rbp,rbx,r12,r13,r14,r15

    # int  is_out ( int x, int  a ,  int  b );

    # a / rsi - min
    # b - rdx - max

    CMP %rsi, %rdx
    JAE next
    MOV %rsi, %rcx
    MOV %rdx, %rsi
    MOV %rcx, %rdx

next:
    MOV $0, %rax

    CMP %rsi, %rdi
    JB less
    CMP %rdx, %rdi
    JA more
    JMP return
less:
    MOV $(-1), %rax
    JMP return
more:
    MOV $1, %rax
return:
    ret
