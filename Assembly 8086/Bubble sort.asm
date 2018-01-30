;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                              ;
;Implementation Bubble Sort with Assembly 8086 ;
;                                              ;
;30/04/2017                                    ;
;                                              ;
;By Ayoub Amine                                ;
;                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


data SEGMENT
    
    tab dw 9, 6, 4, 2, 3, 12, 65, 99, -1, 88, -12, -30, 1000, 0
    
data ENDS

ASSUME DS:data, CS:code, SS:stack

stack SEGMENT
    
    dw 10 dup (?)

stack ENDS

code SEGMENT
    
    SORT PROC near
        
        mov BP, SP
        mov si, [BP+2]
        mov AX, [si]
        
        mov CX, 13
        mov DI, 0
        
        bubble_sort:
        
            cmp CX, DI
            je next
            
            inc DI
            
            add SI, 2
            cmp AX, [SI]
            jns do
            
            mov AX, [SI]
            jmp bubble_sort
            
            
            do: 
                mov DX, [SI]
                mov [SI], AX
                mov [SI-2], DX
            
            
            mov AX, [SI]
            jmp bubble_sort 
            
            
            next:
                mov DI, 0
                mov si, [BP+2]
                mov AX, [si]
                loop bubble_sort 
        
        ret 
        
    SORT ENDP
    
    debut:
    
    mov AX, data
    mov DS, AX
   
    mov AX, stack
    mov SS, AX
    mov SP, 0xFFFF
           
    
    push offset tab        
    CALL SORT
   
    jmp fin
    ret
    fin:
    
code ENDS

END debut