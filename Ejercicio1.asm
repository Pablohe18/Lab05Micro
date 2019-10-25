.MODEL small
.DATA
    Numero1  DB ?
    Numero2  DB ?
    Producto DB 'PRODUCTO DE DOS NUMEROS$'
    msj DB 'Ingrese el primer numero:$'
    msj1 DB 'Ingrese el segundo numero:$'
    msj2 DB 'Presione cualquier tecla...$'
    m1 DB ?
    m2 DB ?
    Diez DB 10d
    salto DB 13,10, "$"
    total DB 'total$' 
.CODE

Programa:
    MOV AX, @DATA
    MOV DS, AX
    
     MOV DX, offset Producto ;se imprime el Producto
     MOV AH, 09h
     INT 21h
     
     MOV DX, offset salto    ;se imprime el salto
     MOV AH, 09h
     INT 21h
     
     MOV DX, offset msj ;se imprime el msj
     MOV AH, 09h
     INT 21h
     
    ; Leer numeros
    XOR AX, AX
    MOV AH, 01h     ;Se lee el 1er. numero
    INT 21h
    MOV Numero1, AL   
    
    MOV DX, offset salto    ;se imprime el salto
    MOV AH, 09h
    INT 21h
     
    MOV DX, offset msj1 ;se imprime el msj
    MOV AH, 09h
    INT 21h
    
    MOV AH, 01h     ;Se lee el 1er. numero
    INT 21h
    MOV Numero2, AL   
             
    MOV DX, offset salto    ;se imprime el salto
    MOV AH, 09h
    INT 21h
     
    MOV DX, offset msj2 ;se imprime el msj
    MOV AH, 09h
    INT 21h
    
    MOV AH, 08h     ;espera el valor de una tecla
    INT 21h
    
    MOV AX, 0003h   ;Se limpia pantalla
    INT 10h 
    
    XOR AX, AX
    
    ; Convertirlos al valor real
    SUB Numero1, 30h
    SUB Numero2, 30h
    
    ; Preparar valores para el ciclo
    MOV CL, Numero2
      
    Multiplicar:
        ADD BL, Numero1
        LOOP Multiplicar      
        
    Imprimir:
        
        MOV DX, offset total
        MOV AH, 09h
        INT 21h
    
        MOV DX, offset salto    ;se imprime el salto
        MOV AH, 09h
        INT 21h
        
        XOR AX, AX
        
        MOV AL, BL
        DIV Diez
        MOV m1, AL
        MOV m2, AH
    
        ADD m1, 30h
        MOV DL, m1
        MOV AH, 02h
        INT 21h
        
        ADD m2, 30h
        MOV DL, m2
        MOV AH, 02h
        INT 21h

    ; finalizar
    Finalizar:
    MOV AH, 4ch
    INT 21h
    
END Programa