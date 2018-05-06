data segment
year dw ?
month db ?
day db ?
week db ? 
data ends

code segment
assume cs: code, ds: data
main proc far
start:
    mov ax, data
    mov ds, ax
fetch:
    mov ah,2ah
    int 21h
load:
    mov [year], cx
    mov [month], dh
    mov [day], dl
    mov [week], al
show_year:
    mov ax, [year]
    mov dx, 0h
    mov cx, 1000
    div cx  ;dx 1 ax 998
    mov bx, ax
    mov ax, dx
    mov dx, bx
    mov bx, ax
    add dl, 30h
    mov ah, 02h
    int 21h

    mov ax, bx
    mov cl, 100
    div cl ;ah 98 al 9
    mov dx, ax
    add dl, 30h
    mov ah, 02h
    int 21h

    mov ah, 0h
    mov al, dh
    mov cl ,10
    div cl ;ah 8 al 9
    mov dx, ax
    add dl, 30h
    mov ah,02h
    int 21h

    mov cl, 8
    shr dx, cl
    add dl, 30h
    mov ah,02h
    int 21h

    mov dl, 20h
    mov ah,02h
    int 21h

show_month:
    mov al, [month]
    mov ah, 0
    mov cl, 10
    div cl
    mov dx, ax
    add dl, 30h
    mov ah, 02h
    int 21h

    mov cl, 08h
    shr dx, cl
    add dl, 30h
    mov ah, 02h
    int 21h

    mov dl, 20h
    mov ah,02h
    int 21h

show_day:
    mov al, [day]
    mov ah, 0
    mov cl, 10
    div cl
    mov dx, ax
    add dl, 30h
    mov ah, 02h
    int 21h

    mov cl, 08h
    shr dx, cl
    add dl, 30h
    mov ah, 02h
    int 21h

    mov dl, 20h
    mov ah,02h
    int 21h

show_week:
    mov al,[week]
    cmp al, 0
    jz sun
    cmp al, 1
    jz mon
    cmp al, 2
    jz tue
    cmp al, 3
    jz wed
    cmp al, 4
    jz thu
    cmp al, 5
    jz fri
    cmp al, 6
    jz sat
sun:
    mov dl, 'S'
    mov ah, 02h
    int 21h
    mov dl, 'U'
    int 21h
    mov dl, 'N'
    int 21h
    jmp end_
mon:
    mov dl, 'M'
    mov ah, 02h
    int 21h
    mov dl, 'O'
    int 21h
    mov dl, 'N'
    int 21h
    jmp end_
tue:
    mov dl, 'T'
    mov ah, 02h
    int 21h
    mov dl, 'U'
    int 21h
    mov dl, 'E'
    int 21h
    jmp end_
wed:
    mov dl, 'W'
    mov ah, 02h
    int 21h
    mov dl, 'E'
    int 21h
    mov dl, 'D'
    int 21h
    jmp end_
thu:
    mov dl, 'T'
    mov ah, 02h
    int 21h
    mov dl, 'H'
    int 21h
    mov dl, 'U'
    int 21h
    jmp end_
fri:
    mov dl, 'F'
    mov ah, 02h
    int 21h
    mov dl, 'R'
    int 21h
    mov dl, 'I'
    int 21h
    jmp end_
sat:
    mov dl, 'S'
    mov ah, 02h
    int 21h
    mov dl, 'A'
    int 21h
    mov dl, 'T'
    int 21h
    jmp end_

end_:
    mov ax, 4c00h
    int 21h
    main endp
    code ends
    end main
