; Este programa deve esperar o usu�rio pressionar uma chave.
; Caso o usu�rio pressione uma chave, um LED deve piscar a cada 1 segundo.

; -------------------------------------------------------------------------------
        THUMB                        ; Instru��es do tipo Thumb-2
; -------------------------------------------------------------------------------
		
; Declara��es EQU - Defines
;<NOME>         EQU <VALOR>
; ========================
; Defini��es de Valores
Temporizador EQU 0xA7 ;500ms
Temporizador2 EQU 0xA7; 100ms
Valor_led EQU 0x2000E000
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
		IMPORT 	SysTick_Wait1ms
		IMPORT No_Output
		IMPORT LCD_INI
		IMPORT Segunda_Linha
		IMPORT Tela_Inicial
		IMPORT Leitura_Teclado
		IMPORT LCD_Print
		IMPORT LCD_Clear
		IMPORT SEQ_INI
		IMPORT JOGO
		IMPORT Game_Over
		IMPORT Acerto
		IMPORT Vitoria
		EXPORT Reset
			
	


; -------------------------------------------------------------------------------
; Fun��o main()
Start  
	BL PLL_Init                  ;Chama a subrotina para alterar o clock do microcontrolador para 80MHz
	BL SysTick_Init              ;Chama a subrotina para inicializar o SysTick
	BL GPIO_Init                 ;Chama a subrotina que inicializa os GPIO
	BL LCD_INI					 ;Chama a subrotina que configura o LCD
	BL SEQ_INI					 ;Chama a subrotina que salva a sequencia de numeros na memmoria RAM
	
	
Reset
	BL Tela_Inicial				;Fun��o para mostrar tela inicial do jogo de memoria
	
	MOV R10, #1					;R10 usado como contador para o numero de intera��es
	
Espera_ini						;Espera uma leitura do teclado igual a 'A' para come�ar o jogo

	BL Leitura_Teclado			;Fun��o que realiza a leitura do teclado
	CMP R1, #'A'
	BNE Espera_ini
	BEQ Main_Loop
	


Main_Loop
		
	BL LCD_Clear				;Fun��o para limpar o LCD e retornar o curso para posi��o 1
	BL JOGO						;Rotina do jogo, usa R10 como parametro para o numero de intera��es
	ADD R10,#1					;Caso retorne de JOGO incrementa o numero de intera��es (R10)
	CMP R10, #101				;Jogo acaba em 100 intera��es bem sucedidas 
	BEQ Vitoria					;;Fun��o para mostrar tela de vitoria do jogo de memoria
	
	
	BNE Main_Loop



; -------------------------------------------------------------------------------------------------------------------------
; Fim do Arquivo
; -------------------------------------------------------------------------------------------------------------------------	
    ALIGN                        ;Garante que o fim da se��o est� alinhada 
    END                          ;Fim do arquivo
