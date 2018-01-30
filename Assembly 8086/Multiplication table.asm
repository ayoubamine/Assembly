;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                  ;
; Bubble Sort.                                     ;
;                                                  ;
; 02/05/2017                                       ;
;                                                  ;
; Author: Ayoub AMINE <programmer010011@gmail.com> ;
;                                                  ;
; License: GPL-3.0                                 ;
;                                                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

data SEGMENT
    
    msg1 db 'Enter a number: $'
    msg2 db ' x $'
    msg3 db ' = $'
    newline db 13, 10, '$'
    str db '00$'
    
data ENDS
                                                          
ASSUME DS:data, CS:code

code SEGMENT
    
    debut:
    mov ax, data
    mov DS, ax
    
    do:

    ;print msg1
    mov ah, 09h
    mov dx, offset msg1
    int 21h
    
    ;read char
    mov ah, 01h
    int 21h
    
    mov bl, al
    
    ;check input is a number
    ;30h -> 39h is decimal
    cmp bl, 30h
    js _do
    cmp bl, 39h + 1
    jns _do
    
    jmp next
    
    _do:;newline
        mov ah, 09h
        mov dx, offset newline
        int 21h
        jmp do
    
    next:
    ;newline
    mov ah, 09h
    mov dx, offset newline
    int 21h
    
    ;start with 1 (31h ascii)
    mov cl, 31h
    
    here:
    ;compare with ascii(:)
    cmp cl, 3Ah
    je fin
    
    ;number
    mov ah, 02h
    mov dl, bl
    int 21h
    
    ;x
    mov ah, 09h
    mov dx, offset msg2
    int 21h
    
    ;register cl
    mov ah, 02h
    mov dl, cl
    int 21h
    
    ;=
    mov ah, 09h
    mov dx, offset msg3
    int 21h
    
    ;result
    sub cl, 30h
    mov al, bl
    sub al, 30h
    
    mul cl
    add cl, 30h
     
    ;;;;;;;;;;;;;;;;;;;
    ;format to decimal;
    
    aam ;AH = AL/10  |  AL = remainder
    add ax, 3030h
    mov si, offset str
    mov [si], ah
    mov [si+1], al
    
    mov dx, offset str
    mov ah, 09h
    int 21h
    
    ;;;;;;;;;;;;;;;;;;;
    
    ;newline
    mov ah, 09h
    mov dx, offset newline
    int 21h
    
    inc cl
    jmp here
    
    fin:
    
code ENDS
END debut