extrn add_num1: byte
extrn add_num2: byte
public add_proc

code segment
assume cs: code
add_proc proc far
push bx
mov bl, ah
add al, bl
pop bx
ret 
add_proc endp
code ends
end add_proc