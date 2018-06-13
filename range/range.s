#----------------------------------------------------------------
# Assebmler version of generate_string for maxdiff program (64 bit)
#----------------------------------------------------------------

	.text
	.type range, @function
	.globl range

range:

	#Kolejne argumenty w rejestrach rdi, rsi, rdx, rcx
	#Nie wolno zmienić zawartości rbp,rbx,r12,r13,r14,r15

    # int  is_out ( int x, int  a , int  b, int c );

    CMP %rcx, %rdi
    JB next_2
    MOV $3, %rax
    ret
next_2:
    CMP %rdx, %rdi
    JB return
    MOV $2, %rax
    ret
return:
    MOV $1, %rax
    ret
