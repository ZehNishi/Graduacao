; Este programa deve esperar o usuário pressionar uma chave.
; Caso o usuário pressione uma chave, um LED deve piscar a cada 1 segundo.

; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
		
; Declarações EQU - Defines
;<NOME>         EQU <VALOR>
; ========================
; Definições de Valores
Temporizador EQU 0xA7 ;500ms
Temporizador2 EQU 0x22; 100ms
; -------------------------------------------------------------------------------
; Área de Dados - Declarações de variáveis
		AREA  DATA, ALIGN=2
		; Se alguma variável for chamada em outro arquivo
		;EXPORT  <var> [DATA,SIZE=<tam>]   ; Permite chamar a variável <var> a 
		                                   ; partir de outro arquivo
;<var>	SPACE <tam>                        ; Declara uma variável de nome <var>
                                           ; de <tam> bytes a partir da primeira 
                                           ; posição da RAM		

; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT Start                ; Permite chamar a função Start a partir de 
			                        ; outro arquivo. No caso startup.s
									
		; Se chamar alguma função externa	
        ;IMPORT <func>              ; Permite chamar dentro deste arquivo uma 
									; função <func>
		IMPORT  PLL_Init
		IMPORT  SysTick_Init			
		IMPORT  GPIO_Init
        IMPORT  PortA_Output
		IMPORT 	Display1_Output		
		IMPORT 	Display2_Output			
		IMPORT 	Led_Output
		IMPORT  PortQ_Output
        IMPORT  PortJ_Input	
		IMPORT  primo
		IMPORT  dec7
		IMPORT  contador
		IMPORT 	SysTick_Wait
		IMPORT 	led
		IMPORT 	nled
		IMPORT setup_led


; -------------------------------------------------------------------------------
; Função main()
Start  		
	BL PLL_Init                  ;Chama a subrotina para alterar o clock do microcontrolador para 80MHz
	BL SysTick_Init              ;Chama a subrotina para inicializar o SysTick
	BL GPIO_Init                 ;Chama a subrotina que inicializa os GPIO
	BL setup_led

	MOV R9, #0 ;Porta A decodificador
	MOV R8, #0 ;Porta Q decodificador
	MOV R11, #0 ;Numero do contador(Digito menos significativo)
	MOV R12, #0 ;Numero do contador(Digito mais significativo)
	MOV R10, #0 ; Numero do contador(inteiro)
	MOV R7, #1 ; Passo
	MOV R6, #0 ;contador do temporizador
	MOV R5, #0
	MOV R3, #0
	
MainLoop
	
	BL div_dezenas			;Função para dividir o valor de R10 em dezenas e unidades(Em R11 e R12)
	BL primo			;Função para verificar se o numero em R10 é primo
	CMP R0, #1			;R0 é a saida da função primo, se for igual a 1 o numero R10 é primo
	BLEQ led			;Se o numero é primo deve-se acender os leds
	BLNE nled			;Se o numero não é primo, não acende os leds
	BL PortA_Output
	BL PortQ_Output
	BL Led_Output
	
	
	MOV R0, R11
	BL dec7
	BL PortA_Output
	BL PortQ_Output
	BL Display1_Output
	
	
	MOV R0, R12
	BL dec7
	BL PortA_Output
	BL PortQ_Output
	BL Display2_Output
	POP {R0-R9}
	
	
	CMP R5, #Temporizador
	ADDNE R5, #1
	MOVEQ R5, #0
	MOVEQ R0, R10
	PUSHEQ {R1-R6}
	BLEQ contador
	MOVEQ R10, R0
	
	
	CMP R3,#Temporizador2
	ADDNE R3, #1
	MOVEQ R3, #0
	BLEQ PortJ_Input
	CMPEQ R1, #2_00000010
	CMPEQ R7,#10
	ADDLT R7, #1
	CMP R3, #Temporizador2
	BLEQ PortJ_Input
	CMPEQ R1, #2_00000001
	CMPEQ R7, #0
	ADDGT R7, #-1
	
	
	
	
	B MainLoop

div_dezenas
	PUSH {R0-R9}
	MOV R0, R10
	CMP R11, #9
	BGT dezena
	POP {R0-R9}
	
	BX LR
dezena
	ADD R12, #1
	ADD R11, #-10
	
	B div_dezenas

; -------------------------------------------------------------------------------------------------------------------------
; Fim do Arquivo
; -------------------------------------------------------------------------------------------------------------------------	
    ALIGN                        ;Garante que o fim da seção está alinhada 
    END                          ;Fim do arquivo
