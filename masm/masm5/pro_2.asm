DATA SEGMENT  
    A DB 3
    B DB ?
DATA ENDS  
  
CODE SEGMENT  
    ASSUME  CS:CODE,DS:DATA  
START:  MOV AX,DATA  
    MOV DS,AX  
    MOV AL, [A]
    MUL Al
    MOV [B],AL
    MOV AH,4CH
    INT 21H  
CODE ENDS  
END START  