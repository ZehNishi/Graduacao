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
Temporizador2 EQU 0xA7; 100ms
Valor_led EQU 0x2000E000
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
; Função main()
Start  
	BL PLL_Init                  ;Chama a subrotina para alterar o clock do microcontrolador para 80MHz
	BL SysTick_Init              ;Chama a subrotina para inicializar o SysTick
	BL GPIO_Init                 ;Chama a subrotina que inicializa os GPIO
	BL LCD_INI					 ;Chama a subrotina que configura o LCD
	BL SEQ_INI					 ;Chama a subrotina que salva a sequencia de numeros na memmoria RAM
	
	
Reset
	BL Tela_Inicial				;Função para mostrar tela inicial do jogo de memoria
	
	MOV R10, #1					;R10 usado como contador para o numero de interações
	
Espera_ini						;Espera uma leitura do teclado igual a 'A' para começar o jogo

	BL Leitura_Teclado			;Função que realiza a leitura do teclado
	CMP R1, #'A'
	BNE Espera_ini
	BEQ Main_Loop
	


Main_Loop
		
	BL LCD_Clear				;Função para limpar o LCD e retornar o curso para posição 1
	BL JOGO						;Rotina do jogo, usa R10 como parametro para o numero de interações
	ADD R10,#1					;Caso retorne de JOGO incrementa o numero de interações (R10)
	CMP R10, #101				;Jogo acaba em 100 interações bem sucedidas 
	BEQ Vitoria					;;Função para mostrar tela de vitoria do jogo de memoria
	
	
	BNE Main_Loop



; -------------------------------------------------------------------------------------------------------------------------
; Fim do Arquivo
; -------------------------------------------------------------------------------------------------------------------------	
    ALIGN                        ;Garante que o fim da seção está alinhada 
    END                          ;Fim do arquivo
