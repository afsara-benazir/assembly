    INCLUDE 'EMU8086.INC'
    .MODEL SMALL
    .STACK 100H
    .DATA
    
         ARR DW 1,4,1,2,7,5,2
         COUNT DW 8 DUP(0)
         SUM_COUNT DW 8 DUP(0)
         FINAL DW 8 DUP(0)   
         
         SIZE DW ? 
         TEMP DW 2
    
    
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
                 
                 ;BX = MAXM / SIZE_ OF COUNT ARR
                 MOV BYTE PTR SIZE,AL
                 MOV BX, SIZE
                 ADD BX, 1
         
         PRINT:
                PRINT "MAX ELEMENT : "
                ADD AL, 48
                MOV DL,AL
                MOV AH,2
                INT 21H 
              
         LEA SI, ARR
         TOP:
                  ;INITIALIZING AGAIN
                  
                  LEA DI, COUNT 
                  MOV AL, [SI]
                  
                  ;LET CH KEEP COUNT
                  MOV CH, 8 
              
                
         FOR2:
               DEC CH
               ADD SI, 2
               CMP [SI], AL
               JE INC_COUNT_ARR
               
               
         
         JMP FOR2
         
         INC_COUNT_ARR:
                
                    ;MOV BYTE PTR TEMP, AL
                    INC [DI+ 2*AL]
                    CMP CH, 0
                    JG FOR2 
                         
                ;LEA SI, COUNT
                ;MOV DI, SI         
                ;MOV CX, 8 
                
                PRINTN
                ;PRINT "COUNT ARRAY : "
                PRINT "TEMP INC"
                
          
         ;SI POINTS TO OFFSET OF ARRAY           
                    ;LEA SI, ARR
                    
         ;TRYING TO ITERATE ARR
                    ADD SI, TEMP
                    INC TEMP
                    CMP TEMP, 8
                    JG NEXT1
                
                JMP TOP 
        ;PRINTING STARTS
        NEXT1:       
                LEA SI, COUNT
                XOR CX, CX
                MOV CL, 8
                     
         
         PRINT_COUNT_ARR:
                    
                    DEC CL
                    MOV AL, [SI]
                    ADD SI, 2
                
                    ADD AL, 48
                    MOV DL, AL
                    MOV AH, 2
                    INT 21H 
                    PRINT " "
                    
                    CMP CL,0
                    JG PRINT_COUNT_ARR   
                        
         
         
         
         
         
         
         PRINTN
         PRINTN "SORTED ARRAY"
                
         MAIN ENDP
    
    END MAIN