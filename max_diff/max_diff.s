#----------------------------------------------------------------
# Assebmler veesion of generate_string for maxdiff program (64 bit)
#----------------------------------------------------------------

	.text
	.type max_diff, @function
	.globl max_diff	

max_diff:	

	#Kolejne argumenty w rejestrach rdi, esi, edx, ecx
	#Nie wolno zmienić zawartości rbp,rbx,r12,r13,r14,r15

    # int  max_diff ( int  a ,  int  b ,  int  c ,  int  d);

    # %r8d - min
    # %eax - max

    # initial values
    MOV %edi, %r8d
    MOV %edi, %eax

    # arg 2
    CMP %r8d, %esi
    JGE next_2
    MOV %esi, %r8d
next_2:
    CMP %eax, %esi
    JLE test_3
    MOV %esi, %eax

    # arg 3
test_3:
    CMP %r8d, %edx
    JGE next_3
    MOV %edx, %r8d
next_3:
    CMP %eax, %edx
    JLE test_4
    MOV %edx, %eax

    # arg 4
test_4:
    CMP %r8d, %ecx
    JGE next_4
    MOV %ecx, %r8d
next_4:
    CMP %eax, %ecx
    JLE return
    MOV %ecx, %eax

return:
    SUB %r8d, %eax
    ret
