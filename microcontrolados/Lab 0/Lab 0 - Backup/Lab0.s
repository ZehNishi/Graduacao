; Defini��o das constantes
LISTA_START     EQU     0x20000D00  ; Endere�o de in�cio da lista
PRIMOS_START    EQU     0x20000E00  ; Endere�o de in�cio dos primos

; Defini��o das vari�veis
lista_ptr       DCDU     LISTA_START  ; Ponteiro para a lista
primos_ptr      DCDU     PRIMOS_START ; Ponteiro para os primos
lista_size      DCD     10          ; Tamanho da lista em bytes

; C�digo principal
                AREA    RESET, CODE
                ENTRY

Reset_Handler   PROC
                ; Configura��o da mem�ria RAM
                LDR     r0, =0x08000000
                LDR     r1, =0x10000
                BL      __main
                ; Inicializa��o dos ponteiros
                LDR     r1, =lista_ptr
                LDR     r2, =primos_ptr
                LDR     r3, =lista_size
                ; C�pia da lista para a nova regi�o da mem�ria
                BL      memcpy
                ; Encontrar os primos na lista e orden�-los
                BL      encontrar_primos
                BL      ordenar_primos
                ; Finaliza��o do programa
                B       .

; Subrotina para copiar a lista
memcpy          PROC
                PUSH    {lr}        ; Salvar o endere�o de retorno
                LDR     r4, [r1]    ; Carregar o ponteiro para a lista
                LDR     r5, [r2]    ; Carregar o ponteiro para a nova regi�o
                LDR     r6, [r3]    ; Carregar o tamanho da lista
                ; Loop de c�pia dos bytes
                Loop    CMP     r6, #0
                        BEQ     End
                        LDRB    r0, [r4], #1
                        STRB    r0, [r5], #1
                        SUBS    r6, r6, #1
                        B       Loop
                ; Retorno da subrotina
                End     POP     {pc}

; Subrotina para encontrar os n�meros primos na lista
encontrar_primos PROC
                PUSH    {lr}        ; Salvar o endere�o de retorno
                ; Implementar a l�gica de encontrar os primos
                ; Os resultados ser�o armazenados na nova regi�o da mem�ria
                POP     {pc}

; Subrotina para ordenar os n�meros primos em ordem crescente
ordenar_primos PROC
                PUSH    {lr}        ; Salvar o endere�o de retorno
                ; Implementar a l�gica de ordenar os primos
                ; Os resultados ser�o armazenados na nova regi�o da mem�ria
                POP     {pc}
                END