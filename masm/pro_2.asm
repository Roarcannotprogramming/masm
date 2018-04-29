data segment
wd dw 001h
data ends

code segment
main proc far
assume cs: code, ds: data
start: 
    mov ax, data
    mov ds, ax
    sub dx, dx
    mov bx, wd
    mov cx, 16
loop1:
    shl bx, 1
    jns next
    inc dx
next:
    loop loop1
    add dl,30h
    cmp dl, '9'
    jng lett
    add dl,'A' - 58
lett:    
    mov ah, 2
    int 21h
    mov ax,4c00h
    int 21h
main endp

code ends
    end main

