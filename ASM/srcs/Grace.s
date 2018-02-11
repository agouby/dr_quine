%macro data 0x0
section .data
file: db "Grace_kid.s",0x0
str: db "%%macro data 0x0%1$csection .data%1$cfile: db %2$cGrace_kid.s%2$c,0x0%1$cstr: db %2$c%3$s%2$c%1$c%%endmacro%1$c%%macro open 0x0%1$cmov rax,0x2000005%1$clea rdi,[rel file]%1$cmov rsi,514%1$cmov rdx,0q644%1$csyscall%1$ccmp rax,-1%1$cje _exit%1$c%%endmacro%1$c%%macro hello 0x0%1$cdata%1$csection .text%1$cglobal _main%1$cextern _dprintf%1$c_main:%1$csub rsp,0x8%1$copen%1$cmov rdi,rax%1$clea rsi,[rel str]%1$cmov rdx,0xA%1$cmov rcx,0x22%1$clea r8,[rel str]%1$cmov r9,0x3B%1$ccall _dprintf%1$c_exit:%1$cxor rdi,rdi%1$cmov rax,0x2000001%1$csyscall%1$c%%endmacro%1$c%4$cLet's do it%1$chello%1$c"
%endmacro
%macro open 0x0
mov rax,0x2000005
lea rdi,[rel file]
mov rsi,514
mov rdx,0q644
syscall
cmp rax,-1
je _exit
%endmacro
%macro hello 0x0
data
section .text
global _main
extern _dprintf
_main:
sub rsp,0x8
open
mov rdi,rax
lea rsi,[rel str]
mov rdx,0xA
mov rcx,0x22
lea r8,[rel str]
mov r9,0x3B
call _dprintf
_exit:
xor rdi,rdi
mov rax,0x2000001
syscall
%endmacro
;Let's do it
hello
