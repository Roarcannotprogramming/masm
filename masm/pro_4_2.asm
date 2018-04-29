public add_num1
public add_num2
extrn add_proc: far

data segment
add_num1 db 12, 33
add_num2 db 77, 13
data ends

code segment
assume cs: code, ds: data 
main proc far 
mov ax, data
mov ds,ax 
mov ah, add_num1[0]
mov al, add_num1[1]
call add_proc
mov ah, 0
mov bl, 10
div bl
add ax, 3030h
mov dx, ax
mov ah, 02h
int 21h
mov cl, 8
shr dx, cl 
mov ah, 02h
int 21h
mov ax, 4c00h
int 21h
main endp
code ends
end main

