	.text
	.type check_div, @function
	.globl check_div	

check_div:

	#Kolejne argumenty w rejestrach rdi, rsi, rdx, rcx
	#Nie wolno zmienić zawartości rbp,rbx,r12,r13,r14,r15

    #  long check_div(long a, long b, long c);
	# DIV -> EAX:EDX

	CMP $0, %rdx
	JNE c_not_zero

	# a podzielne przez b

	XOR %rdx, %rdx
	MOV %rdi, %rax
	DIV %rsi

	CMP $0, %rdx
	JNE a_not_mod_b
	MOV $1, %rax
	ret
a_not_mod_b:
	MOV $0, %rax
	ret

c_not_zero:
	XOR %r8, %r8
	MOV $64, %rcx

loop:
	SHL $1, %r8

	XOR %rdx, %rdx
	MOV %rdi, %rax
	DIV %rcx

	CMP $0, %rdx
	JNE next
	INC %r8
next:
	DEC %rcx
	JNZ loop

	MOV %r8, %rax
	ret
