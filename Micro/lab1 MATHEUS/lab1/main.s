
; Este programa espera o usuário apertar a chave USR_SW1 e/ou a chave USR_SW2.
; Caso o usuário pressione a chave USR_SW1, acenderá o LED3 (PF4). Caso o usuário pressione 
; a chave USR_SW2, acenderá o LED4 (PF0). Caso as duas chaves sejam pressionadas, os dois 
; LEDs acendem.

; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declarações EQU - Defines
;<NOME>         EQU <VALOR>
; ========================


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
        IMPORT  PortF_Output
        IMPORT  PortJ_Input
        IMPORT  PortA_Output
        IMPORT  PortQ_Output
        IMPORT  PortP_Output
        IMPORT  PortB_Output			
		IMPORT  PLL_Init
		IMPORT  SysTick_Init
		IMPORT  SysTick_Wait1ms			
		IMPORT  GPIO_Init
		IMPORT	GPIO_PORTA_AHB_DATA_A
		IMPORT	GPIO_PORTQ_AHB_DATA_Q
		IMPORT	GPIO_PORTP_AHB_DATA_P
		IMPORT	GPIO_PORTB_AHB_DATA_B

; -------------------------------------------------------------------------------
; Função main()
Start  			
	BL PLL_Init                  ;Chama a subrotina para alterar o clock do microcontrolador para 80MHz
	BL SysTick_Init              ;Chama a subrotina para inicializar o SysTick
	BL GPIO_Init                 ;Chama a subrotina que inicializa os GPIO
	BL Grava_Display
	BL Grava_Primos				 ; Chama Rotina para gravar os números primos
INIT
	MOV R8, #2_10101010  		 ; Inicializa os LEDs
	MOV R3, #1 					 ; Inicializa o passo
	MOV R12, #0 				 ; Inicializa o Contador
	LDRB R5, [R4]				 ; R4 é o endereço de começo dos números primos, então primeiro pega o primeiro
MainLoop
	BL PortJ_Input				 ; Chama a subrotina que lê o estado das chaves e coloca o resultado em R0
								 ; Resultado fica no R0
Verifica_Nenhuma
	CMP	R0, #2_00000011			 ; Verifica se nenhuma chave está pressionada
	BNE Verifica_SW1			 ; Se o teste viu que tem pelo menos alguma chave pressionada pula para verificação das chaves
Passo_Verificado				 ; Volta pra quando 	
	BL Atualiza_Contador_Leds	 ; Passa para atualizar o contador e os registradores dos valores dos LEDs e Displays
	B Loop_Visualiza
Verifica_SW1	
	CMP R0, #2_00000010			 ; Verifica se somente a chave SW1 está pressionada
	BNE Verifica_SW2             ; Se o teste falhou, então não era só a chave 1 que estava (ou era a chave 2 ou era a chave 1 e a chave 2)
	CMP R3, #8					 ; Compara o passo com 8, pois esse é o valor máximo do contador para ainda se somar mais um no passo
	BGT Passo_Verificado		 ; Se for maior que 8 então não deve somar 1 no passo, mesmo com o SW1 apertado
	ADD R3, #1					 ; Se não foi maior que 8 então soma 1 no passo
	B Passo_Verificado           ; Volta para o laço principal

Verifica_SW2	
	CMP R0, #2_00000001			 ; Verifica se somente a chave SW2 está pressionada
	BNE Passo_Verificado         ; Se o teste falhou, então as duas estavam pressionadas
	CMP R3, #2					 ; Compara o passo com 2
	BLT Passo_Verificado		 ; Se for menor que 2 então não deve diminuir 1 no passo
	SUB R3, #1					 ; Se não foi menor que 2 então diminui 1 no passo 
	B Passo_Verificado           ; Volta agora que o Passo já foi mudado ou não mudadod e acordo com os botões

Atualiza_Contador_Leds			 ; Para atualizar o contador e os leds e o display
	BL Atualiza_Contador		 ; Atualiza o contador e se o contador for primo ele muda os LEDs
	BL Dezena_Unidade_Contador	 ; Atualiza o display para o número do contador (R12)
	B Loop_Visualiza			 ; Loop para a visualização do contador e dos leds para depois voltar para a mair
	
