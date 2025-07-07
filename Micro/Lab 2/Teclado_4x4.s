; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2
		
		; Se alguma função do arquivo for chamada em outro arquivo	
		EXPORT Leitura_Teclado
		IMPORT PortL_Output
		IMPORT PortM_Input


Leitura_Teclado

	PUSH {LR}
	
	MOV R0, #2_1110			;Coluna 4
	BL PortL_Output
	BL PortM_Input
	CMP R0, #2_11101111			;Linha 4
	BEQ Tec_4x4
	CMP R0, #2_11011111			;Linha 3
	BEQ Tec_4x3
	CMP R0, #2_10111111			;Linha 2
	BEQ Tec_4x2
	CMP R0, #2_01111111			;Linha 1
	BEQ Tec_4x1
	
	MOV R0, #2_1101			;Coluna 3
	BL PortL_Output
	BL PortM_Input
	CMP R0, #2_11101111			;Linha 4
	BEQ Tec_3x4
	CMP R0, #2_11011111			;Linha 3
	BEQ Tec_3x3
	CMP R0, #2_10111111			;Linha 2
	BEQ Tec_3x2
	CMP R0, #2_01111111			;Linha 1
	BEQ Tec_3x1
	
	MOV R0, #2_1011			;Coluna 2
	BL PortL_Output
	BL PortM_Input
	CMP R0, #2_11101111			;Linha 4
	BEQ Tec_2x4
	CMP R0, #2_11011111			;Linha 3
	BEQ Tec_2x3
	CMP R0, #2_10111111			;Linha 2
	BEQ Tec_2x2
	CMP R0, #2_01111111			;Linha 1
	BEQ Tec_2x1
	
	MOV R0, #2_0111			;Coluna 1
	BL PortL_Output
	BL PortM_Input
	CMP R0, #2_11101111			;Linha 4
	BEQ Tec_1x4
	CMP R0, #2_11011111			;Linha 3
	BEQ Tec_1x3
	CMP R0, #2_10111111			;Linha 2
	BEQ Tec_1x2
	CMP R0, #2_01111111			;Linha 1
	BEQ Tec_1x1
	
	
	
	POP {PC}
	
	
	
Tec_4x4

	MOV R1, #'1'

	POP {PC}
	
Tec_4x3

	MOV R1, #'2'
	
	POP {PC}
	
Tec_4x2

	MOV R1, #'3'

	POP {PC}
	
Tec_4x1

	MOV R1, #'A'

	POP {PC}
	
Tec_3x4

	MOV R1, #'4'

	POP {PC}
	
Tec_3x3

	MOV R1, #'5'
	
	POP {PC}
	
Tec_3x2

	MOV R1, #'6'

	POP {PC}
	
Tec_3x1

	MOV R1, #'B'

	POP {PC}
	
Tec_2x4

	MOV R1, #'7'

	POP {PC}
	
Tec_2x3

	MOV R1, #'8'
	
	POP {PC}
	
Tec_2x2

	MOV R1, #'9'

	POP {PC}
	
Tec_2x1

	MOV R1, #'C'

	POP {PC}
	
Tec_1x4

	MOV R1, #'*'

	POP {PC}
	
Tec_1x3

	MOV R1, #'0'
	
	POP {PC}
	
Tec_1x2

	MOV R1, #'#'

	POP {PC}
	
Tec_1x1

	MOV R1, #'D'

	POP {PC}
		
		
		
		
		
		ALIGN                           ; garante que o fim da seção está alinhada 
		END                             ; fim do arquivo