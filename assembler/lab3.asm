DATA_SEG    SEGMENT
    VAR1    DW -666
    FASD    DD 1212121212
DATA_SEG    ENDS

STACK_SEG   SEGMENT STACK
            DB 256 DUP(?)
STACK_SEG   ENDS

CODE_SEG    SEGMENT
   ASSUME CS: CODE_SEG, DS:DATA_SEG, SS:STACK_SEG

    START:
        MOV   AX, DATA_SEG
        MOV   DS, AX
        
        MOV   BX, 7812h
        MOV   DX, 156h
        MOV   CL, DH
        MOV   SI, word ptr FASD+2
        MOV   BP, word ptr FASD
        MOV   DI, VAR1
        push  SI
        push  DI
        pop   SI
        pop   DI
        xchg  BP, CX
        
        
        MOV    AX,4C00H
        INT    21H
CODE_SEG    ENDS
   END  START



