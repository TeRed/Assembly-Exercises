#----------------------------------------------------------------
# Assebmler version of generate_string for maxdiff program (64 bit)
#----------------------------------------------------------------

	.text
	.type max_ind, @function
	.globl max_ind	

max_ind:	

	#Kolejne argumenty w rejestrach rdi, rsi, rdx, rcx
	#Nie wolno zmienić zawartości rbp,rbx,r12,r13,r14,r15

    # int  max_ind ( int  a ,  int  b ,  int  c ,  int  d);

    # %r8 - current max
    # %rax - index

    MOV %rdi, %r8
    MOV $1, %rax

    CMP %r8, %rsi
    JBE test_3
    MOV $2, %rax
    MOV %rsi, %r8
test_3:
    CMP %r8, %rdx
    JBE test_4
    MOV $3, %rax
    MOV %rdx, %r8
test_4:
    CMP %r8, %rcx
    JBE look_for_more
    MOV $4, %rax
    MOV %rcx, %r8

look_for_more:
    CMP $2, %rax
    JE test_3a
    CMP %r8, %rsi
    JE multi
test_3a:
    CMP $3, %rax
    JE test_4a
    CMP %r8, %rdx
    JE multi
test_4a:
    CMP $4, %rax
    JE return
    CMP %r8, %rcx
    JE multi
    JMP return
multi:
    MOV $0, %rax
return:
    ret
