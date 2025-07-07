; -------------------------------------------------------------------------------
SEQ EQU 0x20000A00
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2
		
		; Se alguma função do arquivo for chamada em outro arquivo	
		IMPORT LCD_Comand
		IMPORT LCD_Print
		IMPORT LCD_Clear
		IMPORT 	SysTick_Wait1ms
		IMPORT Leitura_Teclado
		EXPORT SEQ_INI
		EXPORT JOGO
		IMPORT Game_Over
		IMPORT Acerto
		IMPORT Reset
		
			
SEQ_INI
	
	MOV R3, #101
	LDR R1, =SEQUENCIA
	LDR R0, =SEQ
	
LOOP

	LDRB R2, [R1], #1
	STRB R2, [R0], #1
	ADD R3, #-1
	CMP R3, #0
	BNE LOOP
	
	BX LR
	
	
JOGO

	PUSH{LR}
	MOV R3, R10
	LDR R5, =SEQ
	
Loop_Jogo
	
	MOV R0,#500
	BL SysTick_Wait1ms
	
	LDRB R1, [R5], #1
	BL LCD_Print
	
	MOV R0,#500
	BL SysTick_Wait1ms
	
	BL LCD_Clear
	
	ADD R3, #-1
	CMP R3, #0
	BNE Loop_Jogo	
	
	LDR R5, =SEQ
	MOV R1, #0
	MOV R3, R10
	
Espera_Leitura

	
	BL Leitura_Teclado
	CMP R1, #0
	BEQ Espera_Leitura
	
	PUSH {R1}
	BL LCD_Print
	POP {R1}
	
	MOV R0,#500
	BL SysTick_Wait1ms
		
	LDRB R2, [R5], #1	
	CMP R1, R2
	BLNE Game_Over
	ITT EQ
	ADDEQ R3, #-1
	CMPEQ R3, #0
	
	BLEQ Acerto
	BLNE LCD_Clear
	
	
	CMP R3, #0
	BNE Espera_Leitura
	
	POP{PC}
			
			
			
			
			
SEQUENCIA DCB '7', '2', '1', '6', '3', '7', '3', '8', '3', '5','7', '0', '8', '3', '2', '6', '7', '8', '7', '9','4', '4', '4', '8', '4', '0', '7', '5', '8', '5','2', '2', '1', '8', '9', '9', '3', '3', '8', '1','7', '5', '4', '5', '8', '9', '4', '5', '7', '4','4', '4', '2', '6', '2', '2', '1', '6', '6', '7','7', '6', '3', '3', '3', '8', '9', '9', '2', '6','8', '8', '7', '3', '3', '3', '1', '9', '6', '2','1', '0', '6', '7', '5', '9', '6', '2', '9', '1','6', '7', '8', '6', '5', '1', '5', '8', '9', '7'

    ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo
