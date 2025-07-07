; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
			                        ; outro arquivo. No caso startup.s
		EXPORT EightBitHistogram
		
; -------------------------------------------------------------------------------
	


	
EightBitHistogram

            MUL         R0,R0,R1      ;Salva em R0 o tamanho da imagem
            PUSH        {R4,R5,R6,R7,R8,R9}
            MOV         R7, R0        ;Salva o tamanho da imagem em R7
            MOV         R4, #65536	  ;Se for maior q 64kb quebra o código
            CMP         R0,R4
            BGT         fim
            MOV         R5, #255	   ;Número de pixels diferentes de 8bits
            MOV         R6, #0		   
            MOV         R8, R3         ;Salva o primeiro endereço do histograma em R8
populate
			STR         R6, [R3], #4   ;Coloca 0 para todos os valores de histograma
            SUB         R5,R5,#1
            CMP         R5, #0
            BEQ         calculate
            B           populate
            
calculate 
			MOV         R3, R8          ;Salva em R3 o primeiro endereço do histograma
            LDRB        R4, [R2], #1   ;Leitura do valor do pixel da imagem, incremento de R2 para próximo pixel
            LDR         R6, [R3,R4]    ;Carrega em R6 o valor do pixel a partir de R3
            ADD         R6, R6, #1     ;Incrementa o número de pixel do valor de R6
            STR         R6, [R3,R4]   ;Salva o valor de R6 no endereço correspondente ao pixel
            SUB         R0, R0, #1
            CMP         R0, #0		  ;Faz para todos os pixels da imagem
            BNE         calculate
            B           fim2
fim   
			POP         {R4,R5,R6,R7,R8,R9} 
            MOV         R0,#0      ;Retorna 0 
            BX          LR
fim2       
			MOV         R0, R7    ;Retorna o tamanho da imagem
            POP         {R4,R5,R6,R7,R8,R9}
            BX          LR


    END