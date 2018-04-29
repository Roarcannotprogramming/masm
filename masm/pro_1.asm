data segment
buf dw p1, p2, p3, p4, p5, p6, p7, p8, p9, p10
inp db 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'
data ends

code segment
main proc far
assume cs: code, ds: data
start: 
    mov ax, data
    mov ds, ax
    sub bx, bx
    mov cx, 10
    mov ah, 01h
    int 21h
    ;mov al, 'C'
loop1:              ;循环比较
    cmp al,[INP + bx]
    jz next
    inc bx
    loop loop1   ;end loop
    mov ax,4c00h
    int 21h
next:
    add bx,bx
    call [buf + bx]
    mov ax, 4c00h
    int 21h
main endp

p1 proc near
    mov dl, al ;al保存的输入数
    mov ah, 2
    int 21h
    retn
p1 endp

p2 proc near
    mov dl, al ;al保存的输入数
    mov ah, 2
    int 21h
    retn
p2 endp

p3 proc near
    mov dl, al ;al保存的输入数
    mov ah, 2
    int 21h
    retn
p3 endp

p4 proc near
    mov dl, al ;al保存的输入数
    mov ah, 2
    int 21h
    retn
p4 endp

p5 proc near
    mov dl, al ;al保存的输入数
    mov ah, 2
    int 21h
    retn
p5 endp

p6 proc near
    mov dl, al ;al保存的输入数
    mov ah, 2
    int 21h
    retn
p6 endp

p7 proc near
    mov dl, al ;al保存的输入数
    mov ah, 2
    int 21h
    retn
p7 endp

p8 proc near
    mov dl, al ;al保存的输入数
    mov ah, 2
    int 21h
    retn
p8 endp

p9 proc near
    mov dl, al ;al保存的输入数
    mov ah, 2
    int 21h
    retn
p9 endp

p10 proc near
    mov dl, al ;al保存的输入数
    mov ah, 2
    int 21h
    retn
p10 endp

code ends
    end main


