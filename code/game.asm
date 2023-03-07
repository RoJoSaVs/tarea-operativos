org 0x8000                          ; Posicion de memoria inicial del kernel
bits 16                             ; Cantidad de bits a utilizar

    jmp startProgram                ; Salta al inicio del programa
    nop                             ; Sin operacion

; Seccion de Variables
width dw  140h                      ; Ancho de la pantalla 320 p
height dw  0c8h                     ; Alto de la pantalla 200 p
gameWidht  dw  8ch                  ; Ancho de la pantall de juego 100 p
gameHeight dw  8ch                  ; Alto de la pantalla de juego 100 p

time db  00h                        ; Tiempo utilizado para el framerate del juego

level dw 01h                        ; Nivel del juego

random1 dw 00h                      ; Numero aleatorio 1
random2 dw 00h                      ; Numero aleatorio 2

gamePause dw 00h                    ; Indicador de juego en pausa (0 no, 1 si)


playerx dw  05h                      ; Posicion x del player 
playery dw  05h                      ; Posicion y del player
tPlayerx dw 05h                      ; Posicion temporal x del player
tPlayery dw 05h                      ; Posicion temporal y del player
playerv dw  0ah                      ; Velocidad del player
playerc dw  0eh                      ; Color del player
players dw  05h                      ; Altura y ancho del player
playerm dw  00h                      ; Ultima direccion del player (0 der, 1 aba, 2 izq, 3 arr)

bossx dw 41h                        ; Posicion x del jefe
bossy dw 41h                        ; Posicion y del jefe
bossc dw 04h                        ; Color del jefe
bosss dw 05h                        ; Tamano del jefe

wallsc1 dw 01h                      ; Color 1 de las paredes
wallsc2 dw 0bh                      ; Color 2 de las paredes
twallsc dw 00h                      ; Color actual a pintar
wallss dw 07h                       ; Altura y ancho de las paredes
wallsi dw 00h                       ; Indice para contar las paredes
wallx dw 00h                        ; Posicion x de la pared actual
wally dw 00h                        ; Posicion y de la pared actual

wallsx1 dw 035, 035, 035, 035, 035, 035, 035, 035, 035, 035, 035, 035, 045, 045, 055, 065, 065, 065, 065, 065, 065, 065, 065, 065, 065, 065, 065, 075, 075, 085, 085, 085, 085, 095, 095, 095, 095, 095, 095, 105, 105, 105, 105, 105, 105, 105, 105, 115, 115, 115, 115, 115, 125, 125, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 145, 145
wallsy1 dw 005, 015, 025, 035, 045, 055, 095, 105, 115, 125, 135, 145, 015, 145, 015, 015, 035, 045, 055, 065, 075, 085, 095, 105, 115, 125, 135, 015, 135, 095, 105, 115, 135, 025, 055, 065, 075, 085, 135, 025, 055, 085, 095, 105, 115, 125, 135, 025, 035, 045, 055, 085, 085, 105, 005, 015, 025, 035, 045, 055, 075, 085, 095, 105, 115, 125, 135, 145, 055, 075
wallsb1 times 140 dw 1; Paredes en pantalla (0 no, 1 celeste claro, 2 celeste oscuro) nivel 1
wallsa1 dw 140                      ; Cantidad de paredes nivel 1

wallsx2 dw 035, 035, 035, 035, 035, 035, 035, 055, 035, 035, 035, 035, 035, 035, 035, 045, 045, 055, 055, 055, 055, 055, 055, 055, 065, 065, 065, 075, 075, 075, 075, 075, 075, 075, 075, 085, 085, 095, 095, 095, 095, 095, 095, 095, 095, 095, 095, 105, 105, 115, 115, 115, 115, 115, 115, 115, 115, 115, 125, 125, 125, 135, 135, 135, 135, 135, 135, 135, 135, 135, 145 ; Posicion x de las paredes nivel 2
wallsy2 dw 005, 015, 025, 035, 045, 055, 065, 075, 085, 095, 105, 115, 125, 135, 145, 035, 115, 015, 035, 055, 065, 075, 115, 135, 015, 085, 135, 025, 035, 065, 075, 095, 105, 115, 135, 045, 135, 005, 015, 025, 055, 075, 085, 095, 115, 125, 145, 045, 105, 015, 035, 055, 065, 075, 085, 095, 115, 135, 015, 085, 135, 025, 035, 045, 055, 065, 075, 095, 115, 135, 125 ; Posicion y de las paredes nivel 2
wallsb2 times 142 dw 2; Paredes en pantalla (0 no, 1 celeste claro, 2 celeste oscuro) nivel 2
wallsa2 dw 142                      ; Cantidad de paredes nivel 2

wallsx times 71 dw 00h              ; Posicion x de las paredes
wallsy times 71 dw 00h              ; Posicion y de las paredes
wallsb times 71 dw 00h              ; Paredes en pantalla (0 no, 1 si)
wallsa dw 00h                       ; Cantidad de paredes

textColor     dw 09h

texti dw 00h
textx dw 00h
texty dw 94h

textControls0 dw '============CONTROLES============', 0h
textControls1 dw 'Mover Cursor...Flechas del teclado', 0h
textControls3 dw 'Pausa.........Tecla "L"', 0h
textControls4 dw 'Reiniciar.....Tecla "R"', 0h
textControls5 dw '=================================', 0h

