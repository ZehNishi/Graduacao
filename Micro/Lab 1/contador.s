;Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo
		EXPORT contador
   
contador
	MOV R3, R7
	MOV R1, #0
loop_passo
	
	CMP R10, #99
	BEQ ig99
	
	ADD R10,#1
	ADD R3, #-1
	CMP R3, #0
	BNE loop_passo
	
	BX LR
	
ig99
	MOV R10, #0
	ADD R3, #-1
	CMP R3, #0
	BNE loop_passo
	
	BX LR

	
	ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo
									
