; -------------------------------------------------------------------------------
; �rea de C�digo - Tudo abaixo da diretiva a seguir ser� armazenado na mem�ria de 
;                  c�digo
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma fun��o do arquivo for chamada em outro arquivo	
			                        ; outro arquivo. No caso startup.s
		EXPORT LED_GAME_OVER
		EXPORT LED_ACERTO
		EXPORT LED_VITORIA
		IMPORT 	Led_Output
		IMPORT  PortQ_Output
		IMPORT  PortA_Output
		IMPORT 	SysTick_Wait1ms
		
; -------------------------------------------------------------------------------
	
		
LED_GAME_OVER

	PUSH {LR}
	
;PORTA A
	LDR R9, =2_11110000
;PORTA Q
	LDR R8, =2_00001111
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #500
	BL SysTick_Wait1ms
	
;PORTA A
	LDR R9, =2_01110000
;PORTA Q
	LDR R8, =2_00001110
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #500
	BL SysTick_Wait1ms
	
;PORTA A
	LDR R9, =2_00110000
;PORTA Q
	LDR R8, =2_00001100
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #500
	BL SysTick_Wait1ms
	
;PORTA A
	LDR R9, =2_00010000
;PORTA Q
	LDR R8, =2_00001000
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #500
	BL SysTick_Wait1ms
	
;PORTA A
	LDR R9, =2_00000000
;PORTA Q
	LDR R8, =2_00000000
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #500
	BL SysTick_Wait1ms
	
	POP {PC}
	
LED_ACERTO

	PUSH {LR}
	
;PORTA A
	LDR R9, =2_11110000
;PORTA Q
	LDR R8, =2_00001111
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #250
	BL SysTick_Wait1ms
	
;PORTA A
	LDR R9, =2_00000000
;PORTA Q
	LDR R8, =2_00000000
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #250
	BL SysTick_Wait1ms
	
;PORTA A
	LDR R9, =2_11110000
;PORTA Q
	LDR R8, =2_00001111
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #250
	BL SysTick_Wait1ms
	
;PORTA A
	LDR R9, =2_00000000
;PORTA Q
	LDR R8, =2_00000000
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #250
	BL SysTick_Wait1ms
	
;PORTA A
	LDR R9, =2_11110000
;PORTA Q
	LDR R8, =2_00001111
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #250
	BL SysTick_Wait1ms
	
;PORTA A
	LDR R9, =2_00000000
;PORTA Q
	LDR R8, =2_00000000
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #250
	BL SysTick_Wait1ms
	
	POP {PC}

LED_VITORIA	
		
	PUSH {LR}
	
;PORTA A
	LDR R9, =2_10100000
;PORTA Q
	LDR R8, =2_00001010
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #250
	BL SysTick_Wait1ms
	
;PORTA A
	LDR R9, =2_01010000
;PORTA Q
	LDR R8, =2_00000101
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	MOV R0, #250
	BL SysTick_Wait1ms		
	
	B LED_VITORIA
	
	POP {PC}
		
		ALIGN                           ; garante que o fim da se��o est� alinhada 
		END                             ; fim do arquivo
