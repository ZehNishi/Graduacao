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
		IMPORT Segunda_Linha
		
			
SEQ_INI
	
	MOV R3, #101 ;contador de interações
	LDR R1, =SEQUENCIA ;Vetor de Numeros 
	LDR R0, =SEQ ;Memoria para salvar os números
	
LOOP ;Salvar a sequencia em memória

	LDRB R2, [R1], #1 ;Salva o dado do vetor de R1 em R2 e incrementa R1
	STRB R2, [R0], #1 ;Salva no endereço em R0 o dado presente em R2 e incrementa R0
	ADD R3, #-1 ;contador de iteração
	CMP R3, #0 ;Se chegar a zero, acabou as iterações
	BNE LOOP
	
	BX LR
	
	
JOGO

	PUSH{LR}
	MOV R3, R10 ;salva em R10 (será a saida do jogo_memoria) a posição do contador
	LDR R5, =SEQ ;aponta para o endereço do primeiro numero 
	
Loop_Jogo ;imprime a sequencia 
	
	MOV R0,#500
	BL SysTick_Wait1ms
	
	LDRB R1, [R5], #1 ;acessou o dado em R5 e salvou em R1 e incrementou R5 para a próxima posição
	BL LCD_Print ;escreveu o dado no LCD
	
	MOV R0,#500
	BL SysTick_Wait1ms
	
	BL LCD_Clear ;limpou o LCD
	
	ADD R3, #-1 ;contador de iteração diminui
	CMP R3, #0 
	BNE Loop_Jogo ;contador diferente de 0 = jogo não acabou
	
	LDR R5, =SEQ ;aponta para o endereço do primeiro numero 
	MOV R1, #0 ;será usado na leitura_Teclado para identificar se houve tecla pressionada
	MOV R3, R10 ;contador de iteração
	
Espera_Leitura

	
	BL Leitura_Teclado ;retorna em R1 a tecla pressionada
	CMP R1, #0 
	BEQ Espera_Leitura
	
	MOV R4, R1
	BL Segunda_Linha ;para o usuario escrever na segunda linha
	MOV R1, R4
	BL LCD_Print ;imprime a letra pressionada
	MOV R1, R4
	
	MOV R0,#500
	BL SysTick_Wait1ms
		
	LDRB R2, [R5], #1 ;acessou o dado em R5, salvou em R2 e incrementou R5 para a próxima posição	
	CMP R1, R2 ;compara o que o usuário digitou
	BLNE Game_Over ;presente em LCD_Controler
	ITT EQ ;se for igual 
	ADDEQ R3, #-1 
	CMPEQ R3, #0 
	
	BLEQ Acerto ;presente em LCD_Controler
	BLNE LCD_Clear ;presente em LCD_Controler, limpa o LCD se R3 diferente de 0
	
	
	CMP R3, #0
	BNE Espera_Leitura
	
	POP{PC}
			
			
			
			
			
SEQUENCIA DCB '7', '2', '1', '6', '3', '7', '3', '8', '3', '5','7', '0', '8', '3', '2', '6', '7', '8', '7', '9','4', '4', '4', '8', '4', '0', '7', '5', '8', '5','2', '2', '1', '8', '9', '9', '3', '3', '8', '1','7', '5', '4', '5', '8', '9', '4', '5', '7', '4','4', '4', '2', '6', '2', '2', '1', '6', '6', '7','7', '6', '3', '3', '3', '8', '9', '9', '2', '6','8', '8', '7', '3', '3', '3', '1', '9', '6', '2','1', '0', '6', '7', '5', '9', '6', '2', '9', '1','6', '7', '8', '6', '5', '1', '5', '8', '9', '7'

    ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo
