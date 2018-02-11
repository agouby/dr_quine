section .text
global _main

_main:
mov rax, 0x2000005
lea rdi,[rel file]
mov rsi,514
mov rdx,0q644
syscall
_exit:
xor rdi, rdi
mov rax, 0x2000001
syscall

section .data
file: db "Grace_kid.s"
