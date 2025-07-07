; -------------------------------------------------------------------------------
; �rea de C�digo - Tudo abaixo da diretiva a seguir ser� armazenado na mem�ria de 
;                  c�digo
        AREA    |.text|, CODE, READONLY, ALIGN=2
		
		; Se alguma fun��o do arquivo for chamada em outro arquivo	
		EXPORT primo


primo
	PUSH {R1-R9}
	MOV R4, #2 ;R4 � o divisor, R4 = 2
	MOV R0, #0
	
check_primo
	UDIV R5, R10, R4 ;Salvou em R5 a divis�o R2/R4, o numero � arredondado para baixo caso n�o seja inteiro
	MLS R6, R4, R5, R10 ;R6 = R2 - R4*R5
	CMP R6, #0 ;Se R6 for diferente de zero, R4 n�o � divisor de R2
	POPEQ {R2-R12}
	BXEQ LR ;pulo para n�o_primo se R6 = 0
	ADD R4, #1 ;se R6 n�o for zero, incrementa 1 em R4 -> divisor
	CMP R4, R10 ;compara R2 com R4, se for igual o loop se encerra
	MOVEQ R0,#1 ;se for primo, salva 1 no R0 
	POPEQ {R1-R9}
	BXEQ LR
	B check_primo
	
	
		ALIGN                           ; garante que o fim da se��o est� alinhada 
		END                             ; fim do arquivo