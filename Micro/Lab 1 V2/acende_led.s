; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
			                        ; outro arquivo. No caso startup.s
		EXPORT led
		EXPORT nled
		EXPORT setup_led
		
; -------------------------------------------------------------------------------

invert_led EQU 0x2000D000
	
setup_led
	PUSH {R0-R1}
	LDR  R0, =invert_led
	MOV R1, #0
	STR R1,[R0]
	POP {R0-R1}
	
	BX LR
led
	PUSH {R0-R1}
	LDR  R0, =invert_led
	LDR R1, [R0]
	CMP R1, #0
	STREQ R1,[R0]
;PORTA A
	LDREQ R9, =2_01010000
;PORTA Q
	LDREQ R8, =2_00000101
	MOVEQ R1, #1
	STRNE R1,[R0]
;PORTA A
	LDRNE R9, =2_10100000
;PORTA Q
	LDRNE R8, =2_00001010
	POP {R0-R1}
	MOVNE R1, #0
	
	BX LR
	
nled
;PORTA A
	LDR R9, =2_00000000
;PORTA Q
	LDR R8, =2_00000000
	BX LR
		
		
		
		
		
		
		ALIGN                           ; garante que o fim da seção está alinhada 
		END                             ; fim do arquivo
