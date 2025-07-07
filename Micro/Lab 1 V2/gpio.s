; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declarações EQU - Defines
; ========================
; ========================
; Definições dos Registradores Gerais
SYSCTL_RCGCGPIO_R	 EQU	0x400FE608
SYSCTL_PRGPIO_R		 EQU    0x400FEA08
; ========================
; Definições dos Ports
; PORT J
GPIO_PORTJ_AHB_LOCK_R    	EQU    0x40060520
GPIO_PORTJ_AHB_CR_R      	EQU    0x40060524
GPIO_PORTJ_AHB_AMSEL_R		EQU    0x40060528
GPIO_PORTJ_AHB_PCTL_R    	EQU    0x4006052C
GPIO_PORTJ_AHB_DIR_R     	EQU    0x40060400
GPIO_PORTJ_AHB_AFSEL_R   	EQU    0x40060420
GPIO_PORTJ_AHB_DEN_R     	EQU    0x4006051C
GPIO_PORTJ_AHB_PUR_R     	EQU    0x40060510	
GPIO_PORTJ_AHB_DATA_R    	EQU    0x400603FC
GPIO_PORTJ               	EQU    2_000000100000000
; PORT A
GPIO_PORTA_AHB_LOCK_R    	EQU    0x40058520
GPIO_PORTA_AHB_CR_R      	EQU    0x40058524
GPIO_PORTA_AHB_AMSEL_R   	EQU    0x40058528
GPIO_PORTA_AHB_PCTL_R    	EQU    0x4005852C
GPIO_PORTA_AHB_DIR_R     	EQU    0x40058400
GPIO_PORTA_AHB_AFSEL_R   	EQU    0x40058420
GPIO_PORTA_AHB_DEN_R     	EQU    0x4005851C
GPIO_PORTA_AHB_PUR_R     	EQU    0x40058510	
GPIO_PORTA_AHB_DATA_R    	EQU    0x400583FC
GPIO_PORTA               	EQU    2_000000000000001	
; PORT B
GPIO_PORTB_AHB_LOCK_R    	EQU    0x40059520
GPIO_PORTB_AHB_CR_R      	EQU    0x40059524
GPIO_PORTB_AHB_AMSEL_R   	EQU    0x40059528
GPIO_PORTB_AHB_PCTL_R    	EQU    0x4005952C
GPIO_PORTB_AHB_DIR_R     	EQU    0x40059400
GPIO_PORTB_AHB_AFSEL_R   	EQU    0x40059420
GPIO_PORTB_AHB_DEN_R     	EQU    0x4005951C
GPIO_PORTB_AHB_PUR_R     	EQU    0x40059510	
GPIO_PORTB_AHB_DATA_R    	EQU    0x400593FC
GPIO_PORTB               	EQU    2_000000000000010	
; PORT Q
GPIO_PORTQ_AHB_LOCK_R    	EQU    0x40066520
GPIO_PORTQ_AHB_CR_R      	EQU    0x40066524
GPIO_PORTQ_AHB_AMSEL_R		EQU    0x40066528
GPIO_PORTQ_AHB_PCTL_R    	EQU    0x4006652C
GPIO_PORTQ_AHB_DIR_R     	EQU    0x40066400
GPIO_PORTQ_AHB_AFSEL_R   	EQU    0x40066420
GPIO_PORTQ_AHB_DEN_R     	EQU    0x4006651C
GPIO_PORTQ_AHB_PUR_R     	EQU    0x40066510	
GPIO_PORTQ_AHB_DATA_R    	EQU    0x400663FC
GPIO_PORTQ               	EQU    2_100000000000000
; PORT P
GPIO_PORTP_AHB_LOCK_R    	EQU    0x40065520
GPIO_PORTP_AHB_CR_R      	EQU    0x40065524
GPIO_PORTP_AHB_AMSEL_R   	EQU    0x40065528
GPIO_PORTP_AHB_PCTL_R    	EQU    0x4006552C
GPIO_PORTP_AHB_DIR_R     	EQU    0x40065400
GPIO_PORTP_AHB_AFSEL_R   	EQU    0x40065420
GPIO_PORTP_AHB_DEN_R     	EQU    0x4006551C
GPIO_PORTP_AHB_PUR_R     	EQU    0x40065510	
GPIO_PORTP_AHB_DATA_R    	EQU    0x400653FC
GPIO_PORTP               	EQU    2_010000000000000		

; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT GPIO_Init            ; Permite chamar GPIO_Init de outro arquivo
		EXPORT PortA_Output			; Permite chamar PortA_Output de outro arquivo
		EXPORT PortQ_Output			; Permite chamar PortQ_Output de outro arquivo
		EXPORT Display1_Output			; Permite chamar PortB_Output de outro arquivo
		EXPORT Display2_Output			; Permite chamar PortB_Output de outro arquivo
		EXPORT Led_Output			; Permite chamar PortB_Output de outro arquivo
		EXPORT PortJ_Input          ; Permite chamar PortJ_Input de outro arquivo
		IMPORT  SysTick_Wait1ms
									

;--------------------------------------------------------------------------------
GPIO_Init
	
	LDR     R0, =SYSCTL_RCGCGPIO_R  		;Carrega o endereço do registrador RCGCGPIO
	MOV		R1, #GPIO_PORTA
	ORR     R1, #GPIO_PORTQ
	ORR     R1, #GPIO_PORTB
	ORR     R1, #GPIO_PORTP
	ORR     R1, #GPIO_PORTJ
	STR     R1, [R0]
	
	LDR     R0, =SYSCTL_PRGPIO_R
EsperaGPIO  LDR     R1, [R0]						;Lê da memória o conteúdo do endereço do registrador                 
	MOV		R2, #GPIO_PORTA
	ORR     R2, #GPIO_PORTQ
	ORR     R2, #GPIO_PORTB
	ORR     R2, #GPIO_PORTP
	ORR     R2, #GPIO_PORTJ
	STR     R2, [R0]
	TST     R1, R2							
	BEQ     EsperaGPIO	
	
	
; 2. Limpar o AMSEL para desabilitar a analógica
	MOV     R1, #0x00						
	LDR     R0, =GPIO_PORTA_AHB_AMSEL_R    
	STR     R1, [R0]						
	LDR     R0, =GPIO_PORTQ_AHB_AMSEL_R		
	STR     R1, [R0]
	LDR     R0, =GPIO_PORTB_AHB_AMSEL_R    
	STR     R1, [R0]	
	LDR     R0, =GPIO_PORTP_AHB_AMSEL_R    
	STR     R1, [R0]	
	LDR     R0, =GPIO_PORTJ_AHB_AMSEL_R    
	STR     R1, [R0]
	
; 3. Limpar PCTL para selecionar o GPIO
	MOV     R1, #0x00
	LDR     R0, =GPIO_PORTA_AHB_PCTL_R    
	STR     R1, [R0]						
	LDR     R0, =GPIO_PORTQ_AHB_PCTL_R		
	STR     R1, [R0]
	LDR     R0, =GPIO_PORTB_AHB_PCTL_R    
	STR     R1, [R0]	
	LDR     R0, =GPIO_PORTP_AHB_PCTL_R    
	STR     R1, [R0]	
	LDR     R0, =GPIO_PORTJ_AHB_PCTL_R    
	STR     R1, [R0]
	
; 4. DIR para 0 se for entrada, 1 se for saída
	LDR     R0, =GPIO_PORTA_AHB_DIR_R		
	MOV     R1, #2_11110000					
	STR     R1, [R0]		
	LDR     R0, =GPIO_PORTQ_AHB_DIR_R		
	MOV     R1, #2_00001111					
	STR     R1, [R0]	
	LDR     R0, =GPIO_PORTB_AHB_DIR_R		
	MOV     R1, #2_00110000				
	STR     R1, [R0]	
	LDR     R0, =GPIO_PORTP_AHB_DIR_R		
	MOV     R1, #2_00100000				
	STR     R1, [R0]	
	LDR     R0, =GPIO_PORTJ_AHB_DIR_R		
	MOV     R1, #2_00000000				
	STR     R1, [R0]	
	
