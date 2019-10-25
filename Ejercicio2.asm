.model small           
.data

.code                   
.stack
programa:               
Mov AX,@DATA    
        Mov DS,AX   
        Mov AX,0000h    ; Se inicializa el acumulador
        Mov BX,0000h   
        Mov CX,0000h   
MOV AX,0600H ; Peticion para limpiar pantalla
MOV BH,89H 
MOV CX,0000H 
MOV DX,184FH ; Cursor al final de la pantalla Ren=24(18)
; Col=79(4F)
INT 10H       
        Mov AX,0000h    ; Se inicializa el acumulador
        Mov BX,0000h    
        Mov CX,0000h   
mov cl,1
reed:
Mov DL,120d       ; El resultado se asigna al registro DL para imprimirlo en pantalla
Mov AH,02h      
Int 21h  
mov ah,01h ; instrucción para digitar un caracter
int 16h
cmp al,0dh ;0dh código hexadecimal del Enter, compara si el la tecla  fue un Enter.
jne aumentar_cx
je salir
regreso:
loop reed ;Si no fue Enter salta a la etiqueta reed de nuestro programa
jmp salir
aumentar_cx:
add cl,1
jmp regreso

salir:
Mov AH,4CH     
int 21h         
End programa
