section .text
global _main
extern _printf
extern _fflush

_hello:
ret
;All-right
_main:
sub rsp,0x8
xor rax,rax
mov rsi,0xA
mov rdx,0x3B
mov rcx,0x22
lea r8,[rel str]
lea rdi,[rel str];love me again
call _printf
mov rdi,0x0
call _fflush
call _hello
_exit:
mov rax,0x2000001
mov rdi,0x0
syscall

section .data
str: db "section .text%1$cglobal _main%1$cextern _printf%1$cextern _fflush%1$c%1$c_hello:%1$cret%1$c%2$cAll-right%1$c_main:%1$csub rsp,0x8%1$cxor rax,rax%1$cmov rsi,0xA%1$cmov rdx,0x3B%1$cmov rcx,0x22%1$clea r8,[rel str]%1$clea rdi,[rel str]%2$clove me again%1$ccall _printf%1$cmov rdi,0x0%1$ccall _fflush%1$ccall _hello%1$c_exit:%1$cmov rax,0x2000001%1$cmov rdi,0x0%1$csyscall%1$c%1$csection .data%1$cstr: db %3$c%4$s%3$c%1$c"