textLevel1 dw 'Nivel: Principiante', 0h
textLevel2 dw 'Nivel: Avanzado', 0h

textMenu0 dw '====================================', 0h
textMenu1 dw '           MOBILE MAZE          ', 0h
textMenu2 dw '              PARTE I               ', 0h
textMenu3 dw '====================================', 0h
textMenu4 dw '     Presione SPACE para iniciar    ', 0h


textEnd0 dw '====================================', 0h
textEnd1 dw '          FELICITACIONES            ', 0h
textEnd2 dw '      HAS COMPLETADO EL JUEGO       ', 0h
textEnd3 dw '====================================', 0h
textEnd4 dw '   Presione SPACE para continuar    ', 0h


; Seccion de logica del juego
startProgram:                       ; Funcion de inicio del programa
    call    initializeDisplay       ; Llama a la funcion para inicializar el display
    call    clearScreen             ; Llama a la funcion para limpiar la pantalla
    jmp     menuLoop                ; Llama a la funcion del ciclo del menu

menuLoop:                           ; Ciclo principal del menu
    mov     ah, 00h                 ; Activa obtener el tiempo de la computadora
    int     1ah                     ; Ejecutar interrupcion

    cmp     dl, [time]              ; Compara el tiempo actual con el tiempo anterior
    je      menuLoop                ; Si son iguales vuelve a calcular el ciclo
    mov     [time], dl              ; Sino, almacena el nuevo tiempo
  
    call    checkPlayerMenuAction   ; Llama la funcion encargada de verificar teclas en el menu principal

    call    drawTextMenu            ; Llama a la funcion encargada de escribir texto del menu

    jmp     menuLoop                ; Salta al incio de la funcion

startGame:                          ; Funcion de inicio del juego
    call    setLevel1               ; Llama a la funcion para colocar los parametros del primer nivel
    call    clearScreen             ; Llama a la funcion para limpiar la pantalla
    jmp     gameLoop                ; Salta a la funcion principal del programa

advanceGame:                        ; Funcion encargada de avanzar el juego
    mov     ax, 01h                 ; Mueve 1 a ax
    cmp     [level], ax             ; Verifica si se gano el nivel 1 o 2
    je      advanceGameAux          ; Si fue el 1, avanza al 2
    jmp     endGame                 ; Si fue el 2, termina el juego

advanceGameAux:
    call    setLevel2               ; Llama a la funcion para colocar los parametros del segundo nivel
    call    clearScreen             ; Llama a la funcion para limpiar la pantalla
    jmp     gameLoop                ; Salta a la funcion principal del programa

gameLoop:                           ; Ciclo principal del juego
    mov     ah, 00h                 ; Activa obtener el tiempo de la computadora
    int     1ah                     ; Ejecutar interrupcion

    cmp     dl, [time]              ; Compara el tiempo actual con el tiempo anterior
    je      gameLoop                ; Si son iguales vuelve a calcular el ciclo
    mov     [time], dl              ; Sino, almacena el nuevo tiempo

    call    checkPlayerAction       ; Llama a la funcion para mover el player

    call    drawPlayer               ; Llama a la funcion para dibujar al player
    call    drawWalls               ; Llama a la funcion para dibujar las paredes
    call    drawBoss                ; Llama a la funcion para dibujar al jefe

    call    drawTextControls        ; Llama a la funcion encargada de escribir texto del juego

    jmp     gameLoop                ; Salta al incio de la funcion

endGame:                            ; Funcion de fin del juego
    call    clearScreen             ; Llama a la funcion para limpiar la pantalla
    jmp     endLoop                 ; Llama a la funcion del ciclo de fin del juego

endLoop:                            ; Ciclo principal del fin del juego
    mov     ah, 00h                 ; Activa obtener el tiempo de la computadora
    int     1ah                     ; Ejecutar interrupcion

    cmp     dl, [time]              ; Compara el tiempo actual con el tiempo anterior
    je      endLoop                 ; Si son iguales vuelve a calcular el ciclo
    mov     [time], dl              ; Sino, almacena el nuevo tiempo
  
    call    checkPlayerEndAction    ; Llama la funcion encargada de verificar teclas en el menu principal

    call    drawTextEnd             ; Llama a la funcion encargada de escribir texto del fin del juego

    jmp     endLoop                 ; Salta al incio de la funcion

initializeDisplay:                  ; Funcion requerida para inicializar el display
    mov     ah, 00h                 ; Activar el modo video
    mov     al, 13h                 ; 320x200 256 colores
    int     10h                     ; Ejecutar interrupcion
    ret                             ; Retornar

setLevel1:                          ; Funcion encargada de iniciar el primer nivel del juego
    mov     ax, 01h                 ; Mueve 1 a ax
    mov     [level], ax             ; Mueve ax al nivel actual

    mov     ax, 05h                 ; Mueve 5 a ax
    mov     [playerx], ax            ; Mueve el 5 a la posicion inicial x del player
    mov     ax, 41h
    mov     [playery], ax            ; Mueve el 5 a la posicion inicial y del player
    mov     [tPlayerx], ax           ; Mueve el 5 a la posicion inicial temporal x del player
    mov     [tPlayery], ax           ; Mueve el 5 a la posicion inicial temporal y del player

    mov     ax, 145                 ; Mueve un 145 a ax
    mov     [bossx], ax             ; Mueve el 145 a la posicion inicial x del jefe
    mov     ax, 41h                 ; Mueve un 65 a ax
    mov     [bossy], ax             ; Mueve el 65 a la posicion inicial y del jefe

    mov     ax, 00h                 ; Mueve 0 a ax
    mov     [gamePause], ax         ; Mueve el contenido de ax a la variable de pausa

    mov     ax, [wallsa1]           ; Mueve a ax cantidad de paredes de nivel 1
    mov     [wallsa], ax            ; Almacena la cantidad de paredes
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel1Aux            ; Salta a la funcion auxiliar

