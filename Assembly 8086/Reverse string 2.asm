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
    
    msg1 db 'String --> $'
    msg2 db 13, 10, 'Reverse string --> $'
    
    
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
    
    ;reverse string
    mov si, offset buff+1
    mov cl, [si]
    dec cl
    mov ch, 0
    mov di, 0
    
    ici:
    cmp cx, di
    js fin
    
    ;si pointer to di
    mov si, offset buff+2
    add si, di
    mov al, [si]
    
    ;si pointer to si
    mov si, offset buff+2
    add si, cx
    mov ah, [si]
    mov [si], al
    
    ;si pointer to di
    mov si, offset buff+2
    add si, di
    mov [si], ah

    inc di
    dec cl
    jmp ici
    
    fin:
                        
    ;print string
    mov ah, 09h
    mov dx, offset buff+2
    int 21h 


code ENDS

END debut