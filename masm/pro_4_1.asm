data segment
buf db "You're the ONE that I loved$"
data ends

code segment
assume cs : code, ds : data
main proc far
mov ax, data
mov ds, ax
sub bx, bx
call compare
sub bx, bx

loop2:
cmp buf[bx],'$'
je quit
mov ah, 02h
mov dl, buf[bx]
int 21h
inc bx
jmp loop2

quit:
mov ax,4c00h
int 21h
main endp

compare proc near
push bx
push dx

loop1: 
cmp buf[bx], '$'
je return
cmp buf[bx], 'a'
jl next
cmp buf[bx], 'z'
jg next
mov dl, buf[bx]
sub dl, 'a'-'A'
mov buf[bx], dl
next:
inc bx
jmp loop1

return:
pop dx
pop bx
ret
compare endp
code ends
end main
