
DATA SEGMENT
A DB 3
B DW ?
DATA ENDS

STACK SEGMENT STACK 'STACK'
SATPIN DB 100DUP(?)
TOP LABEL WORD
STACK ENDS

CODE SEGMENT
MAIN PROC FAR
     ASSUME CS:CODE,DS:DATA,SS:STACK
START: MOV AX, DATA
    MOV DS, AX
    MOV AX, STACK
    MOV SS, AX
    MOV SP, OFFSET TOP
    SUB AX, AX
    MOV AL, A
    MUL AL
    MOV B, AX

    MOV AX,4C00H
    INT 21
MAIN ENDP
CODE ENDS
     END MAIN
