; -------------------------------------------------------------------------------
; �rea de C�digo - Tudo abaixo da diretiva a seguir ser� armazenado na mem�ria de 
;                  c�digo
        AREA    |.text|, CODE, READONLY, ALIGN=2
		
		; Se alguma fun��o do arquivo for chamada em outro arquivo	
		EXPORT Segunda_Linha
		IMPORT LCD_Comand
		IMPORT LCD_Print
		EXPORT Tela_Inicial
		EXPORT LCD_Clear
			
LCD_Clear

	PUSH {LR}
	MOV R1, #0x01				
	BL LCD_Comand
	POP {PC}

			
Segunda_Linha

	PUSH {LR}
	MOV R1, #0xC0				
	BL LCD_Comand
	POP {PC}
	
Tela_Inicial
	
	PUSH {LR}
	MOV R1, #'J'
	BL LCD_Print
	MOV R1, #'o'
	BL LCD_Print
	MOV R1, #'g'
	BL LCD_Print
	MOV R1, #'o'
	BL LCD_Print
	MOV R1, #' '
	BL LCD_Print
	MOV R1, #'d'
	BL LCD_Print
	MOV R1, #'a'
	BL LCD_Print
	MOV R1, #' '
	BL LCD_Print
	MOV R1, #'M'
	BL LCD_Print
	MOV R1, #'e'
	BL LCD_Print
	MOV R1, #'m'
	BL LCD_Print
	MOV R1, #'o'
	BL LCD_Print
	MOV R1, #'r'
	BL LCD_Print
	MOV R1, #'i'
	BL LCD_Print
	MOV R1, #'a'
	BL LCD_Print
	MOV R1, #33
	BL LCD_Print
	
	BL Segunda_Linha
	MOV R1, #'A'
	BL LCD_Print
	MOV R1, #' '
	BL LCD_Print
	MOV R1, #'p'
	BL LCD_Print
	MOV R1, #'a'
	BL LCD_Print
	MOV R1, #'r'
	BL LCD_Print
	MOV R1, #'a'
	BL LCD_Print
	MOV R1, #' '
	BL LCD_Print
	MOV R1, #'c'
	BL LCD_Print
	MOV R1, #'o'
	BL LCD_Print
	MOV R1, #'m'
	BL LCD_Print
	MOV R1, #'e'
	BL LCD_Print
	MOV R1, #'c'
	BL LCD_Print
	MOV R1, #'a'
	BL LCD_Print
	MOV R1, #'r'
	BL LCD_Print
	MOV R1, #33
	BL LCD_Print
	MOV R1, #33
	BL LCD_Print
	
	
	POP {PC}
			
			
			
		
		
		ALIGN                           ; garante que o fim da se��o est� alinhada 
		END                             ; fim do arquivo