Atualiza_Contador
	ADD R12, R3					 ; Adiciona no contador o passo
	CMP R12, #99				 ; Compara o novo valor do contador com o maximo que o display consegue mostrar
	BLE Contador_N_Reseta		 ; Se o contador não reseta então não roda a parte do contador resetando e a memoria resetando
	MOV R12, #0					 ; Reseta o contador
	MOV R4, #0X0D00				 ; Reseta o endereço do começo dos primos
	MOVT R4, #0X2000			 ; Reseta o endereço do começo dos primos
Contador_N_Reseta
	LDRB R7, [R4]				 ; Passa o endereço do primo apontado para o R7
	CMP R12, R7 				 ; Compara o valor do contador com o valor do primo atualmente apontado
	BEQ	Contador_Primo			 ; Se é igual então quer dizer que o contador bateu com um dos números primos
	BGT Primo_Atualiza			 ; Já passou do primo que estava naquele endereço então soma um no endereço para passar para o primo seguinte e volta para Contador_N_Reseta
	BX LR						 ; Se não foi maior nem igual a um primo então já atualizou o contador então ele volta para quando foi chamado 

Primo_Atualiza
	ADD R4, #1					 ; Atualiza o endereço dos primos para o próximo na lista
	B Contador_N_Reseta			 ; Volta para o Contador_N_Reseta para fazer a comparação com o novo primo

Contador_Primo
	CMP R8, #2_10101010			 ; Compara
	BEQ Opcao1
	BNE Opcao2
Opcao1
	MOV R8, #2_01010101
	BX LR
Opcao2
	MOV R8, #2_10101010
	BX LR						 ; Volta para quando a função foi chamada

Dezena_Unidade_Contador
	;Inicializa os registradores
	MOV R9, #0					 ; Unidades
	MOV R10, #0					 ; Dezenas
	MOV R11, R12				 ; Passa valor do contador para o R11
	
Loop_Unidades_Dezenas
	CMP R11, #9					 ; Compara o Contador com 9
	BGT Ainda_Tem_Dezena		 ; Se for maior então quer dizer que ainda tem a parte da dezena
	MOV R9, R11					 ; Move o que restou depois de tirar a unidade das dezenas do contador
	BX LR						 ; Volta para quando foi chamado a função
	
Ainda_Tem_Dezena
	ADD R10, #1					 ; Adiciona 1 na dezena
	SUB R11, #10				 ; Diminui 1 da parte da dezena do atual R11, que no começo do loop é o valor do contador
	B Loop_Unidades_Dezenas		 ; Volta para o começo do loop de tirar as unidades do contador 

Loop_Visualiza

	MOV R11, #0       ; Inicializa registrador com 0 
TMP	CMP R11, #50	 ; Compara o registrador com o set 300
	BGE MainLoop		 ; Se chegou no valor setado volta ao main loop
	ADD R11, #1	 ; Avança temporizador
	B PP5		 ; Se não chegou no valor setado Liga Led




PP5	;Função para LEDs	
	MOV R0, R8	 ; Carrega para R0 o comando dos Leds que está em R8	

	LSR R5, R0, #4							;Desloca os 4 bits mais significativos para a direita, o registrador R5 será
											;direcionado para o GPIO PA
	LSL R6, R0, #4							;Desloca os 4 bits menos significativos para a esquerda
	LSR R6, R0, #4							;Esses 4 bits são deslocados novamente para a direita, o registrador R6 será
											;direcionado para o GPIO PQ
;; TRADUZ NUMERO PARA 7 SEGMENTOS
	LDR    R1, =GPIO_PORTA_AHB_DATA_A            ;Carrega o valor do offset do data register                       NUMERAR REGISTRADOR
	;Read-Modify-Write para escrita
	LDR R2, [R1]
	BIC R2, #2_00010001                     ;Primeiro limpamos os dois bits do lido da porta R2 = R2 & 11101110
	ORR R0, R0, R5                          ;Fazer o OR do lido pela porta com o parâmetro de entrada
	STR R0, [R1]                            ;Escreve na porta F o barramento de dados dos pinos F4 e F0
	
	LDR    R1, =GPIO_PORTQ_AHB_DATA_Q            ;Carrega o valor do offset do data register                       NUMERAR REGISTRADOR
	;Read-Modify-Write para escrita
	LDR R2, [R1]
	BIC R2, #2_00010001                     ;Primeiro limpamos os dois bits do lido da porta R2 = R2 & 11101110
	ORR R0, R0, R6                          ;Fazer o OR do lido pela porta com o parâmetro de entrada
	STR R0, [R1]                            ;Escreve na porta F o barramento de dados dos pinos F4 e F0

	LDR    R1, =GPIO_PORTP_AHB_DATA_P            ;Carrega o valor do offset do data register                       NUMERAR REGISTRADOR ; WRITE DATA P pra ligar o transistor