setLevel1Aux:
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes
    je      setLevel1Aux2           ; Si son iguales salta a la funcion auxiliar 2
    mov     bx, wallsx1             ; Mueve el puntero de posiciones x de paredes del nivel 1
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la pared actual a ax
    mov     bx, wallsx              ; Mueve el puntero de posiciones x de paredes
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel1Aux            ; Salta al inicio de esta funcion

setLevel1Aux2:
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel1Aux3           ; Salta a la funcion auxiliar 3

setLevel1Aux3:
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes
    je      setLevel1Aux4           ; Si son iguales salta a la funcion auxiliar 4
    mov     bx, wallsy1             ; Mueve el puntero de posiciones y de paredes del nivel 1
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la pared actual a ax
    mov     bx, wallsy              ; Mueve el puntero de posiciones y de paredes
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel1Aux3           ; Salta al inicio de esta funcion

setLevel1Aux4:
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel1Aux5           ; Salta a la funcion auxiliar 5

setLevel1Aux5:
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes
    je      exitRoutine             ; Si son iguales termina el ciclo
    mov     bx, wallsb1             ; Mueve el puntero de paredes del nivel 1
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la pared actual a ax
    mov     bx, wallsb              ; Mueve el puntero de posiciones de paredes
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel1Aux5           ; Salta al inicio de esta funcion


setLevel2:                          ; Funcion encargada de iniciar el segundo nivel del juego
    mov     ax, 02h                 ; Mueve 2 a ax
    mov     [level], ax             ; Mueve ax al nivel actual

    mov     ax, 05h                 ; Mueve 5 a ax
    mov     [playerx], ax            ; Mueve el 5 a la posicion inicial x del player
    mov     ax, 41h
    mov     [playery], ax            ; Mueve el 5 a la posicion inicial y del player
    mov     [tPlayerx], ax           ; Mueve el 5 a la posicion inicial temporal x del player
    mov     [tPlayery], ax           ; Mueve el 5 a la posicion inicial temporal y del player

    mov     ax, 91h                 ; Mueve un 145 a ax
    mov     [bossx], ax             ; Mueve el 145 a la posicion inicial x del jefe
    mov     [bossy], ax             ; Mueve el 145 a la posicion inicial y del jefe

    mov     ax, 00h                 ; Mueve 0 a ax
    mov     [gamePause], ax         ; Mueve el contenido de ax a la variable de pausa

    mov     ax, [wallsa2]           ; Mueve a ax cantidad de paredes de nivel 2
    mov     [wallsa], ax            ; Almacena la cantidad de paredes
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel2Aux            ; Salta a la funcion auxiliar

setLevel2Aux:
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes
    je      setLevel2Aux2           ; Si son iguales salta a la funcion auxiliar 2
    mov     bx, wallsx2             ; Mueve el puntero de posiciones x de paredes del nivel 2
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la pared actual a ax
    mov     bx, wallsx              ; Mueve el puntero de posiciones x de paredes
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel2Aux            ; Salta al inicio de esta funcion

setLevel2Aux2:
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel2Aux3           ; Salta a la funcion auxiliar 3

setLevel2Aux3:
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes
    je      setLevel2Aux4           ; Si son iguales salta a la funcion auxiliar 4
    mov     bx, wallsy2             ; Mueve el puntero de posiciones y de paredes del nivel 2
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la pared actual a ax
    mov     bx, wallsy              ; Mueve el puntero de posiciones y de paredes
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel2Aux3           ; Salta al inicio de esta funcion

setLevel2Aux4:
    mov     cx, 00h                 ; Mueve 0 a cx
    jmp     setLevel2Aux5           ; Salta a la funcion auxiliar 5

setLevel2Aux5:
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes
    je      exitRoutine           ; Si son iguales salta a la funcion auxiliar 6
    mov     bx, wallsb2             ; Mueve el puntero de paredes del nivel 2
    add     bx, cx                  ; Suma cx a bx
    mov     ax, [bx]                ; Mueve la posicion de la pared actual a ax
    mov     bx, wallsb              ; Mueve el puntero de posiciones de paredes
    add     bx, cx                  ; Suma cx a bx
    mov     [bx], ax                ; Almacena ax en el puntero de bx
    add     cx, 2                   ; Suma 2 a cx
    jmp     setLevel2Aux5           ; Salta al inicio de esta funcion


generateRandomNumber:               ; Funcion encargada de generar un numero
    mov     ah, 00h                 ; Activa obtener el tiempo de la computadora
    int     1ah                     ; Ejecutar interrupcion
    mov     ax, 0fh                 ; Mueve un 15 a ax
    and     ax, dx                  ; Hace un and entre el 15 y dl

    ret                             ; Retornar

