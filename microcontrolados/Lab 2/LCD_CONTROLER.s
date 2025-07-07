; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2
		
		; Se alguma função do arquivo for chamada em outro arquivo	
		EXPORT Segunda_Linha
		IMPORT LCD_Comand
		IMPORT LCD_Print
		EXPORT Tela_Inicial
		EXPORT LCD_Clear
		EXPORT Game_Over
		EXPORT Acerto
		EXPORT Vitoria
		IMPORT Reset
		IMPORT 	SysTick_Wait1ms
		IMPORT LED_GAME_OVER
		IMPORT LED_ACERTO
		IMPORT LED_VITORIA

LCD_Clear

	PUSH {LR}
	MOV R1, #0x01 ;salva em R1 o comando de reset, que no LCD_Comand, R1 jogará para a porta do LCD				
	BL LCD_Comand ;Presente no GPIO
	MOV R1, #0 
	POP {PC}

Segunda_Linha

	PUSH {LR}
	MOV R1, #0xC0 ;comando para ir para linha 2, coluna 0 do display			
	BL LCD_Comand ;Presente no GPIO
	POP {PC}
	
Tela_Inicial
	
	PUSH {LR}
	BL LCD_Clear
	MOV R1, #'J'
	BL LCD_Print ;Presente no GPIO
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
	MOV R1, #33 ;exclamação
	BL LCD_Print
	
	BL Segunda_Linha
	MOV R1, #'B'
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
	
	
Game_Over

	PUSH {LR}
	BL LCD_Clear
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #'F'
	BL LCD_Print
	MOV R1, #'i'
	BL LCD_Print
	MOV R1, #'m'
	BL LCD_Print
	MOV R1, #' '
	BL LCD_Print
	MOV R1, #'d'
	BL LCD_Print
	MOV R1, #'e'
	BL LCD_Print
	MOV R1, #' '
	BL LCD_Print
	MOV R1, #'j'
	BL LCD_Print
	MOV R1, #'o'
	BL LCD_Print
	MOV R1, #'g'
	BL LCD_Print
	MOV R1, #'o'
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	
	BL Segunda_Linha
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	MOV R1, #210
	BL LCD_Print
	
	BL LED_GAME_OVER
	
	B Reset
	
	
	POP {PC}
			
			
Acerto

	PUSH {LR}
	BL LCD_Clear
	MOV R1, #62
	BL LCD_Print
	MOV R1, #62
	BL LCD_Print
	MOV R1, #'B'
	BL LCD_Print
	MOV R1, #'o'
	BL LCD_Print
	MOV R1, #'m'
	BL LCD_Print
	MOV R1, #' '
	BL LCD_Print
	MOV R1, #'t'
	BL LCD_Print
	MOV R1, #'r'
	BL LCD_Print
	MOV R1, #'a'
	BL LCD_Print
	MOV R1, #'b'
	BL LCD_Print
	MOV R1, #'a'
	BL LCD_Print
	MOV R1, #'l'
	BL LCD_Print
	MOV R1, #'h'
	BL LCD_Print
	MOV R1, #'o'
	BL LCD_Print
	MOV R1, #60
	BL LCD_Print
	MOV R1, #60
	BL LCD_Print
	
	BL Segunda_Linha
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	
	BL LED_ACERTO
	
	POP {PC}
	
	
Vitoria

	PUSH {LR}
	BL LCD_Clear
	MOV R1, #62 ;caractere <
	BL LCD_Print
	MOV R1, #62
	BL LCD_Print
	MOV R1, #'V'
	BL LCD_Print
	MOV R1, #'o'
	BL LCD_Print
	MOV R1, #'c'
	BL LCD_Print
	MOV R1, #'e'
	BL LCD_Print
	MOV R1, #' '
	BL LCD_Print
	MOV R1, #'g'
	BL LCD_Print
	MOV R1, #'a'
	BL LCD_Print
	MOV R1, #'n'
	BL LCD_Print
	MOV R1, #'h'
	BL LCD_Print
	MOV R1, #'o'
	BL LCD_Print
	MOV R1, #'u'
	BL LCD_Print
	MOV R1, #60 ;caractere >
	BL LCD_Print
	MOV R1, #60
	BL LCD_Print
	MOV R1, #' '
	BL LCD_Print
	
	BL Segunda_Linha
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #94
	BL LCD_Print
	MOV R1, #' '
	BL LCD_Print
	
	BL LED_VITORIA
	
	POP {PC}	
		
		
		ALIGN                           ; garante que o fim da seção está alinhada 
		END                             ; fim do arquivo