INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA

     ARR DW 1,4,1,2,7,5,2
     COUNT DW 7 DUP(0)
     SUM_COUNT DW 7 DUP(0)
     FINAL DW 7 DUP(0)


.CODE


MAIN PROC
     
     MOV AX, @DATA
     MOV DS, AX
     
     PRINTN "ENTER INPUT ARRAY" 
             PUSH BX
             PUSH CX
             PUSH DX
             PUSH SI
             
             
             ;SI POINTS TO ARR
             LEA SI, ARR    
             ;DEC BX
             ;JE END_SORT
             
             ;DI ALSO POINTS TO ARR
             MOV DI, SI
               
             ;AL CONTAINS CONTENTS OF DI
             MOV AL, [DI]
             
             ;CX KEEPS COUNT
             MOV CX,7 
     
     ;ITERATING THROUGH THE ARRAY
     FOR:
            MOV AL, [SI]
            ADD SI, 2
            
            ADD AL, 48
            MOV DL, AL
            MOV AH, 2
            INT 21H 
            PRINT " "
             
     LOOP FOR
     
             XOR CX, CX          
             MOV CX, 7
             
             ;INITIALIZING STUFFS AGAIN 
             MOV AL, [DI] 
             MOV SI, DI
     
     FIND_BIG:
     
             ADD SI,2
             CMP [SI], AL
             JNG NEXT
             MOV DI, SI
             MOV AL, [DI]
             
     NEXT:
             LOOP FIND_BIG
     
     PRINT:
            PRINT "MAX ELEMENT : "
            ADD AL, 48
            MOV DL,AL
            MOV AH,2            
            
            INT 21H
     
     
     ;SI POINTS TO OFFSET OF ARRAY
     
     
     PRINTN
     PRINTN "SORTED ARRAY"
            
     MAIN ENDP

END MAIN