	.data
max_count:
	.long	0
cur_max_count:
	.long	0

	.text
	.type check_tab, @function
	.globl check_tab	

check_tab:

	#Kolejne argumenty w rejestrach rdi, rsi, rdx, rcx
	#Nie wolno zmienić zawartości rbp,rbx,r12,r13,r14,r15

	# unsigned int check_tab(int *tab, int n, int *max);
	# rcx - 63, 62 ... 0
	# r9 - inner tab iterator
	# r8 - if is in tab

	XOR %r9, %r9
	XOR %r8, %r8
	MOV $63, %ecx

loop:
	SHL $1, %r8
	XOR %r9, %r9
	MOVL $0, cur_max_count

in_loop:
	MOV (%rdi,%r9,4), %eax
	CMPL %eax, %ecx
	JNE next_without_inc
	ADD $1, cur_max_count
next_without_inc:
	INC %r9
	CMP %r9, %rsi
	JNE in_loop

	CMP $0, cur_max_count
	JE none
	INC %r8
none:
	MOV cur_max_count, %r9
	CMPL max_count, %r9d
	JBE loop_check
	MOVL %r9d, max_count
	MOVL %r9d, (%rdx)

loop_check:
	CMP $0, %ecx
	JE the_end
	DEC %ecx
	JMP loop

the_end:
	MOV %r8, %rax
	ret
