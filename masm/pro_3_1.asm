code segment
assume cs:code
main proc far 
start:
    sub dx, dx
    mov cx, 10
loop1:
    mov ah, 01h
    int 21h
    and al, 0fh
    add dl, al
    loop loop1

show:
    mov ax, dx
    mov cl, 10
    div cl
    mov dx,ax
    add dx, 3030h
    mov ah,02h
    int 21h
    mov cl, 8
    shr dx, cl
    int 21h
    mov ax, 4c00h
    int 21h
main endp
code ends
end main
    