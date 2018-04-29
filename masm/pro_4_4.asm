code segment
assume cs:code

main proc far 
mov ax, 1
mov bx, 0
mov cx, 3
call mul_proc
mov ax, 4c00h
int 21h
main endp

mul_proc proc near
loop1:
inc bx
mul bx
loop loop1
ret 
mul_proc endp

code ends
end main
