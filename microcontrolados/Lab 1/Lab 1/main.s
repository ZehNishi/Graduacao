
; -------------------------------------------------------------------------------
        THUMB                        ; Instru��es do tipo Thumb-2
; -------------------------------------------------------------------------------
		
; Declara��es EQU - Defines
;<NOME>         EQU <VALOR>
; ========================
; Defini��es de Valores
Temporizador EQU 0x14E ; 1000ms
Temporizador2 EQU 0x54; 250ms
Valor_led EQU 0x2000E000 ; endere�o que segura a saida do led
; -------------------------------------------------------------------------------
; �rea de Dados - Declara��es de vari�veis
		AREA  DATA, ALIGN=2
		; Se alguma vari�vel for chamada em outro arquivo
		;EXPORT  <var> [DATA,SIZE=<tam>]   ; Permite chamar a vari�vel <var> a 
		                                   ; partir de outro arquivo
;<var>	SPACE <tam>                        ; Declara uma vari�vel de nome <var>
                                           ; de <tam> bytes a partir da primeira 
                                           ; posi��o da RAM		

; -------------------------------------------------------------------------------
; �rea de C�digo - Tudo abaixo da diretiva a seguir ser� armazenado na mem�ria de 
;                  c�digo
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma fun��o do arquivo for chamada em outro arquivo	
        EXPORT Start                ; Permite chamar a fun��o Start a partir de 
			                        ; outro arquivo. No caso startup.s
									
		; Se chamar alguma fun��o externa	
        ;IMPORT <func>              ; Permite chamar dentro deste arquivo uma 
									; fun��o <func>
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
; Fun��o main()
Start  		
	BL PLL_Init                  ;Chama a subrotina para alterar o clock do microcontrolador para 80MHz
	BL SysTick_Init              ;Chama a subrotina para inicializar o SysTick
	BL GPIO_Init                 ;Chama a subrotina que inicializa os GPIO
	
	MOV R10, #0					;Registrador para o contador
	MOV R11, #0					;Registrador para as unidades do contador
	MOV R12, #0					;Registrador para as dezenas do contador
	MOV R5, #0					;Registrador para o temporizador do contador
	MOV R3, #0					;Registrador para o temporizador dos bot�es
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
	
	
	CMP R3,#Temporizador2			;Fun��o para detectar inputs dos bot�es
	ADDNE R3, #1
	MOVEQ R3, #0
	BLEQ PortJ_Input
	
	
	

	CMP R5, #Temporizador			;Fun��o para incrementar o n�mero em um intervalo pr�-definido
	ADDNE R5, #1
	MOVEQ R5, #0
	BLEQ contador
	BLEQ div_dezenas
	

	
	B Main_loop

div_dezenas		;Fun��o para dividir R10 em unidades e dezenas (R11 e R12)
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
	
led_main			;Fun��o para acender o led apenas para n�meros primos

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
    ALIGN                        ;Garante que o fim da se��o est� alinhada 
    END                          ;Fim do arquivo
