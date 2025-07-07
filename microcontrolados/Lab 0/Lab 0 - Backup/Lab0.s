; Definição das constantes
LISTA_START     EQU     0x20000D00  ; Endereço de início da lista
PRIMOS_START    EQU     0x20000E00  ; Endereço de início dos primos

; Definição das variáveis
lista_ptr       DCDU     LISTA_START  ; Ponteiro para a lista
primos_ptr      DCDU     PRIMOS_START ; Ponteiro para os primos
lista_size      DCD     10          ; Tamanho da lista em bytes

; Código principal
                AREA    RESET, CODE
                ENTRY

Reset_Handler   PROC
                ; Configuração da memória RAM
                LDR     r0, =0x08000000
                LDR     r1, =0x10000
                BL      __main
                ; Inicialização dos ponteiros
                LDR     r1, =lista_ptr
                LDR     r2, =primos_ptr
                LDR     r3, =lista_size
                ; Cópia da lista para a nova região da memória
                BL      memcpy
                ; Encontrar os primos na lista e ordená-los
                BL      encontrar_primos
                BL      ordenar_primos
                ; Finalização do programa
                B       .

; Subrotina para copiar a lista
memcpy          PROC
                PUSH    {lr}        ; Salvar o endereço de retorno
                LDR     r4, [r1]    ; Carregar o ponteiro para a lista
                LDR     r5, [r2]    ; Carregar o ponteiro para a nova região
                LDR     r6, [r3]    ; Carregar o tamanho da lista
                ; Loop de cópia dos bytes
                Loop    CMP     r6, #0
                        BEQ     End
                        LDRB    r0, [r4], #1
                        STRB    r0, [r5], #1
                        SUBS    r6, r6, #1
                        B       Loop
                ; Retorno da subrotina
                End     POP     {pc}

; Subrotina para encontrar os números primos na lista
encontrar_primos PROC
                PUSH    {lr}        ; Salvar o endereço de retorno
                ; Implementar a lógica de encontrar os primos
                ; Os resultados serão armazenados na nova região da memória
                POP     {pc}

; Subrotina para ordenar os números primos em ordem crescente
ordenar_primos PROC
                PUSH    {lr}        ; Salvar o endereço de retorno
                ; Implementar a lógica de ordenar os primos
                ; Os resultados serão armazenados na nova região da memória
                POP     {pc}
                END