;  Seccion de dibujo en pantalla
clearScreen:                        ; Funcion encargada de limpiar la pantala
    mov     cx, 00h                 ; Posicion inicial x
    mov     dx, 00h                 ; Posicion inicial y
    jmp     clearScreenAux          ; Salta a la funcion auxliar

clearScreenAux:
    mov     ah, 0ch                 ; Dibuja pixel
    mov     al, 00h                 ; Color negro
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion
    inc     cx                      ; Suma uno a cx
    cmp     cx, [width]             ; Compara cx con el ancho la pantalla
    jng     clearScreenAux          ; Si cx no es mayor que el ancho de la pantalla, salta a dibujar en la siguiente columna
    jmp     clearScreenAux2         ; Sino, salta a la funcion auxiliar 2

clearScreenAux2:                  
    mov     cx, 00h                 ; Reinicia las columnas
    inc     dx                      ; Suma uno a dx
    cmp     dx, [height]            ; Compara dx con la altura de la pantalla
    jng     clearScreenAux          ; Si dx no es mayor que el ancho de la pantalla, salta a dibujar la siguiente fila
    ret                             ; Sino, Retornar

deletePlayer:                        ; Funcion encargadad de eliminar el player en pantalla
    mov     al, 00h                 ; Mueve el color negro a al
    mov     [playerc], al            ; Guarda el color negro a playerc
    call    drawPlayer               ; Llama a la funcion para dibujar el player
    mov     al, 0eh                 ; Mueve el color verde a al
    mov     [playerc], al            ; Guarda el color verde a playerc
    ret                             ; Retornar

drawPlayer:                          ; Funcion encargada de dibujar el player
    mov     cx, [playerx]            ; Posicion inicial x del player
    mov     dx, [playery]            ; Posicion inicial y del player
    jmp     drawPlayerAux            ; Salta a la funcion auxliar

drawPlayerAux:
    mov     ah, 0ch                 ; Dibuja pixel
    mov     al, [playerc]            ; Color verde
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion
    inc     cx                      ; Suma uno a cx
    mov     ax, cx                  ; Mueve cx a ax
    sub     ax, [playerx]            ; Resta el ancho del player a la columna actual
    cmp     ax, [players]            ; Compara resultado de la resta con el ancho
    jng     drawPlayerAux            ; Si ax no es mayor que el ancho del player, salta a dibujar en la siguiente columna
    jmp     drawPlayerAux2           ; Sino, salta a la funcion auxiliar 2

drawPlayerAux2:                  
    mov     cx, [playerx]            ; Reinicia las columnas
    inc     dx                      ; Suma uno a dx
    mov     ax, dx                  ; Mueve dx a ax
    sub     ax, [playery]            ; Resta el alto del player a la fila actual
    cmp     ax, [players]            ; Compara resultado de la resta con la altura
    jng     drawPlayerAux            ; Si ax no es mayor que el ancho del player, salta a dibujar la siguiente fila
    ret                             ; Sino, Retornar

drawBoss:                           ; Funcion encargada de dibujar al jefe
    mov     cx, [bossx]             ; Posicion inicial x del jefe
    mov     dx, [bossy]             ; Posicion inicial y del jefe
    jmp     drawBossAux             ; Salta a la funcion auxliar

drawBossAux:
    mov     ah, 0ch                 ; Dibuja pixel
    mov     al, [bossc]             ; Color rojo
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion
    inc     cx                      ; Suma uno a cx
    mov     ax, cx                  ; Mueve cx a ax
    sub     ax, [bossx]             ; Resta el ancho del jefe a la columna actual
    cmp     ax, [bosss]             ; Compara resultado de la resta con el ancho
    jng     drawBossAux             ; Si ax no es mayor que el ancho del jefe, salta a dibujar en la siguiente columna
    jmp     drawBossAux2            ; Sino, salta a la funcion auxiliar 2

drawBossAux2:                  
    mov     cx, [bossx]             ; Reinicia las columnas
    inc     dx                      ; Suma uno a dx
    mov     ax, dx                  ; Mueve dx a ax
    sub     ax, [bossy]             ; Resta el alto del jefe a la fila actual
    cmp     ax, [bosss]             ; Compara resultado de la resta con la altura
    jng     drawBossAux             ; Si ax no es mayor que el ancho del jefe, salta a dibujar la siguiente fila
    ret                             ; Sino, Retornar

drawWalls:                          ; Funcion encargada de dibujar las paredes
    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    cmp     cx, [wallsa]            ; Compara el contador con la cantidad de paredes del primer nivel
    je      exitWalls               ; Si son iguales salta a la funcion de salida

    mov     bx, wallsb              ; Mueve el puntero del primer elemento de la lista que indica si una pared esta activa o no
    add     bx, cx                  ; Suma el contador al puntero

    mov     ax, [bx]                ; Obtiene la pared actual
    cmp     ax, 00h                 ; Compara la pared con 0 para ver si tiene que ser dibujada
    je      drawWallsAux            ; En caso de que no salta a la funcion auxiliar
    jmp     drawWallsAux2           ; Sino, salta a la funcion auxiliar 2

drawWallsAux:
    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    add     cx, 02h                 ; Suma 2 a cx
    mov     [wallsi], cx            ; Guarda el nuevo contador

    jmp     drawWalls               ; Salta a la funcion de dibujo principal

drawWallsAux2:
    cmp     ax, 02h                 ; Compara la pared con 2 para ver de que color es
    je      drawWallsAux3           ; Si tiene toda la vida salta a la funcion auxiliar 3
    jmp     drawWallsAux4           ; Si tiene la mitad de la vida salta a la funcion auxiliar 4

drawWallsAux3:
    mov     ax, [wallsc1]           ; Mueve el color de pared 1 a ax
    mov     [twallsc], ax           ; Almacena ax en el color temporal de pared
    jmp     drawWallsAux5           ; Salta a la funcion auxiliar 5

drawWallsAux4:
    mov     ax, [wallsc2]           ; Mueve el color de pared 2 a ax
    mov     [twallsc], ax           ; Almacena ax en el color temporal de pared
    jmp     drawWallsAux5           ; Salta a la funcion auxiliar 5

drawWallsAux5:
    mov     ax, [wallsi]            ; Mueve el contador de las paredes a ax

    mov     bx, wallsx              ; Mueve el puntero del primer elemento de la lista de las posiciones x de las paredes
    add     bx, ax                  ; Suma el contador al puntero
    mov     ax, [bx]                ; Obtiene la posicion x de la pared actual
    mov     [wallx], ax             ; La almacena en la variable que contiene la posicion x de la pared actual
    mov     cx, [wallx]             ; Mueve la posicion inicial x a cx

    mov     ax, [wallsi]            ; Mueve el contador de las paredes a ax

    mov     bx, wallsy              ; Mueve el puntero del primer elemento de la lista de las posiciones y de las paredes
    add     bx, ax                  ; Suma el contador al puntero
    mov     ax, [bx]                ; Obtiene la posicion y de la pared actual
    mov     [wally], ax             ; La almacena en la variable que contiene la posicion y de la pared actual
    mov     dx, [wally]             ; Mueve la posicion inicial y a dx

    jmp     drawWallsAux6           ; Salta a la funcion auxliar 6

drawWallsAux6:
    mov     ah, 0ch                 ; Dibuja pixel
    mov     al, [twallsc]           ; Color de la pared
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion
    inc     cx                      ; Suma uno a cx
    mov     ax, cx                  ; Mueve cx a ax
    sub     ax, [wallx]             ; Resta el ancho de la pared a la columna actual
    cmp     ax, [wallss]            ; Compara resultado de la resta con el ancho
    jng     drawWallsAux6           ; Si ax no es mayor que el ancho de la pared, salta a dibujar en la siguiente columna
    jmp     drawWallsAux7           ; Sino, salta a la funcion auxiliar 2

drawWallsAux7:                  
    mov     cx, [wallx]             ; Reinicia las columnas
    inc     dx                      ; Suma uno a dx
    mov     ax, dx                  ; Mueve dx a ax
    sub     ax, [wally]             ; Resta el alto de la pared a la fila actual
    cmp     ax, [wallss]            ; Compara resultado de la resta con la altura
    jng     drawWallsAux6           ; Si ax no es mayor que el ancho de la pared, salta a dibujar la siguiente fila
    jmp     drawWallsAux            ; Sino, salta a la funcion auxliar

exitWalls:
    mov     ax, 00h                 ; Mueve un 0 a ax
    mov     [wallsi], ax            ; Lo almacena en el contador de las paredes

    ret                             ; Retornar


drawTextEnd:                        ; Funcion encargada de escribir los textos del fin del juego
    mov     bx, [textColor]         ; Mueve a bx el color del texto
    inc     bx                      ; Incrementa bx
    mov     [textColor], bx         ; Almacena el nuevo bx al color del texto

    mov     bx, textEnd0            ; Mueve a bx el puntero del primer texto
    mov     dh, 07h                 ; Mueve a dh un 7
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textEnd1            ; Mueve a bx el puntero del segundo texto
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textEnd2            ; Mueve a bx el puntero del tercer texto
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textEnd3            ; Mueve a bx el puntero del cuarto texto
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dh un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textEnd4            ; Mueve a bx el puntero del quinto texto
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    ret                             ; Retornar

drawTextMenu:                       ; Funcion encargada de escribir los textos del menu
    mov     bx, [textColor]         ; Mueve a bx el color del texto
    inc     bx                      ; Incrementa bx
    mov     [textColor], bx         ; Almacena el nuevo bx al color del texto

    mov     bx, textMenu0           ; Mueve a bx el puntero del primer texto
    mov     dh, 07h                 ; Mueve a dh un 7
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textMenu1           ; Mueve a bx el puntero del segundo texto
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textMenu2           ; Mueve a bx el puntero del tercer texto
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textMenu3           ; Mueve a bx el puntero del cuarto texto
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textMenu4           ; Mueve a bx el puntero del quinta texto
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    inc     dh                      ; Incrementa dh
    mov     dl, 02h                 ; Mueve a dl un 2
    call    drawText                ; Llama a la funcion encargada de escribir texto

    ret

drawTextControls:                   ; Funcion encargada de escribir los textos del juego
    mov     bx, 0fh                 ; Mueve a bx un 15
    mov     [textColor], bx         ; Almacena bx al color del texto

    mov     bx, textControls0       ; Mueve a bx el puntero del primer texto
    mov     dh, 93h                 ; Mueve a dh un 147
    mov     dl, 03h                 ; Mueve a dl un 3
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textControls1       ; Mueve a bx el puntero del segundo texto
    inc     dh                      ; Incrementa dh
    mov     dl, 03h                 ; Mueve a dl un 3
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textControls3       ; Mueve a bx el puntero del cuarto texto
    inc     dh                      ; Incrementa dh
    mov     dl, 03h                 ; Mueve a dl un 3
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     bx, textControls4       ; Mueve a bx el puntero del quinto texto
    inc     dh                      ; Incrementa dh
    mov     dl, 03h                 ; Mueve a dl un 3
    call    drawText                ; Llama a la funcion encargada de escribir texto


    mov     bx, textControls5       ; Mueve a bx el puntero del sexto texto
    inc     dh                      ; Incrementa dh
    mov     dl, 03h                 ; Mueve a dl un 3
    call    drawText                ; Llama a la funcion encargada de escribir texto

    mov     ax, [level]             ; Mueve a ax el nivel actual
    cmp     ax, 01h                 ; Compara ax con 1
    je      drawTextLevel1          ; Salta a la funcion para dibujar el texto del primer nivel
    jmp     drawTextLevel2          ; Salta a la funcion para dibujar el texto del segundo nivel


drawTextLevel1:                     ; Funcion encargada de escribir el texto del primer nivel
    mov     bx, textLevel1          ; Mueve a bx el puntero del primer texto
    mov     dh, 03h                 ; Mueve a dh un 3
    mov     dl, 14h                 ; Mueve a dl un 20
    call    drawText                ; Llama a la funcion encargada de escribir texto

    ret                             ; Retornar

drawTextLevel2:                     ; Funcion encargada de escribir el texto del segundo nivel
    mov     bx, textLevel2          ; Mueve a bx el puntero del segundo texto
    mov     dh, 03h                 ; Mueve a dh un 3
    mov     dl, 14h                 ; Mueve a dl un 20
    call    drawText                ; Llama a la funcion encargada de escribir texto

    ret                             ; Retornar

drawText:                           ; Funcion encargada de dibujar texto
    cmp     byte [bx],0             ; Compara el byte que contiene bx con 0
    jz      finishDraw              ; Si es igual a cero, salta a la funcion de salida
    jmp     drawChar                ; Sino salta a dibujar un caracter

drawChar:                           ; Funcion encargada de dibujar un caracter
    push    bx                      ; Hace un push de bx
    mov     ah, 02h                 ; Mueve a ah un 2
    mov     bh, 00h                 ; Mueve a bh un 0
    int     10h                     ; Ejecutar interrupcion
    pop     bx                      ; Hace pop a bx

    push    bx                      ; Hace push a bx
    mov     al, [bx]                ; Mueve el cnotenido de bx a al
    mov     ah, 0ah                 ; Mueve a ah un 10
    mov     bh, 00h                 ; Mueve a bh un 0
    mov     bl, [textColor]         ; Mueve el color de texto a bl
    mov     cx, 01h                 ; Mueve a cx un 1
    int     10h                     ; Ejecutar interrupcion
    pop     bx                      ; Hace pop a bx

    inc     bx                      ; Incrementa bx
    inc     dl                      ; Incrementa dl
    jmp     drawText                ; Salta a la funcion de dibujar texto

finishDraw:                         ; Funcion de salida de texto
    ret                             ; Retornar

; Seccion de lectura del teclado
checkPlayerAction:                  ; Funcion encargada de verificar si el juego esta en pausa
    mov     ax, 00h                 ; Mueve un 0 a ax
    cmp     ax, [gamePause]         ; Verifica si la variable de pausa es 0
    je      makeMovements           ; En caso de que si, el juego no esta en pausa y salta a realizar movimientos
    jmp     checkPlayerPauseAction  ; Sino, el juego esta en pausa y salta a detectar la tecla para quitar la pausa

makeMovements:                      ; Funcion encargada de realizar movimientos en pantalla y deteccion de teclas

    mov     ah, 01h                 ; Consigue el estado del teclado
    int     16h                     ; Ejecutar interrupcion
    jz      exitRoutine             ; Si no se esta presionando nada, salta a salir
    
    mov     ah, 00h                 ; Lectura de tecla
    int     16h                     ; Ejecutar interrupcion

    cmp     ah, 48h                 ; Si la tecla presionada es la Flecha Arriba
    je      movePlayerUp             ; Salta a mover el player hacia arriba
    
    cmp     ah, 50h                 ; Si la tecla presionada es la Flecha Abajo
    je      movePlayerDown           ; Salta a mover el player hacia abajo

    cmp     ah, 4dh                 ; Si la tecla presionada es la Flecha Derecha
    je      movePlayerRight          ; Salta a mover el player hacia la derecha

    cmp     ah, 4bh                 ; Si la tecla presionada es la Flecha Izquierda
    je      movePlayerLeft           ; Salta a mover el player hacia la izquierda

    cmp     ah, 26h                 ; Si la tecla presionada es l
    je      pauseGame               ; Pausa el juego

    cmp     ah, 6ch                 ; Si la tecla presionada es L
    je      pauseGame               ; Pausa el juego

    cmp     ah, 13h                 ; Si la tecla presionada es r
    je      resetGame               ; Reinicia el juego

    cmp     ah, 72h                 ; Si la tecla presionada es R
    je      resetGame               ; Reinicia el juego

    ret                             ; Sino, Retornar

