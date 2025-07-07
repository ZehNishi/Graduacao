; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declarações EQU - Defines
;<NOME>         EQU <VALOR>
List EQU 0x20000D00
Primos EQU 0x20000E00
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

; -------------------------------------------------------------------------------
; Função main()
Start  
; Comece o código aqui <======================================================

;PASSAGEM DOS VALORES DA ROM PARA A RAM

	LDR R1, =LISTA_1 ; R1 recebe o endereço do primeiro elemento de LISTA_1
	LDR R0, =List ; 
	MOV R3, #-1; colocar o valor de -1 em R3 -> R3 é o contador do tamanho da lista
varre_str ; Loop de varredura para os valores da ROM para RAM
	LDRB R2, [R1], #1; R1 aponta para o endereço de LISTA_1, R2 recebe o valor do endereço apontado por R1, e R1 é incrementado para o proximo endereço da LISTA_1
	STRB R2, [R0], #1; Endereço apontado por R0 recebe o valor de R2
	ADD R3, #1; Incrementa 1 em R3
	CMP R2, #0; Compara R2 com 0
	BNE varre_str ;se R2 for diferente de zero, volta o loop
	
;SELEÇÃO DOS NUMEROS PRIMOS	

	LDR R0, =List
	LDR R7, =Primos
	MOV R9, R3; copiou o valor de R3 para R9, sera utilizado na função quebra na parte final do código
loop_primo 
	LDRB R2, [R0], #1 ;R2 recebe o valor do primeiro endereço de List, apontado por R0 e incrementa para o proximo endereço
	MOV R4, #2 ;R4 é o divisor, R4 = 2
	
check_primo
	UDIV R5, R2, R4 ;Salvou em R5 a divisão R2/R4, o numero é arredondado para baixo caso não seja inteiro
	MLS R6, R4, R5, R2 ;R6 = R2 - R4*R5
	CMP R6, #0 ;Se R6 for diferente de zero, R4 não é divisor de R2
	IT EQ ;if igual a zero
	BEQ nao_primo ;pulo para não_primo se R6 = 0
	ADD R4, #1 ;se R6 não for zero, incrementa 1 em R4 -> divisor
	CMP R4, R2 ;compara R2 com R4, se for igual o loop se encerra
	STRBEQ R2, [R7], #1 ;se for primo, salva R2 na lista de primos no endereço apontado por R7 e incrementa o R7 
	BNE check_primo ;volta o loop caso R4 não for igual a R2
nao_primo
	ADD R3, #-1 ;diminuir 1 em R3 -> tamanho da lista
	CMP R3, #0 ;se for zero, chegou ao final da lista
	BNE loop_primo ;se não for, volta ao loop

;ORDENAÇÃO DOS VALORES

	LDR R0, =Primos ;R0 recebe o endereço do primeiro valor da lista de Primos
	LDR R1, =0x20000E01 ;R1 recebe o endereço do segundo valor da lista de Primos
ord_cres
	MOV R2, R1 ;Copiou o valor de R1 para R2, como forma de backup do endereço 
ind_cres
	LDRB R4, [R0] ;carregou o valor apontado por R0 em R4 -> Primeiro valor   
	LDRB R5, [R1] ;carregou o valor apontado por R1 em R5 -> Segundo valor
	CMP R5, #0 ;comparou com 0, se chegou a 0, chegou no ultimo elemento e vai pra quebra
	BEQ quebra
	CMP R4, R5
	ITT HS
	STRBHS R5, [R0]  
	STRBHS R4, [R1]
	;BHS troca ;Se R4 > R5, ele vai para troca
	;BLS nao_troca ;Se R4 < R5, vai para não_troca
;troca  
	;STRB R5, [R0]  
	;STRB R4, [R1]
;nao_troca ;sem comandos, apenas mantem as posições

	ADD R1, #1 ;Passou para o proximo endereço da lista apontado por R1 e com valor carregado em R5
	BNE ind_cres ;refaz o loop de comparação entre R4 e R5
	
quebra	;Final da comparação de um valor com todos os outros
	MOV R1, R2 ;salvou o valor de R2 em R1, para voltar ao endereço R1 original, antes das comparações 
	ADD R0, #1 ;avançou para o proximo valor
	ADD R1, #1 ;avançou para o proximo valor, posterior a R0
	ADD R9, #-1 ;diminui o tamanho da lista
	CMP R9, #1 ;ultimo da lista e final do programa
	BNE ord_cres 

	NOP 
	
	;Constantes

LISTA_1 DCB 193, 10, 74, 127, 43, 14, 211, 3, 203, 5, 21, 7, 206, 233, 157, 237, 241, 105, 252, 19, 0

    ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo
