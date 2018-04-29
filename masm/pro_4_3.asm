data segment
DISPLAY dw 1A08h
data ends

code segment
assume cs: code, ds: data
main proc far 
mov ax, data
mov ds, ax 
mov bx, DISPLAY
call show
mov ax, 4c00h
int 21h
main endp

show proc near
pushf
push bx
push dx
;mov bx, DISPLAY
mov cx, 16

loop1:
rol bx, 1
jnc next
mov dl, 31h
mov ah, 2
int 21h
jmp last

next:
mov dl, 30h
mov ah, 2
int 21h

last:
loop loop1

pop dx
pop bx 
popf
ret
show endp
code ends
end main
