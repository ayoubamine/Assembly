;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                  ;
; lowercase to UPPERCASE.                          ;
;                                                  ;
; 02/05/2017                                       ;
;                                                  ;
; Author: Ayoub AMINE <programmer010011@gmail.com> ;
;                                                  ;
; License: GPL-3.0                                 ;
;                                                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov ah, 01h
int 21h

and al, 223

mov dl, al

mov ah, 02h
int 21h