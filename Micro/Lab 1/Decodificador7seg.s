; -------------------------------------------------------------------------------
; �rea de C�digo - Tudo abaixo da diretiva a seguir ser� armazenado na mem�ria de 
;                  c�digo
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma fun��o do arquivo for chamada em outro arquivo	
			EXPORT dec7
dec7
	
	CMP R0,#0
	LDREQ R9, =2_00110000
	LDREQ R8, =2_00001111
	BXEQ LR
	CMP R0,#1
	LDREQ R9, =2_00000000
	LDREQ R8, =2_00000110
	BXEQ LR
	CMP R0,#2
	LDREQ R9, =2_01010000
	LDREQ R8, =2_00001011
	BXEQ LR
	CMP R0,#3
	LDREQ R9, =2_01000000
	LDREQ R8, =2_00001111
	BXEQ LR
	CMP R0,#4
	LDREQ R9, =2_01100000
	LDREQ R8, =2_00000110
	BXEQ LR
	CMP R0,#5
	LDREQ R9, =2_01100000
	LDREQ R8, =2_00001101
	BXEQ LR
	CMP R0,#6
	LDREQ R9, =2_01110000
	LDREQ R8, =2_00001101
	BXEQ LR
	CMP R0,#7
	LDREQ R9, =2_00000000
	LDREQ R8, =2_00000111
	BXEQ LR
	CMP R0,#8
	LDREQ R9, =2_01110000
	LDREQ R8, =2_00001111
	BXEQ LR
	CMP R0,#9
	LDREQ R9, =2_01100000
	LDREQ R8, =2_00001111
	BXEQ LR

	
	
	BX LR
		
		
		
		
		
		
		ALIGN                           ; garante que o fim da se��o est� alinhada 
		END                             ; fim do arquivo
