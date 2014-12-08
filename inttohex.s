# inttohex.s
# Change an int to a hexidecimal
# Hayden Lalljie Excersise 8-6

		.equ	anInt, -4
		.equ	localSize, -16
		.section	.rodata
prompt:
		.string	"Enter an integer: "
scanFormat:
		.string	"%i"
printFormat:
		.string "%i = %x\n"
		
		.text
		.globl	main
		.type	main, function
main:
		pushq	%rbp
		moveq	%rsp, %rbp
		addq	$localSize, %rsp
		
		movl	$prompt, %edi
		movl	$0, %eax
		call	printf
		
		leaq	anInt(%rbp), %rsi
		movl	$scanFormat, %edi
		movl	$0, %eax
		call	scanf
		
		movl	anInt(%rbp), %edx
		movl	anInt(%rbp), %esi
		movl	$printFormat, %edi
		movl	$0, %eax
		call	printf
		
		movl	$0, %eax
		movq	%rbp, %rsp
		popq	%rbp
		ret