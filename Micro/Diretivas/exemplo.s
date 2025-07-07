; Exemplo.s
; Desenvolvido para a placa EK-TM4C1294XL

; -------------------------------------------------------------------------------
; Declarações EQU
;<NOME>         EQU <VALOR>

; -------------------------------------------------------------------------------

		AREA  DATA, ALIGN=2
			
STR_2 SPACE 6 ;vetor com 6 bytes
STR_3 SPACE 6 ;vetor com 6 bytes
V1 DCW 0x00
V2 DCD 0x00
		
        AREA    |.text|, CODE, READONLY, ALIGN=2
        THUMB
			
		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT Start                ; Permite chamar a função Start a partir de 
			                        ; outro arquivo. No caso startup.s
									
		; Se chamar alguma função externa	
        ;IMPORT <func>              ; Permite chamar dentro deste arquivo uma 
									; função <func>

; --------------------------------------------------------------------------------
BOLA EQU 10 ; equivalente aos "defines"
JOGADOR EQU 20 ; equivalente aos "defines"
MESA EQU 0x30 ; equivalente aos "defines"


Start
   MOV R0, #BOLA
   MOV R1, #JOGADOR

   LDR  R2, =CONST_2 ; com =, pega endereço do primeiro elemento
   LDR  R3, CONST_3 ; sem =, pega valor de 32b
   
   LDR  R5, =0x20000001
   STR R1, [R5], #1
   LDR  R5, =VETOR_1 ; com =, pega endereço do primeiro elemento
   LDRB R6, [R5], #1
   LDR  R5, =VETOR_2
   LDRB R6, [R5], #1

   ;STRB R0, [R5] ; nao funcionaria, pois STR_1 está na ROM.
   
   LDR R7, =STR_2 ;pegamos o endereço do vetor
   LDR R8, =STR_3 ;pegamos o endereço do vetor
varre_str
   LDRB R6, [R5], #1
   STRB R6, [R7], #1 ; pois STR_2 está na RAM.
   STRB R6, [R8], #1 ; pois STR_2 está na RAM.
   CMP R6, #0
   BNE varre_str
   ;BL escreve_LCD

   NOP

; ---------------------------------------------------------------------------------
; Declarando constantes:
STR_1 DCB "UTFPR",0
VETOR_1 DCB 0xFF, 0xAA, 0x12, 0x14,0
VETOR_2 DCB 123, 34, 45, 50
CONST_1 DCW 0x2345, 0x1122, 0x5577, 0xFF23
CONST_2 DCD 0x11223344, 0xFF564321
CONST_3 DCD 0x11223344

    ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo
