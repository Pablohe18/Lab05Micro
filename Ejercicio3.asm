.MODEL small
.DATA
    Saludo DB 'Factor de un numero$'
    msj DB 'Ingrese un Numeroero:$'
    msj1 DB 'Presione cualquier tecla...$'
    Numero  DB ?
    N1  DB ?
    N2  DB ?
    jumper DB 13,10, "$"
    diez DB 10d
    Total DB 'Total$' 
.CODE

Programa:
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, Offset Saludo
    MOV AH, 09h
    INT 21h
    
    MOV DX, Offset jumper
    MOV AH, 09h
    INT 21h
    
    MOV DX, Offset msj
    MOV AH, 09h
    INT 21h
    
    ; Leer Numeroeros
    XOR AX, AX
    
    MOV AH, 01h     ;Se lee el 1er.Numeroero
    INT 21h
    SUB AL, 30h     ;resto 30h para obtener el valor real.
    
    MUL diez        ;Se multiplica por 10 para almacenar en AL las decenas.
    MOV Numero, AL
    
    MOV AH, 01h     ;Se lee el 2do.Numeroero
    INT 21h
    SUB AL, 30h     ;resto 30h para obtener el valor real.
    ADD Numero, AL     ;Se suma el 2do. Numeroero al primero para obtener el Numeroero completo.

    MOV CL, Numero     ;se le asigna a CL el valor de Numero
    
    MOV DX, Offset jumper
    MOV AH, 09h
    INT 21h
    
    MOV DX, Offset msj1
    MOV AH, 09h
    INT 21h
    
    MOV AH, 08h     ;espera una tecla
    INT 21h
    
    MOV AX, 0003h   ;Se limpia pantalla
    INT 10h
    
    MOV DX, offset Total
    MOV AH, 09h
    INT 21h
    
    MOV DX, Offset jumper
    MOV AH, 09h
    INT 21h
    
    fact:
    XOR AX, AX      ;Se limpia el registro
    MOV AL, Numero
    DIV CL          ;Se divide el Numero dentro de CL que se ira decrementando
    CMP AH, 0h      ;Se compara si la resta es 0
    JZ  Print
    Retorno:
    LOOP fact
    JMP Fin
    
    Print:
    
    MOV DX, offset jumper    ;se imprime el jumper
    MOV AH, 09h
    INT 21h
    
    XOR AX, AX              ;limpia el registro
    MOV AL, CL 
    DIV Diez                ;Se divide dentro de diez para obtener unidades y decenas
    MOV N1, AL
    MOV N2, AH
    
    ADD N1, 30h             ;Se imprime el primer Numeroero
    MOV DL, N1
    MOV AH, 02h
    INT 21h

    ADD N2, 30h             ;Se imprime el segundo Numeroero
    MOV DL, N2
    MOV AH, 02h
    INT 21h
    
    JMP Retorno
    
    ; Fin
    Fin:
    MOV AH, 4ch
    INT 21h
    
END Programa