;	Para ligar leds setar PP em #2_00100000
	;Read-Modify-Write para escrita
	LDR R2, [R1]
	BIC R2, #2_00100000                     ;Primeiro limpamos os dois bits do lido da porta R2 = R2 & 11101110
	ORR R2, R2, #2_00100000                         ;Fazer o OR do lido pela porta com o parâmetro de entrada
	STR R2, [R1]                            ;Escreve na porta F o barramento de dados dos pinos F4 e F0

; systic 5ms:
	PUSH {R0, R1, r2, r3, r4, r5, r6, r7, R8, r9, r10, r11, r12}
	MOV R0, #7
	BL SysTick_Wait1ms
	POP {R0, R1, r2, r3, r4, r5, r6, r7, R8, r9, r10, r11, r12}

	LDR    R1, =GPIO_PORTP_AHB_DATA_P            ;Carrega o valor do offset do data register                       NUMERAR REGISTRADOR ; WRITE DATA P pra desligar o transistor
;	Para desligar leds setar PP em #2_00000000
	;Read-Modify-Write para escrita
	;LDR R2, [R1]
	;BIC R2, #2_00010000                     ;Primeiro limpamos os dois bits do lido da porta R2 = R2 & 11101110
	;ORR R2, R2, #2_00000000                         ;Fazer o OR do lido pela porta com o parâmetro de entrada
	MOV R2, #0
	STR R2, [R1]                            ;Escreve na porta F o barramento de dados dos pinos F4 e F0

	B PB4                                 ;Retorno





PB4	;Função para display de dezenas
	MOV R0, R10	 ; Carrega para R0 o comando do display das dezenas que está em R10	 
	MOV R1, #0X0E00
	MOVT R1, #0X2000
	ADD R1, R0
	LDRB R0, [R1]

	LSR R5, R0, #4							;Desloca os 4 bits mais significativos para a direita, o registrador R5 será
	LSL R5, R5, #4										;direcionado para o GPIO PA
	LSL R6, R0, #28							;Desloca os 4 bits menos significativos para a esquerda
	LSR R6, R6, #28						;Esses 4 bits são deslocados novamente para a direita, o registrador R6 será
											;direcionado para o GPIO PQ
											
	LDR    R1, =GPIO_PORTA_AHB_DATA_A            ;Carrega o valor do offset do data register                       NUMERAR REGISTRADOR
	;Read-Modify-Write para escrita
	;LDR R2, [R1]
	;BIC R2, #2_00010001                     ;Primeiro limpamos os dois bits do lido da porta R2 = R2 & 11101110
	;ORR R2, R2, R5                          ;Fazer o OR do lido pela porta com o parâmetro de entrada	
	STR R5, [R1]                            ;Escreve na porta F o barramento de dados dos pinos F4 e F0

	LDR    R1, =GPIO_PORTQ_AHB_DATA_Q            ;Carrega o valor do offset do data register                       NUMERAR REGISTRADOR
	;Read-Modify-Write para escrita
	;LDR R2, [R1]
	;BIC R2, #2_00010001                     ;Primeiro limpamos os dois bits do lido da porta R2 = R2 & 11101110
	;ORR R2, R2, R6                          ;Fazer o OR do lido pela porta com o parâmetro de entrada
	STR R6, [R1]                            ;Escreve na porta F o barramento de dados dos pinos F4 e F0

											
	LDR    R1, =GPIO_PORTB_AHB_DATA_B            ;Carrega o valor do offset do data register                       NUMERAR REGISTRADOR ; WRITE DATA P pra ligar o transistor
