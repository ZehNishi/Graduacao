; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
			EXPORT dec7
dec7
	
;PORTA A					;Recebe um número em R0 e decodifica um A7;A6;A5;A5;Q0;Q1;Q2;Q3 usando os registradores R9;R8
	CMP R0,#0
	LDREQ R9, =2_00110000
	CMP R0,#1
	LDREQ R9, =2_00000000
	CMP R0,#2
	LDREQ R9, =2_01010000
	CMP R0,#3
	LDREQ R9, =2_01000000
	CMP R0,#4
	LDREQ R9, =2_01100000
	CMP R0,#5
	LDREQ R9, =2_01100000
	CMP R0,#6
	LDREQ R9, =2_01110000
	CMP R0,#7
	LDREQ R9, =2_00000000
	CMP R0,#8
	LDREQ R9, =2_01110000
	CMP R0,#9
	LDREQ R9, =2_01100000
;PORTA Q
	CMP R0,#0
	LDREQ R8, =2_00001111
	CMP R0,#1
	LDREQ R8, =2_00000110
	CMP R0,#2
	LDREQ R8, =2_00001011
	CMP R0,#3
	LDREQ R8, =2_00001111
	CMP R0,#4
	LDREQ R8, =2_00000110
	CMP R0,#5
	LDREQ R8, =2_00001101
	CMP R0,#6
	LDREQ R8, =2_00001101
	CMP R0,#7
	LDREQ R8, =2_00000111
	CMP R0,#8
	LDREQ R8, =2_00001111
	CMP R0,#9
	LDREQ R8, =2_00001111
	
	
	BX LR
		
		
		
		
		
		
		ALIGN                           ; garante que o fim da seção está alinhada 
		END                             ; fim do arquivo
