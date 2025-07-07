; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
			                        ; outro arquivo. No caso startup.s
		EXPORT led
		EXPORT nled
		
; -------------------------------------------------------------------------------

	
led
	CMP R6, #0	;R6 usado para intercalar acionamento dos leds
	BEQ op1
	BNE op2

	
op1				;Função que acende os leds em 01010101
;PORTA A
	LDR R9, =2_01010000
;PORTA Q
	LDR R8, =2_00000101
	MOV R6, #1
	
	BX LR
	
		
op2				;Função que acende os leds em 10101010
;PORTA A
	LDR R9, =2_10100000
;PORTA Q
	LDR R8, =2_00001010
	MOV R6, #0
	
	BX LR
	
nled			;Função que apaga os leds
;PORTA A
	LDR R9, =2_00000000
;PORTA Q
	LDR R8, =2_00000000
	BX LR
		
		
		
		
		
		
		ALIGN                           ; garante que o fim da seção está alinhada 
		END                             ; fim do arquivo
