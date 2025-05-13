section .data:
  ; Espacio reservado para resultado.
  buffer db "00000", 0

section .test:
  global _start

  _start:
    ; Empezamos el programa.
    ; Pedimos al usuario el numero a factorizar.

    
    ; Calculamos el factorial de n.
    mov eax, 5
    call factorial

    ; Convertimos el numero en eax a una cadena.
    mov ebx, eax                  ; Guardamos factorial en ebx.
    mov ecx, buffer + 4           ; Comenzamos desde final de buffer.

    .convert:
    xor edx, edx                  ; Limpiamos edx.
    mov eax, ebx
    mov ecx, 10                   ; Divisor 10.
    div ecx                       ; eax = eax / 10, edx = eax % 10.
    add dl, '0'                   ; Convertimos el digito a ASCII.
    mov [ecx], dl                 ; Guardo digito en buffer.
    mov ebx, eax                  ; Actualizo ebx con el cociente.
    dec ecx                       ; Movemos al siguiente caracter.
    test eax, eax                 ; ¿Terminamos de Dividir?
    jnz .convert                   ; Si no es 0, seguimos.

    inc ecx                       ; Apuntamos al primer digito.

    ; Imprimimos numero.
    mov eax, 4                    ; sys_write
    mov ebx, 1                    ; std_out
    mov edx, buffer + 4           ; longitud numero.
    sub edx, ecx                  ; Calculo longitud real
    int 0x80

    ; Salgo del programa.
    mov eax, 1
    xor ebx, ebx
    int 0x80

  factorial:
    ; Chequeamos que num sea 0.
    cmp eax, 0
    jz end_recursion

    ; Guardamos el valor actual de eax.
    push eax

    ; Decremento eax y comienzo el llamado recursivo-
    dec eax
    call factorial

    ; Multiplico resultado en eax con el vlor en ebx
    pop ebx
    imul eax, ebx
    
    ret
  
  end_recursion:
    ; Retornamos 1 cuando eax es 0 (Condicion Base=
    mov eax, 1
    ret