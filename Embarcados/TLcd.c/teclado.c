// teclado.c
// Desenvolvido para a placa EK-TM4C1294XL + Shield LCD(1602b) + Teclado (4x4)
// Controla o teclado matricial 4 linhas x 3 colunas
// Projeto e Esquemático do Shield: http://www.elf52.daeln.com.br
// Prof. DaLuz
// Prof. Guilherme Peron
// Prof. Marcos P.
// 16/07/2023

#include "gpio.h"
#include <stdint.h>
#include "tm4c1294ncpdt.h"

// -------------------------------------------------------------------------------
// Função AtivaColuna
// Habilita a coluna respectiva
// Parâmetro de entrada: Número da Coluna de 1 a 4 a ser habilitada
// Parâmetro de saída: não tem
void AtivaColuna(uint8_t coluna)
{
    switch(coluna)
		{
			case 1:
				PortM_Output2(0xE0);    //Zerar PM4
				break;
			case 2:
				PortM_Output2(0xD0);    //Zerar PM5
				break;
			case 3:
				PortM_Output2(0xB0);    //Zerar PM6
				break;
			case 4:
				PortM_Output2(0x70);    //Zerar PM7
				break;
			default:
				PortM_Output2(0xF0);
				break;				
		}
}

// -------------------------------------------------------------------------------
// Função LeLinha
// Retorna qual linha foi pressionada
// Parâmetro de entrada: não tem
// Parâmetro de saída: retorna a linha que está ativa
uint8_t LeLinha(void)
{
	  uint32_t portL_input;
		portL_input = PortL_Input();
	  switch(portL_input)
		{
			case 0x0E:  //Port L0
				return 1;
			case 0x0D:  //Port L1
				return 2;
			case 0x0B:  //Port L2
				return 3;
			case 0x07:  //Port L3
				return 4;
			default:
				return 0;
		}
}

// -------------------------------------------------------------------------------
// Função VarreTeclado
// Varre o teclado habilitando cada coluna para verificar qual linha está pressionada
// Parâmetro de entrada: não tem
// Parâmetro de saída: não tem
uint8_t VarreTeclado(void)
{
		uint8_t linha, caracter = 0;
	
		//Varre a primeira coluna
		AtivaColuna(1);
		linha = LeLinha();
		if (linha)
		{
			switch (linha)
			{
				case 1:
					caracter = '7';
					break;
				case 2:
					caracter = '4';
					break;
				case 3:
					caracter = '1';
					break;
				case 4:
					caracter = '#';
					break;
			}
		}
	
		//Varre a segunda coluna
		AtivaColuna(2);
		linha = LeLinha();
		if (linha && caracter == 0)
		{
			switch (linha)
			{
				case 1:
					caracter = '8';
					break;
				case 2:
					caracter = '5';
					break;
				case 3:
					caracter = '2';
					break;
				case 4:
					caracter = '0';
					break;
			}
		}
		
		//Varre a terceira coluna
		AtivaColuna(3);
		linha = LeLinha();
		if (linha && caracter == 0)
		{
			switch (linha)
			{
				case 1:
					caracter = '9';
					break;
				case 2:
					caracter = '6';
					break;
				case 3:
					caracter = '3';
					break;
				case 4:
					caracter = '*';
					break;
			}
		}	
		
		//Varre a quarta coluna
		AtivaColuna(4);
		linha = LeLinha();
		if (linha && caracter == 0)
		{
			switch (linha)
			{
				case 1:
					caracter = 'A';
					break;
				case 2:
					caracter = 'B';
					break;
				case 3:
					caracter = 'C';
					break;
				case 4:
					caracter = 'D';
					break;
			}
		}		
return(caracter);
}
