#include <stdint.h>

void colunas(uint8_t x);
uint8_t linhas();

uint8_t Leitura_Teclado()
{
		uint8_t y = 0;
		colunas(0x0E);
		uint8_t x = linhas();
		switch (x){
			case 0xEF: 
					y = '1';
					break;
			case 0xDF: 
					y = '2';
					break;
			case 0xBF:
					y = '3';
					break;
			case 0x7F:
					y = 'A';				
					break;
			default: 
					break;
		}
		colunas(0x0D);
		x = linhas();
		switch (x){
			case 0xEF: 
					y = '4';
					break;
			case 0xDF:
					y = '5';
					break;
			case 0xBF:
					y = '6';
					break;
			case 0x7F:
					y = 'B';
					break;
			default: 
					break;
		}
		colunas(0x0B);
		x = linhas();
		switch (x){
			case 0xEF: 
					y = '7';
					break;
			case 0xDF:
					y = '8';
					break;
			case 0xBF:
					y = '9';
					break;
			case 0x7F:
					y = 'C';
					break;
			default: 
					break;
		}
		colunas(0x07);
		x = linhas();
		switch (x){
			case 0xEF: 
					y = '*';
					break;
			case 0xDF:
					y = '0';				
					break;
			case 0xBF:
					y = '#';
					break;
			case 0x7F:
					y = 'D';
					break;
			default: 
					break;
		}
		
		
		
		
		
		
		
		
		return y;





}
