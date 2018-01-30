;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                  ;
; Read-Print string.                               ;
;                                                  ;
; 30/04/2017                                       ;
;                                                  ;
; Author: Ayoub AMINE <programmer010011@gmail.com> ;
;                                                  ;
; License: GPL-3.0                                 ;
;                                                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

data SEGMENT
    
    msg1 db 'String --> $'
    msg2 db 13, 10, 'Your string --> $'
    
    
    buff db  26          ;MAX NUMBER OF CHARACTERS ALLOWED (25).
         db  ?           ;NUMBER OF CHARACTERS ENTERED BY USER.
         db  26 dup('$') ;CHARACTERS ENTERED BY USER.

data ENDS

ASSUME DS:data, CS:code

code SEGMENT

    debut:
    mov ax, data
    mov DS, ax
                   
                   
    ;print msg1
    mov dx, offset msg1
    mov ah, 09h
    int 21h
    
    ;read string
    mov ah, 0Ah
    mov dx, offset buff
    int 21h
    
    ;print msg2
    mov dx, offset msg2
    mov ah, 09h      
    int 21h
    
    '
    ;change (enter-13) by $
    mov si, offset buff + 1 ;NUMBER OF CHARACTERS ENTERED
    mov cl, [si]            ;MOVE LENGTH TO CL
    mov ch, 0               ;CLEAR CH TO USE CX 
    inc cx                  ;TO REACH CHR(13)
    add si, cx              ;NOW SI POINTS TO CHR(13)
    mov [si], '$'           ;REPLACE CHR(13) BY '$'
    '
                        
    ;print string
    mov ah, 09h
    mov dx, offset buff + 2
    int 21h 


code ENDS

END debut