checkPlayerMenuAction:              ; Funcion encargada de verificar la tecla presionada en el menu
    mov     ah, 01h                 ; Consigue el estado del teclado
    int     16h                     ; Ejecutar interrupcion
    jz      exitRoutine             ; Si no se esta presionando nada, salta a salir
    
    mov     ah, 00h                 ; Lectura de tecla
    int     16h                     ; Ejecutar interrupcion

    cmp     ah, 39h                 ; Si la tecla presionada es Espacio
    je      startGame               ; Inicia el juego

    ret

checkPlayerEndAction:               ; Funcion encargada de verificar la tecla presionada en el fin del juego
    mov     ah, 01h                 ; Consigue el estado del teclado
    int     16h                     ; Ejecutar interrupcion
    jz      exitRoutine             ; Si no se esta presionando nada, salta a salir
    
    mov     ah, 00h                 ; Lectura de tecla
    int     16h                     ; Ejecutar interrupcion

    cmp     ah, 39h                 ; Si la tecla presionada es Espacio
    je      startProgram            ; Vuelve a la pantalla de inicio del juego

    ret

checkPlayerPauseAction:             ; Funcion encargada de verificar el fin de la pausa
    mov     ah, 01h                 ; Consigue el estado del teclado
    int     16h                     ; Ejecutar interrupcion
    jz      exitRoutine             ; Si no se esta presionando nada, salta a salir
    
    mov     ah, 00h                 ; Lectura de tecla
    int     16h                     ; Ejecutar interrupcion

    cmp     ah, 26h                 ; Si la tecla presionada es l
    je      unPauseGame             ; Quita la pausa del juego

    cmp     ah, 6ch                 ; Si la tecla presionada es L
    je      unPauseGame             ; Quita la pausa del juego

    ret                             ; Sino, Retornar

pauseGame:                          ; Funcion encargada de pausar el juego
    mov     ax, 01h                 ; Mueve 1 a ax
    mov     [gamePause], ax         ; Asigna ax a la variable de pausa del juego
    ret                             ; Retornar

unPauseGame:                        ; Funcion encargada de quitar la pausa del juego
    mov     ax, 00h                 ; Mueve 0 a ax
    mov     [gamePause], ax         ; Asigna ax a la variable de pausa del juego
    ret                             ; Retornar

resetGame:                          ; Funcion encargada de reiniciar el juego
    call    clearScreen             ; Llama a la funcion encargada de eliminar el player
    call    setLevel1               ; Llama a la funcion encargada de setear los parametros del primer nivel
    jmp     gameLoop                ; Salta a la funcion de juego principal

exitRoutine:                        ; Funcion encargada de retornar
    ret                             ; Retornar

; Seccion de movimiento, logica y colisiones
movePlayerUp:                        ; Funcion encargada de mover el player hacia arriba
    mov     ax, 05h                 ; Mueve 5 a ax
    cmp     [playery], ax            ; Compara la posicion y del player con ax
    je      exitRoutine             ; Si son iguales, salta a la funcion de salida

    call    deletePlayer             ; Llama a la funcion encargada de eliminar el player

    mov     ax, [playery]            ; Mueve la posicion y del player a ax
    sub     ax, [playerv]            ; Resta la velocidad del player a ax
    mov     [tPlayery], ax           ; Almacena la nueva posicion en una variable temporal
    call    checkPlayerColision      ; Llama a la funcion para detectar colisiones del player

    cmp     ax, 00h                 ; Verifica si ax es 0
    je      exitPlayerMovement       ; En caso de serlo, significa que la nueva posicion es invalida, y salta a la funcion de salida

    mov     [playery], ax            ; Sino, almacena ax en la posicion y del player
    
    mov     ax, 03h                 ; Mueve 3 a ax
    mov     [playerm], ax            ; Almacena ax a la ultima direccion del player

    ret                             ; Retornar

movePlayerDown:                      ; Funcion encargada de mover el player hacia abajo
    mov     ax, [gameHeight]        ; Mueve el alto del juego a ax
    add     ax, 05h                 ; Suma 5 a ax
    cmp     [playery], ax            ; Compara la posicion y del player con el alto del juego
    je      exitRoutine             ; Si son iguales, salta a la funcion de salida

    call    deletePlayer             ; Llama a la funcion encargada de eliminar el player

    mov     ax, [playery]            ; Mueve la posicion y del player a ax
    add     ax, [playerv]            ; Suma la velocidad del player a ax
    mov     [tPlayery], ax           ; Almacena la nueva posicion en una variable temporal
    call    checkPlayerColision      ; Llama a la funcion para detectar colisiones del player

    cmp     ax, 00h                 ; Verifica si ax es 0
    je      exitPlayerMovement       ; En caso de serlo, significa que la nueva posicion es invalida, y salta a la funcion de salida

    mov     [playery], ax            ; Sino, almacena ax en la posicion y del player

    mov     ax, 01h                 ; Mueve 1 a ax
    mov     [playerm], ax            ; Almacena ax a la ultima direccion del player

    ret                             ; Retornar

