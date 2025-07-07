; -------------------------------------------------------------------------------
        THUMB                        ; Instru��es do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declara��es EQU - Defines
;<NOME>         EQU <VALOR>
List EQU 0x20000D00
Primos EQU 0x20000E00
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

; -------------------------------------------------------------------------------
; Fun��o main()
Start  
; Comece o c�digo aqui <======================================================

	LDR R1, =LISTA_1
	LDR R0, =0x20000D00
	MOV R3, #-1
varre_str
	LDRB R2, [R1], #1
	STRB R2, [R0], #1
	ADD R3, #1
	CMP R2, #0
	BNE varre_str
	LDR R0, =0x20000D00
	LDR R7, =0x20000E00
	MOV R9, R3
loop_primo
	LDRB R2, [R0], #1
	MOV R4, #2
	UDIV R8, R2, R4
check_primo
	
	UDIV R5, R2, R4
	MLS R6, R4, R5, R2
	CMP R6, #0
	IT EQ
	BEQ nao_primo
	ADD R4, #1
	CMP R4, R2 
	STRBEQ R2, [R7], #1
	BNE check_primo
nao_primo
	ADD R3, #-1
	CMP R3, #0
	BNE loop_primo

	LDR R0, =0x20000E00
	LDR R1, =0x20000E01
ord_cres
	
	MOV R2, R1

ind_cres
	LDRB R4, [R0]
	LDRB R5, [R1]
	CMP R5, #0
	BEQ quebra
	CMP R4, R5
	BHS troca
	BLS nao_troca
troca
	STRB R5, [R0]
	STRB R4, [R1]
nao_troca
	ADD R1, #1
	BNE ind_cres
quebra	
	MOV R1, R2
	ADD R0, #1
	ADD R1, #1
	ADD R9, #-1
	CMP R9, #1
	BNE ord_cres


	NOP
	
	;Constantes

LISTA_1 DCB 193, 10, 74, 127, 43, 14, 211, 3, 203, 5, 21, 7, 206, 233, 157, 237, 241, 105, 252, 19, 0

    ALIGN                           ; garante que o fim da se��o est� alinhada 
    END                             ; fim do arquivo