; 5. Limpar os bits AFSEL para 0 para selecionar GPIO
	MOV     R1, #0x00						
	LDR     R0, =GPIO_PORTA_AHB_AFSEL_R    
	STR     R1, [R0]						
	LDR     R0, =GPIO_PORTQ_AHB_AFSEL_R		
	STR     R1, [R0]
	LDR     R0, =GPIO_PORTB_AHB_AFSEL_R    
	STR     R1, [R0]	
	LDR     R0, =GPIO_PORTP_AHB_AFSEL_R    
	STR     R1, [R0]	
	LDR     R0, =GPIO_PORTJ_AHB_AFSEL_R    
	STR     R1, [R0]
	
; 6. Setar os bits de DEN para habilitar I/O digital
	LDR     R0, =GPIO_PORTA_AHB_DEN_R		
	MOV     R1, #2_11110000					
	STR     R1, [R0]		
	LDR     R0, =GPIO_PORTQ_AHB_DEN_R		
	MOV     R1, #2_00001111					
	STR     R1, [R0]	
	LDR     R0, =GPIO_PORTB_AHB_DEN_R		
	MOV     R1, #2_00110000				
	STR     R1, [R0]	
	LDR     R0, =GPIO_PORTP_AHB_DEN_R		
	MOV     R1, #2_00100000				
	STR     R1, [R0]	
	LDR     R0, =GPIO_PORTJ_AHB_DEN_R		
	MOV     R1, #2_00000011				
	STR     R1, [R0]	
	
; 7. Para habilitar resistor de pull-up interno, setar PUR para 1
	LDR     R0, =GPIO_PORTJ_AHB_PUR_R			
	MOV     R1, #2_00000011						
	STR     R1, [R0]
	
	BX LR

PortA_Output

	
	LDR R2, =GPIO_PORTA_AHB_DATA_R
	LDR R0, [R2]
	BIC R0, #2_11110000
	ORR R0, R0, R9 
	STR R0, [R2]
	
	
	BX LR
	
PortQ_Output

	
	LDR R2, =GPIO_PORTQ_AHB_DATA_R
	LDR R0, [R2]
	BIC R0, #2_00001111
	ORR R0, R0, R8 
	STR R0, [R2]
	
	
	BX LR

PortJ_Input

	
	LDR R2, =GPIO_PORTJ_AHB_DATA_R
	LDR R1, [R2]
	
	
	BX LR

	
Display1_Output
	
	
	LDR R2, =GPIO_PORTP_AHB_DATA_R
	MOV R0, #2_00000000
	STR R0, [R2]
	LDR R2, =GPIO_PORTB_AHB_DATA_R
	MOV R0, #2_00100000
	STR R0, [R2]
	
	
; systic 5ms:
	PUSH {R0-R12}
	MOV R0, #7
	BL SysTick_Wait1ms
	POP {R0-R12}
	
	BX LR
	
Display2_Output
	
	
	LDR R2, =GPIO_PORTP_AHB_DATA_R
	MOV R0, #2_00000000
	STR R0, [R2]
	LDR R2, =GPIO_PORTB_AHB_DATA_R
	MOV R0, #2_000010000
	STR R0, [R2]
	
	
; systic 5ms:
	PUSH {R0-R12}
	MOV R0, #7
	BL SysTick_Wait1ms
	POP {R0-R12}
	
	BX LR
	
Led_Output
	
	
	LDR R2, =GPIO_PORTB_AHB_DATA_R
	MOV R0, #2_00000000
	STR R0, [R2]
	LDR R2, =GPIO_PORTP_AHB_DATA_R
	MOV R0, #2_00100000
	STR R0, [R2]
	
	
; systic 5ms:
	PUSH {R0-R12}
	MOV R0, #7
	BL SysTick_Wait1ms
	POP {R0-R12}
	
	BX LR	
	


    ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo
