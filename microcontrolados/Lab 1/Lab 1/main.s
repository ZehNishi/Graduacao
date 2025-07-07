
; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
		
; Declarações EQU - Defines
;<NOME>         EQU <VALOR>
; ========================
; Definições de Valores
Temporizador EQU 0x14E ; 1000ms
Temporizador2 EQU 0x54; 250ms
Valor_led EQU 0x2000E000 ; endereço que segura a saida do led
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
		IMPORT 	SysTick_Wait1ms
		IMPORT 	led
		IMPORT 	nled
		IMPORT No_Output


; -------------------------------------------------------------------------------
; Função main()
Start  		
	BL PLL_Init                  ;Chama a subrotina para alterar o clock do microcontrolador para 80MHz
	BL SysTick_Init              ;Chama a subrotina para inicializar o SysTick
	BL GPIO_Init                 ;Chama a subrotina que inicializa os GPIO
	
	MOV R10, #0					;Registrador para o contador
	MOV R11, #0					;Registrador para as unidades do contador
	MOV R12, #0					;Registrador para as dezenas do contador
	MOV R5, #0					;Registrador para o temporizador do contador
	MOV R3, #0					;Registrador para o temporizador dos botões
	MOV R7, #1 					;PASSO
	MOV R6, #1 					;Registrador para intercalar os leds
	
	
Main_loop
	
	LDR R0, =Valor_led			;Valores dos registradores de saida para o led
	LDR R9,[R0], #1
	LDR R8, [R0]
	BL PortA_Output				;Mostra os valores nos leds
	BL PortQ_Output
	BL Led_Output
	PUSH {R0-R12}
	MOV R0, #1
	BL SysTick_Wait1ms
	POP {R0-R12}
	
	MOV R0, R12				;Decodifica R12 e mostra no display2
	BL dec7
	BL PortA_Output
	BL PortQ_Output
	BL Display2_Output
	PUSH {R0-R12}
	MOV R0, #1
	BL SysTick_Wait1ms
	POP {R0-R12}
	
	MOV R0, R11				;Decodifica R11 e mostra no display1
	BL dec7
	BL PortA_Output
	BL PortQ_Output
	BL Display1_Output
	PUSH {R0-R12}
	MOV R0, #1
	BL SysTick_Wait1ms
	POP {R0-R12}
	
	
	CMP R3,#Temporizador2			;Função para detectar inputs dos botões
	ADDNE R3, #1
	MOVEQ R3, #0
	BLEQ PortJ_Input
	
	
	

	CMP R5, #Temporizador			;Função para incrementar o número em um intervalo pré-definido
	ADDNE R5, #1
	MOVEQ R5, #0
	BLEQ contador
	BLEQ div_dezenas
	

	
	B Main_loop

div_dezenas		;Função para dividir R10 em unidades e dezenas (R11 e R12)
	MOV R11, R10
	MOV R12, #0
unidade
	CMP R11, #9
	BGT dezena
	
	B led_main
dezena
	ADD R12, #1
	SUB R11, #10
	
	B unidade
	
led_main			;Função para acender o led apenas para números primos

	BL nled
	BL primo
	CMP R0, #1
	BLEQ led
	LDR R0, =Valor_led
	STR R9,[R0], #1
	STR R8, [R0]
	

	B Main_loop

; -------------------------------------------------------------------------------------------------------------------------
; Fim do Arquivo
; -------------------------------------------------------------------------------------------------------------------------	
    ALIGN                        ;Garante que o fim da seção está alinhada 
    END                          ;Fim do arquivo