movePlayerRight:                     ; Funcion encargada de mover el player hacia la derecha
    mov     ax, [gameWidht]         ; Mueve el ancho del juego a ax
    add     ax, 05h                 ; Suma 5 a ax
    cmp     [playerx], ax            ; Compara la posicion x del player con el ancho del juego
    je      exitRoutine             ; Si son iguales, salta a la funcion de salida

    call    deletePlayer             ; Llama a la funcion encargada de eliminar el player

    mov     ax, [playerx]            ; Mueve la posicion x del player a ax
    add     ax, [playerv]            ; Suma la velocidad del player a ax
    mov     [tPlayerx], ax           ; Almacena la nueva posicion en una variable temporal
    call    checkPlayerColision      ; Llama a la funcion para detectar colisiones del player

    cmp     ax, 00h                 ; Verifica si ax es 0
    je      exitPlayerMovement       ; En caso de serlo, significa que la nueva posicion es invalida, y salta a la funcion de salida

    mov     [playerx], ax            ; Sino, almacena ax en la posicion x del player

    mov     ax, 00h                 ; Mueve 0 a ax
    mov     [playerm], ax            ; Almacena ax a la ultima direccion del player

    ret                             ; Retornar

movePlayerLeft:                      ; Funcion encargada de mover el player hacia la izquierda
    mov     ax, 05h                 ; Mueve 5 a ax
    cmp     [playerx], ax            ; Compara la posicion x del player con ax
    je      exitRoutine             ; Si son iguales, salta a la funcion de salida

    call    deletePlayer             ; Llama a la funcion encargada de eliminar el player

    mov     ax, [playerx]            ; Mueve la posicion x del player a ax
    sub     ax, [playerv]            ; Resta la velocidad del player a ax
    mov     [tPlayerx], ax           ; Almacena la nueva posicion en una variable temporal
    call    checkPlayerColision      ; Llama a la funcion para detectar colisiones del player

    cmp     ax, 00h                 ; Verifica si ax es 0
    je      exitPlayerMovement       ; En caso de serlo, significa que la nueva posicion es invalida, y salta a la funcion de salida

    mov     [playerx], ax            ; Sino, almacena ax en la posicion x del player

    mov     ax, 02h                 ; Mueve 2 a ax
    mov     [playerm], ax            ; Almacena ax a la ultima direccion del player

    ret                             ; Retornar

exitPlayerMovement:
    mov     ax, [playerx]            ; Mueve la posicion x del player a ax
    mov     [tPlayerx], ax           ; Almacena ax a la posicion temporal x del player
    mov     ax, [playery]            ; Mueve la posicion y del player a ax
    mov     [tPlayery], ax           ; Almacena ax a la posicion temporal y del player

    ret                             ; Retornar

checkPlayerColision:                 ; Funcion encargada de verificar las colisiones del player
    push    ax                      ; Almacena ax en el stack
    mov     cx, [tPlayerx]           ; Mueve la posicion temporal del player x
    mov     dx, [tPlayery]           ; Mueve la posicion temporal del player y
    mov     ah, 0dh                 ; Lee pixel
    mov     bh, 00h                 ; Pagina
    int     10h                     ; Ejecutar interrupcion

    cmp     al, [wallsc1]           ; Compara el pixel leido con el color 1 de la pared
    je      checkPlayerWallColision  ; En caso de que se cumpla, salta a la funcion de colision de paredes
    cmp     al, [wallsc2]           ; Compara el pixel leido con el color 2 de la pared
    je      checkPlayerWallColision  ; En caso de que se cumpla, salta a la funcion de colision de paredes
    cmp     al, [bossc]             ; Compara el pixel leido con el color del jefe
    je      advanceGame               ; En caso de que se cumpla, reinica el juego

    pop     ax                      ; Restaura ax del stack
    ret                             ; Retornar


checkPlayerWallColision:             ; Funcion encargada de verificar colisiones del player con las paredes
    pop     ax                      ; Restaura ax del stack
    jmp     checkPlayerWallColisionAux ; Salta a la funcion auxiliar

checkPlayerWallColisionAux:
    mov     bx, wallsx              ; Mueve a bx el puntero de las posiciones x de las paredes
   
    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    add     bx, cx                  ; Suma el contador al puntero de posiciones x
    mov     dx, [bx]                ; Mueve a dx la posicion x de la pared

    cmp     dx, [tPlayerx]           ; Compara la posicion x de la pared con la del player
    je      checkPlayerWallColisionAux2 ; Salta a la funcion auxiliar 2
    jmp     checkPlayerWallColisionAux4 ; Salta a la funcion auxiliar 4

checkPlayerWallColisionAux2:
    mov     bx, wallsy              ; Mueve a bx el puntero de las posiciones y de las paredes

    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    add     bx, cx                  ; Suma el contador al puntero de posiciones y
    mov     dx, [bx]                ; Mueve a dx la posicion x de la pared

    cmp     dx, [tPlayery]           ; Compara la posicion y de la pared con la del player
    je      checkPlayerWallColisionAux3 ; Salta a la funcion auxiliar 3
    jmp     checkPlayerWallColisionAux4 ; Salta a la funcion auxiliar 4

checkPlayerWallColisionAux3:
    mov     ax, 00h                 ; Mueve un 0 a ax

    ret                             ; Retornar

checkPlayerWallColisionAux4:
    mov     cx, [wallsi]            ; Mueve el contador de las paredes a cx
    add     cx, 02h                 ; Suma 2 a cx
    mov     [wallsi], cx            ; Mueve cx al contador de paredes

    jmp     checkPlayerWallColisionAux ; Salta a la primer funcion

times   (512*10)-($-$$) db 0         ; Tamaño del codigo