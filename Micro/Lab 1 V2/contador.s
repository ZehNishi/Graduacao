;Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo
		EXPORT contador
   
contador
	MOV R3, R7
	MOV R1, #0
loop_passo
	
	CMP R1,#1
	CMPNE R0, #99
	MOVEQ R0, #0
	ADDEQ R3, #-1
	CMPEQ R3, #0
	BNE loop_passo
	BXEQ LR
	
	ADD R0, #1
	ADD R3, #-1
	CMP R3, #0
	BNE loop_passo
	
	BX LR
	


	
	ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo
									
