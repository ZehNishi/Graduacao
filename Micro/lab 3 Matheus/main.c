// Matheus Alvarez & Mariana Luz

#include <stdint.h>
#include "tm4c1294ncpdt.h"


void PLL_Init(void);
void SysTick_Init(void);
void SysTick_Wait1ms(uint32_t delay);
void GPIO_Init(void);
void Int_Init(void);
void GPIOPortJ_Handler(void);
uint32_t PortJ_Input(void);
void PortA_Output(uint32_t entrada);
void PortF_Output(uint32_t leds);
void PortN_Output(uint32_t leds);
void PortH_Output(uint32_t parametro);
void PortP_Output(uint32_t entrada);
void PortQ_Output(uint32_t entrada);
void Imprime_Frase(uint8_t* frase);
void LCD_Init(void);
void LCD_Caracter(uint8_t caracter);
void LCD_Instrucao(uint32_t codigo);
uint32_t Teclas_Input(uint32_t* parametro,uint32_t* parametro2,uint32_t* parametro3);
int nvoltas=-1;
int nvoltasMultiplicada=0;

int main(void)
{
	PLL_Init();
	SysTick_Init();
	GPIO_Init();
	Int_Init();
	LCD_Init();
	PortP_Output(0x20);
	int configurado=0;
	int estado=0;
	int direcao =2;
	int velocidade =0;
	uint32_t leds;
	// Faz o que vai aparecer no display, XX é direção, YY é velocidade, Z número de voltas
	uint8_t frase[] = "XX, YY, Z/";
	uint8_t fim[]= "FIM/";
	uint8_t numeroPergunta[]= "Numero de voltas/";
	uint8_t direcaoPergunta[]= "Direcao?/";
	uint8_t velocidadePergunta[]= "Velocidade?/";
	uint32_t meioPasso[8] = { 0x01, 0x03, 0x02, 0x06, 0x04, 0x0C, 0x08, 0x09 }; //todos os 8 passos do ciclo do meio passo
	int contadorLED=0;
	int multiplicacao;
	while(1)
	{
		nvoltas=-1;
		configurado=0;
		estado=0;
		direcao =2;
		velocidade =2;
		leds=1;
		
		
		while(!configurado)
		{
			Imprime_Frase(numeroPergunta);
			//Recebe número ou espera(1-A no teclado)
			while(nvoltas>10 || nvoltas<1 || nvoltas==0)
			{
				nvoltas = Teclas_Input(&GPIO_PORTL_DATA_R,&GPIO_PORTM_DIR_R,&GPIO_PORTM_DATA_R);
				SysTick_Wait1ms(100);
			}
			if(nvoltas==0)
			{
				nvoltas=10;
			}
			Imprime_Frase(direcaoPergunta);
			//Recebe número ou espera(0-1 no teclado) 0 Horario 1 antihorario
			while(direcao>1 || direcao<0)
			{
				direcao = Teclas_Input(&GPIO_PORTL_DATA_R,&GPIO_PORTM_DIR_R,&GPIO_PORTM_DATA_R);
				SysTick_Wait1ms(100);

			}
			Imprime_Frase(velocidadePergunta);
			//Recebe número ou espera(0-1 no teclado) 0 meio passo 1 passo completo
			while(velocidade>1 || velocidade < 0)
			{
				velocidade = Teclas_Input(&GPIO_PORTL_DATA_R,&GPIO_PORTM_DIR_R,&GPIO_PORTM_DATA_R);
				SysTick_Wait1ms(100);
			}			
			configurado=1;
		}
		GPIO_PORTJ_AHB_IM_R = 0x1; //ativa interrupcao
		PortP_Output(0x32); // ativa os LEDS

		// Coloca Direção na frase
		if(direcao==0)
		{
			frase[0]='H';
			frase[1]='R';
		}
		else
		{
			frase[0]='A';
			frase[1]='H';
		}
		//Coloca Velocidade na frase
		if(velocidade==0)
		{
			frase[4]='M';
			frase[5]='P';
		}
		else
		{
			frase[4]='P';
			frase[5]='C';
		}
		frase[8] = (char)nvoltas;
		if(velocidade==0)
		{
			nvoltasMultiplicada=nvoltas*512;
			multiplicacao=512;
		}
		else
		{
			nvoltasMultiplicada=nvoltas*256;		
			multiplicacao=256;
		}	
		
		nvoltas=nvoltasMultiplicada;
		while (nvoltasMultiplicada!=0)
		{
				if(velocidade==1)
				{
					if(direcao==0)
					{
						PortH_Output(0x01);
						SysTick_Wait1ms(5);
						PortH_Output(0x03);
						SysTick_Wait1ms(5);
						PortH_Output(0x02);
						SysTick_Wait1ms(5);
						PortH_Output(0x06);
						SysTick_Wait1ms(5);
						PortH_Output(0x04);
						SysTick_Wait1ms(5);
						PortH_Output(0x0c);
						SysTick_Wait1ms(5);
						PortH_Output(0x08);
						SysTick_Wait1ms(5);
						PortH_Output(0x09);
						SysTick_Wait1ms(5);					
					}
					else
					{
						PortH_Output(0x09);
						SysTick_Wait1ms(5);
						PortH_Output(0x08);
						SysTick_Wait1ms(5);
						PortH_Output(0x0c);
						SysTick_Wait1ms(5);
						PortH_Output(0x04);
						SysTick_Wait1ms(5);
						PortH_Output(0x06);
						SysTick_Wait1ms(5);
						PortH_Output(0x02);
						SysTick_Wait1ms(5);
						PortH_Output(0x03);
						SysTick_Wait1ms(5);
						PortH_Output(0x01);
						SysTick_Wait1ms(5);									
					}
				}
				else
				{
					if(direcao==0)
					{
						PortH_Output(0x03);
						SysTick_Wait1ms(5);
						PortH_Output(0x06);
						SysTick_Wait1ms(5);
						PortH_Output(0x0c);
						SysTick_Wait1ms(5);
						PortH_Output(0x09);				
						SysTick_Wait1ms(5);
					}
					else
					{
						PortH_Output(0x09);
						SysTick_Wait1ms(5);
						PortH_Output(0x0c);
						SysTick_Wait1ms(5);
						PortH_Output(0x06);
						SysTick_Wait1ms(5);
						PortH_Output(0x03);				
						SysTick_Wait1ms(5);
					}						
				}
				// Muda os leds que serão acionados de acordo com o estado
				if(direcao==0)
				{
					leds=leds<<1;
				}
				else
				{
					leds=leds>>1;
				}
				if(leds>=0x100)
				{
					leds=1;
				}
				if(leds<=0)
				{
					leds=0x80;
				}				
				PortQ_Output(leds);  //acende os LEDs
				PortA_Output(leds);  //acende os LEDs
				frase[8] = (int)(((nvoltasMultiplicada-1)/multiplicacao)+1) +	'0'; //muda o nvoltas
				Imprime_Frase(frase);
				SysTick_Wait1ms(100);
				if(nvoltasMultiplicada>=1)
				{
					nvoltasMultiplicada=nvoltasMultiplicada-1;
				}
				
		}
		Imprime_Frase(fim);
		GPIO_PORTJ_AHB_IM_R = 0x0; //desativa interrupcao
		
	}
}

void Imprime_Frase(uint8_t* frase)
{
	LCD_Instrucao(0x01);
	int i = 0;
	// '#' sinalzia fim da string
	while(frase[i] != '/')
	{
		LCD_Caracter(frase[i]);
		i++;
		if(i == 16)
			LCD_Instrucao(0xC0);
	}
	
	return;
}

void GPIOPortJ_Handler(void)
{
	nvoltasMultiplicada = 0;							
	GPIO_PORTJ_AHB_ICR_R = 0x1;
}
