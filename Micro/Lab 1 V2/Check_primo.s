; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2
		
		; Se alguma função do arquivo for chamada em outro arquivo	
		EXPORT primo


primo
	PUSH {R1-R9}
	MOV R4, #2 ;R4 é o divisor, R4 = 2
	MOV R0, #0
	
check_primo
	UDIV R5, R10, R4 ;Salvou em R5 a divisão R2/R4, o numero é arredondado para baixo caso não seja inteiro
	MLS R6, R4, R5, R10 ;R6 = R2 - R4*R5
	CMP R6, #0 ;Se R6 for diferente de zero, R4 não é divisor de R2
	POPEQ {R2-R12}
	BXEQ LR ;pulo para não_primo se R6 = 0
	ADD R4, #1 ;se R6 não for zero, incrementa 1 em R4 -> divisor
	CMP R4, R10 ;compara R2 com R4, se for igual o loop se encerra
	MOVEQ R0,#1 ;se for primo, salva 1 no R0 
	POPEQ {R1-R9}
	BXEQ LR
	B check_primo
	
	
		ALIGN                           ; garante que o fim da seção está alinhada 
		END                             ; fim do arquivo