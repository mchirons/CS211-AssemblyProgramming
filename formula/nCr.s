.globl nCr
	.type	nCr, @function
nCr:
  	pushl	%ebp
	movl		%esp, %ebp
	pushl	%ebx
	subl		$20, %esp
	movl		8(%ebp), %eax
	movl		%eax, (%esp)
	call		Factorial
	cmpl 	$0, %eax
	je		.L9
	movl		%eax, -12(%ebp)
	movl		12(%ebp), %eax
	movl		%eax, (%esp)
	call		Factorial
	movl		%eax, %ebx
	movl		12(%ebp), %eax
	movl		8(%ebp), %edx
	movl		%edx, %ecx
	subl		%eax, %ecx
	movl		%ecx, %eax
	movl		%eax, (%esp)
	call		Factorial
	cmpl 	$0, %eax
	je 		.L9
	imull	%ebx, %eax
	jc		.L9
	movl		%eax, -8(%ebp)
	movl		-12(%ebp), %eax
	movl		%eax, %edx
	sarl		$31, %edx
	idivl	-8(%ebp)
	jmp 		.L10
.L10:
	addl		$20, %esp
	popl		%ebx
	popl		%ebp
	ret
	.size	nCr, .-nCr
	.section	.rodata

.L9:
	movl		$0, %eax
	jmp 		.L10
	

.globl Factorial
	.type	Factorial, @function
Factorial:
  	pushl	%ebp
	movl		%esp, %ebp
	subl		$16, %esp
	movl		$1, -16(%ebp)
	movl		8(%ebp), %eax
	movl		%eax, -12(%ebp)
	movl		8(%ebp), %eax
	movl		%eax, %edx
	shrl		$31, %edx
	leal		(%edx,%eax), %eax
	sarl		%eax
	movl		%eax, -4(%ebp)
	movl		$1, -8(%ebp)
	jmp		.L2
.L3:
	movl		-16(%ebp), %eax
	imull	-12(%ebp), %eax
	jc 		.L11
	movl		%eax, -16(%ebp)
	movl		-8(%ebp), %eax
	addl		%eax, %eax
	negl		%eax
	addl		8(%ebp), %eax
	addl		%eax, -12(%ebp)
	addl		$1, -8(%ebp)
.L2:
	movl		-8(%ebp), %eax
	cmpl		-4(%ebp), %eax
	jle		.L3
	movl		8(%ebp), %eax
	andl		$1, %eax
	testb	%al, %al
	je		.L4
	movl		8(%ebp), %eax
	movl		%eax, %edx
	shrl		$31, %edx
	leal		(%edx,%eax), %eax
	sarl		%eax
	leal		1(%eax), %edx
	movl		-16(%ebp), %eax
	imull	%edx, %eax
	jc 		.L11
	movl		%eax, -16(%ebp)
	jmp 		.L4
.L4:
	movl		-16(%ebp), %eax
	leave
	ret
	.size	Factorial, .-Factorial
	
.L11:
	movl 	$0,-16(%ebp)
	jmp 		.L4
