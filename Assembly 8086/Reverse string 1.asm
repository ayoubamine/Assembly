;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                  ;
; Reverse String.                                  ;
;                                                  ;
; 30/04/2017                                       ;
;                                                  ;
; Author: Ayoub AMINE <programmer010011@gmail.com> ;
;                                                  ;
; License: GPL-3.0                                 ;
;                                                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

data SEGMENT
    
    str db 'hello world$'
    newline db 13, 10, '$'

data ENDS

ASSUME DS:data, CS:code

code SEGMENT

    debut:
    mov ax, data
    mov DS, ax
                   
                   
    ;print str
    mov dx, offset str
    mov ah, 09h
    int 21h
    
    
    ;print newline
    mov dx, offset newline
    mov ah, 09h
    int 21h

    
    ;reverse string
    mov si, 0Ah
    mov di, 0h
    
    ici:
    cmp si,di
    js fin
    
    mov al, str[di]
    mov ah, str[si]

    mov str[di], ah    
    mov str[si], al
    
    inc di
    dec si
    jmp ici
    
    fin:
    
    ;print str
    mov dx, offset str
    mov ah, 09h
    int 21h

code ENDS

END debut