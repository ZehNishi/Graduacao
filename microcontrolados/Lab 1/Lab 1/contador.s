;�rea de C�digo - Tudo abaixo da diretiva a seguir ser� armazenado na mem�ria de 
;                  c�digo
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma fun��o do arquivo for chamada em outro arquivo
		EXPORT contador
   
contador
	MOV R3, R7	;salva o passo em R3
loop_passo		;Incrementa R10(N�mero) em 1 R3(Passo) vezes
	
	CMP R10, #99	;Se for igual a 99 zera a contagem
	BEQ ig99
	
	ADD R10,#1		
	ADD R3, #-1
	CMP R3, #0
	BNE loop_passo
	
	BX LR
	
ig99				;Fun��o para zerar R10(Numero)
	MOV R10, #0
	ADD R3, #-1
	CMP R3, #0
	BNE loop_passo
	
	BX LR

	
	ALIGN                           ; garante que o fim da se��o est� alinhada 
    END                             ; fim do arquivo
									
