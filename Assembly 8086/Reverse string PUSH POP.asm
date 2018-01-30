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

mov cx, 0

pushin:
mov ah, 1
int 21h
mov bl, al

cmp al, 13
je newline

push bx
inc cx

jmp pushin


newline:
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

popin:
pop dx
int 21h
loop popin