;	Para ligar leds setar PP em #2_00100000
	;Read-Modify-Write para escrita
	;LDR R2, [R1]
	;BIC R2, #2_00100000                     ;Primeiro limpamos os dois bits do lido da porta R2 = R2 & 11101110
	;ORR R2, R2, #2_00010000                         ;Fazer o OR do lido pela porta com o parâmetro de entrada
	MOV R2, #2_00010000
	STR R2, [R1]                            ;Escreve na porta F o barramento de dados dos pinos F4 e F0

; systic 5ms:
	PUSH {R0, R1, r2, r3, r4, r5, r6, r7, R8, r9, r10, r11, r12}
	MOV R0, #7
	BL SysTick_Wait1ms
	POP {R0, R1, r2, r3, r4, r5, r6, r7, R8, r9, r10, r11, r12}

	LDR    R1, =GPIO_PORTB_AHB_DATA_B            ;Carrega o valor do offset do data register                       NUMERAR REGISTRADOR ; WRITE DATA P pra desligar o transistor
;	Para desligar leds setar PP em #2_00000000
	;Read-Modify-Write para escrita
	;LDR R2, [R1]
	;BIC R2, #2_00010000                     ;Primeiro limpamos os dois bits do lido da porta R2 = R2 & 11101110
	;ORR R2, R2, #2_00000000                         ;Fazer o OR do lido pela porta com o parâmetro de entrada
	MOV R2, #0
	STR R2, [R1]                            ;Escreve na porta F o barramento de dados dos pinos F4 e F0

	B PB5                                   ;Retorno





PB5	;Função para display de unidades
	MOV R0, R9	 ; Carrega para R0 o comando do display das unidades que está em R9	 
	MOV R1, #0X0E00
	MOVT R1, #0X2000
	ADD R1, R0
	LDRB R0, [R1]
	LSR R5, R0, #4							;Desloca os 4 bits mais significativos para a direita, o registrador R5 será
	LSL R5, R5, #4										;direcionado para o GPIO PA
	LSL R6, R0, #28							;Desloca os 4 bits menos significativos para a esquerda
	LSR R6, R6, #28						;Esses 4 bits são deslocados novamente para a direita, o registrador R6 será
											;direcionado para o GPIO PQ
											
	LDR    R1, =GPIO_PORTA_AHB_DATA_A            ;Carrega o valor do offset do data register                       NUMERAR REGISTRADOR
	;Read-Modify-Write para escrita
	;LDR R2, [R1]
	;BIC R2, #2_00010001                     ;Primeiro limpamos os dois bits do lido da porta R2 = R2 & 11101110
	;ORR R2, R2, R5                          ;Fazer o OR do lido pela porta com o parâmetro de entrada	
	STR R5, [R1]                            ;Escreve na porta F o barramento de dados dos pinos F4 e F0

	LDR    R1, =GPIO_PORTQ_AHB_DATA_Q            ;Carrega o valor do offset do data register                       NUMERAR REGISTRADOR
	;Read-Modify-Write para escrita
	;LDR R2, [R1]
	;BIC R2, #2_00010001                     ;Primeiro limpamos os dois bits do lido da porta R2 = R2 & 11101110
	;ORR R2, R2, R6                          ;Fazer o OR do lido pela porta com o parâmetro de entrada
	STR R6, [R1]                            ;Escreve na porta F o barramento de dados dos pinos F4 e F0


	LDR    R1, =GPIO_PORTB_AHB_DATA_B            ;Carrega o valor do offset do data register                       NUMERAR REGISTRADOR ; WRITE DATA P pra ligar o transistor
;	Para ligar leds setar PP em #2_00100000
	;Read-Modify-Write para escrita
	;LDR R2, [R1]
	;BIC R2, #2_00100000                     ;Primeiro limpamos os dois bits do lido da porta R2 = R2 & 11101110
	;ORR R2, R2, #2_00100000                         ;Fazer o OR do lido pela porta com o parâmetro de entrada
	MOV R2, #2_00100000
	STR R2, [R1]                            ;Escreve na porta F o barramento de dados dos pinos F4 e F0

; systic 5ms:
	PUSH {R0, R1, r2, r3, r4, r5, r6, r7, R8, r9, r10, r11, r12}
	MOV R0, #7
	BL SysTick_Wait1ms
	POP {R0, R1, r2, r3, r4, r5, r6, r7, R8, r9, r10, r11, r12}

	LDR    R1, =GPIO_PORTB_AHB_DATA_B            ;Carrega o valor do offset do data register                       NUMERAR REGISTRADOR ; WRITE DATA P pra desligar o transistor
;	Para desligar leds setar PP em #2_00000000
	;Read-Modify-Write para escrita
	;LDR R2, [R1]
	;BIC R2, #2_00100000                     ;Primeiro limpamos os dois bits do lido da porta R2 = R2 & 11101110
	;ORR R2, R2, #2_00000000                         ;Fazer o OR do lido pela porta com o parâmetro de entrada
	MOV R2, #0
	STR R2, [R1]                            ;Escreve na porta F o barramento de dados dos pinos F4 e F0

	B TMP		 ; Reinicia o loop




FIM	NOP						; FIM


Grava_Primos
	; Grava os números primos na memória
	; 2, 3, 5, 7, 11, 13, 17, 19, 23, 
	MOV R1,#2
	MOV R2, #0X0D00
	MOVT R2, #0X2000
	STRB R1, [R2]		
	MOV R1,#3
	ADD R2, #1
	STRB R1, [R2]			
	MOV R1,#5
	ADD R2, #1
	STRB R1, [R2]	
	MOV R1,#7
	ADD R2, #1
	STRB R1, [R2]		
	MOV R1,#11
	ADD R2, #1
	STRB R1, [R2]
	MOV R1,#13
	ADD R2, #1
	STRB R1, [R2]
	MOV R1,#17
	ADD R2, #1
	STRB R1, [R2]
	MOV R1,#19
	ADD R2, #1
	STRB R1, [R2]
	MOV R1,#23
	ADD R2, #1
	STRB R1, [R2]
	; 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 
	MOV R1,#29
	ADD R2, #1
	STRB R1, [R2]
	MOV R1,#31
	ADD R2, #1
	STRB R1, [R2]
	MOV R1,#37
	ADD R2, #1
	STRB R1, [R2]
	MOV R1,#41
	ADD R2, #1
	STRB R1, [R2]
	MOV R1,#43
	ADD R2, #1
	STRB R1, [R2]	
	MOV R1,#47
	ADD R2, #1
	STRB R1, [R2]	
	MOV R1,#53
	ADD R2, #1
	STRB R1, [R2]	
	MOV R1,#59
	ADD R2, #1
	STRB R1, [R2]
	MOV R1,#61
	ADD R2, #1
	STRB R1, [R2]
	MOV R1,#67
	ADD R2, #1
	STRB R1, [R2]	
	; 71, 73, 79, 83, 89, 97
	MOV R1,#71
	ADD R2, #1
	STRB R1, [R2]
	MOV R1,#73
	ADD R2, #1
	STRB R1, [R2]		
	MOV R1,#79
	ADD R2, #1
	STRB R1, [R2]		
	MOV R1,#83
	ADD R2, #1
	STRB R1, [R2]		
	MOV R1,#89
	ADD R2, #1
	STRB R1, [R2]	
	MOV R1,#97
	ADD R2, #1
	STRB R1, [R2]	
	MOV R4, #0X0D00
	MOVT R4, #0X2000
	B INIT
	
Grava_Display
	MOV R1,#2_00111111 ;0
	MOV R2, #0X0E00
	MOVT R2, #0X2000
	STRB R1, [R2]	
	MOV R1,#2_00000110   ;1
	ADD R2, #1
	STRB R1, [R2]		
	MOV R1,#2_01011011   ;2
	ADD R2, #1
	STRB R1, [R2]	
	MOV R1,#2_01001111   ;3
	ADD R2, #1
	STRB R1, [R2]		
	MOV R1,#2_01100110   ;4
	ADD R2, #1
	STRB R1, [R2]	
	MOV R1,#2_01101101   ;5
	ADD R2, #1
	STRB R1, [R2]	
	MOV R1,#2_01111101   ;6
	ADD R2, #1
	STRB R1, [R2]	
	MOV R1,#2_00000111   ;7
	ADD R2, #1
	STRB R1, [R2]		
	MOV R1,#2_01111111   ;8
	ADD R2, #1
	STRB R1, [R2]		
	MOV R1,#2_01101111   ;9
	ADD R2, #1
	STRB R1, [R2]					
	BX LR	
	


	NOP
    ALIGN                        ;Garante que o fim da seção está alinhada 
    END                          ;Fim do arquivo
