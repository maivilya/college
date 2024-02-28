; Hello, World!
; Simple Hello World program in Assembly

; Author: Lakhya Jyoti Nath aka ljnath
; Email: ljnath@ljnath.com
; https://www.ljnath.com
; Dated: 04th February 2013

DATA_SEG    SEGMENT
   STR12        DB 'Variant12', '$' 
   PER1         DD 0FFFFFFCFh
   PER2         DB 5 DUP(39)
   PER3         DW ?
   PER4         DB 00110001b
   PER5         DW -27, 30, -31, 38, -41
   EA_PER3      DW PER3
   FA_PER3      DD PER3
   EA_PER5      DW PER5
   FA_PER5      DD PER5
   FLOAT        DD -12.12
DATA_SEG    ENDS

STACK_SEG   SEGMENT STACK
            DB 256 DUP(?)
STACK_SEG   ENDS

CODE_SEG    SEGMENT
   ASSUME CS: CODE_SEG, DS:DATA_SEG, SS:STACK_SEG

    START:
        MOV   AX, DATA_SEG
        MOV   DS, AX

        MOV    AH,9
        MOV    DX,OFFSET STR12
        INT    21H

        MOV    AH,4CH
        MOV    AL,0
        INT    21H
CODE_SEG    ENDS
   END  START

