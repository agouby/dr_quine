section .text
global _main
extern _sprintf
extern _dprintf
extern _system
extern _strlen

%macro OPEN 1
lea rdi,[rel buf]
lea rsi,[rel open_str]
mov rdx,%1
sub rsp,0x8
call _sprintf
add rsp,0x8
mov rax,0x2000005
lea rdi,[rel buf]
mov rsi,514
mov rdx,0q644
syscall
push rax
%endmacro

_init:
inc rcx
cmp rcx, 0x400
je _ret
mov byte[rdi + rcx],0x0
jmp _init

_ret:
ret

%macro COMPILE 0
pop rdi
lea rsi,[rel str]
mov rdx,0xA
lea rcx,[rel str]
mov r8,0x22
pop r9
sub rsp,0x8
push r9
dec r9
call _dprintf

lea rdi,[rel buf2]
lea rsi,[rel cmp]
lea rdx,[rel buf]
call _sprintf

lea rdi,[rel buf]
call _strlen

sub rax,0x2
sub rsp,0x8
push rax
lea rdi,[rel buf2]
call _system

lea rdi,[rel buf2]
mov rcx,0x0
call _init
xor rax,rax
pop rdx
add rsp,0x8
lea rsi,[rel lnk]
lea rcx,[rel buf]
call _sprintf

lea rdi,[rel buf2]
call _system

xor rcx,rcx
lea rdi,[rel buf2]
call _init
lea rsi,[rel del]
pop rdx
push rdx
call _sprintf
lea rdi,[rel buf2]
call _system

xor rcx,rcx
lea rdi,[rel buf2]
call _init
pop rdx
lea rsi,[rel launch]
call _sprintf
add rsp,0x8
lea rdi,[rel buf2]
call _system

%endmacro

_main:
sub rsp,0x8
mov rax,5
push rax
and rax,rax
jle _exit
OPEN rax
COMPILE
_exit:
mov rax,0x2000001
xor rdi,rdi
syscall

section .data
buf: times 1024 db 0x0
buf2: times 1024 db 0x0
open_str: db "Sully_%d.s",0x0
del: db "rm -f Sully_%d.o",0x0
cmp: db "nasm -f macho64 %s",0x0
launch: db "./Sully_%d",0x0
lnk: db "ld -o %2$.*1$s %2$.*1$s.o -arch x86_64 -macosx_version_min 16.7.0 -lc",0x0
str: db "section .text%1$cglobal _main%1$cextern _sprintf%1$cextern _dprintf%1$cextern _system%1$cextern _strlen%1$c%1$c%%macro OPEN 1%1$clea rdi,[rel buf]%1$clea rsi,[rel open_str]%1$cmov rdx,%%1%1$csub rsp,0x8%1$ccall _sprintf%1$cadd rsp,0x8%1$cmov rax,0x2000005%1$clea rdi,[rel buf]%1$cmov rsi,514%1$cmov rdx,0q644%1$csyscall%1$cpush rax%1$c%%endmacro%1$c%1$c_init:%1$cinc rcx%1$ccmp rcx, 0x400%1$cje _ret%1$cmov byte[rdi + rcx],0x0%1$cjmp _init%1$c%1$c_ret:%1$cret%1$c%1$c%%macro COMPILE 0%1$cpop rdi%1$clea rsi,[rel str]%1$cmov rdx,0xA%1$clea rcx,[rel str]%1$cmov r8,0x22%1$cpop r9%1$csub rsp,0x8%1$cpush r9%1$cdec r9%1$ccall _dprintf%1$c%1$clea rdi,[rel buf2]%1$clea rsi,[rel cmp]%1$clea rdx,[rel buf]%1$ccall _sprintf%1$c%1$clea rdi,[rel buf]%1$ccall _strlen%1$c%1$csub rax,0x2%1$csub rsp,0x8%1$cpush rax%1$clea rdi,[rel buf2]%1$ccall _system%1$c%1$clea rdi,[rel buf2]%1$cmov rcx,0x0%1$ccall _init%1$cxor rax,rax%1$cpop rdx%1$cadd rsp,0x8%1$clea rsi,[rel lnk]%1$clea rcx,[rel buf]%1$ccall _sprintf%1$c%1$clea rdi,[rel buf2]%1$ccall _system%1$c%1$cxor rcx,rcx%1$clea rdi,[rel buf2]%1$ccall _init%1$clea rsi,[rel del]%1$cpop rdx%1$cpush rdx%1$ccall _sprintf%1$clea rdi,[rel buf2]%1$ccall _system%1$c%1$cxor rcx,rcx%1$clea rdi,[rel buf2]%1$ccall _init%1$cpop rdx%1$clea rsi,[rel launch]%1$ccall _sprintf%1$cadd rsp,0x8%1$clea rdi,[rel buf2]%1$ccall _system%1$c%1$c%%endmacro%1$c%1$c_main:%1$csub rsp,0x8%1$cmov rax,%4$d%1$cpush rax%1$cand rax,rax%1$cjle _exit%1$cOPEN rax%1$cCOMPILE%1$c_exit:%1$cmov rax,0x2000001%1$cxor rdi,rdi%1$csyscall%1$c%1$csection .data%1$cbuf: times 1024 db 0x0%1$cbuf2: times 1024 db 0x0%1$copen_str: db %3$cSully_%%d.s%3$c,0x0%1$cdel: db %3$crm -f Sully_%%d.o%3$c,0x0%1$ccmp: db %3$cnasm -f macho64 %%s%3$c,0x0%1$claunch: db %3$c./Sully_%%d%3$c,0x0%1$clnk: db %3$cld -o %%2$.*1$s %%2$.*1$s.o -arch x86_64 -macosx_version_min 16.7.0 -lc%3$c,0x0%1$cstr: db %3$c%2$s%3$c%1$c"
