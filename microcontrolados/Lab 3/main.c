// main.c


#include <stdint.h>

void PLL_Init(void);
void SysTick_Init(void);
void SysTick_Wait1ms(uint32_t delay);
void GPIO_Init(void);
uint8_t Leitura_Teclado();
void LCD_INIT ();
void LCD_Command(uint8_t x);
void LCD_Print(uint8_t x);
void LCD_Clear();
void Segunda_Linha();
void LCD_Print_String(uint8_t mensagem[31]);
void Passo_Completo_A();
void Passo_Completo_H();
void Meio_Passo_A();
void Meio_Passo_H();
void LED_H(uint8_t x);
void LED_A(uint8_t x);
void Interrupcao();

int main(void)
{
	PLL_Init();
	SysTick_Init();
	GPIO_Init();
	LCD_INIT();
	Interrupcao();
	
	//Configuração dos parâmetros 
	uint8_t msg1[31] = "Numero de VoltasDesejada:1 a 10";
	LCD_Print_String(msg1);
	uint8_t voltas = 0;
	uint8_t voltas_2 = 0;
	while (voltas == 0){
		voltas = Leitura_Teclado();
			if (voltas == 'A' || voltas == 'B' || voltas == 'C' || voltas == 'D' || voltas == '*' || voltas == '#')
			{
			voltas = 0;
			} 
			if (voltas == 1)
			{
				voltas_2 = Leitura_Teclado();
				if(voltas_2 == 0)
				{
					voltas = 10;
				}
			}
	}
	SysTick_Wait1ms(500);
	LCD_Clear();
	
	uint8_t msg2[31] = "Velocidade      Desejada       ";
	LCD_Print_String(msg2);
	SysTick_Wait1ms(1000);
	LCD_Clear();
	uint8_t msg3[31] = "1 Passo Completo2 Meio Passo   ";
	LCD_Print_String(msg3);
	uint8_t passo = 0;
	while (passo == 0){
		passo = Leitura_Teclado();
			if (voltas == 'A' || voltas == 'B' || voltas == 'C' || voltas == 'D' || voltas == '*' || voltas == '#' || voltas == 0 ||voltas == 3 || voltas == 4 || voltas == 5 || voltas == 6 || voltas == 7 || voltas == 8 || voltas == 9)
			{
			passo = 0;
			} 
	}
	SysTick_Wait1ms(500);
	LCD_Clear();
	
	uint8_t msg4[31] = "Sentido Desejado";
	LCD_Print_String(msg4);
	SysTick_Wait1ms(1000);
	LCD_Clear();
	uint8_t msg5[31] = "A Anti-Horario  B Horario      ";
	LCD_Print_String(msg5);
	uint8_t sentido = 0;
	while ((sentido == 0)){
		sentido = Leitura_Teclado();
			if (voltas == 'C' || voltas == 'D' || voltas == '*' || voltas == '#' || voltas == 0 || voltas == 1 || voltas == 2 || voltas == 3 || voltas == 4 || voltas == 5 || voltas == 6 || voltas == 7 || voltas == 8 || voltas == 9)
			{
			voltas = 0;
			} 
	}
	SysTick_Wait1ms(500);
	LCD_Clear();
	// Final das configurações iniciais
	
	//string que mostrara os parametros selecionados
	uint8_t parametros[31] = "vel=   - sent=   voltas=       ";
	
	//Salva a velocidade em parametros
	if(passo == 1)
	{
		parametros[4]='P';
		parametros[5]='C';
	}
		else
		{
			parametros[4]='M';
			parametros[5]='P';
		}
		
	//Salva o sentido em parametros
	if(sentido== 'A')
	{
		parametros[14]='A';
		parametros[15]='H';
	}
		else
		{
			parametros[14]='H';
			parametros[15]='O';
		}
		
	//Calculos dos passos totais para o numero de voltas definido
	uint16_t passototal = 0;
	if(passo == 1)
	{
		passototal = voltas*518; 
	}
		else
		{
			passototal = voltas*259;
		}
		
	uint16_t contador_voltas = 0; //contará os passos até atingir 1 volta completa
	uint8_t contador_45 = 0; //contará os passos para saber quando o eixo girar 45 graus
	uint8_t muda_led = 0; //parâmetro da função LED_A e LED_H, vai alterar os LEDS a cada 45 graus
		
 //funcionamento do motor
	while (passototal != 0)
	{
			if(passo == 1)
			{
				if(sentido == 'A')
				{
					Passo_Completo_A();
					LED_A(muda_led);					
				}
					else
					{
						Passo_Completo_H();	
						LED_H(muda_led);
					}
			} 
			if(passo == 2)
			{
				if(sentido == 'A')
				{
					Meio_Passo_A();			
					LED_A(muda_led);
				}
					else
					{
						Meio_Passo_H();	
						LED_H(muda_led);
					}
			} 
			passototal = passototal - 1;
			contador_voltas = contador_voltas + 1;
			contador_45 = contador_45 + 1;
			
			if ((passo == 1 && contador_voltas == 518) || (passo == 2 && contador_voltas == 259)) //completou uma volta
			{
				voltas = voltas - 1;
				contador_voltas = 0;
			} 
			if ((passo == 1 && contador_45 == 65) || (passo == 2 && contador_45 == 32)) //atingiu 45 graus
			{
				muda_led = muda_led + 1;
				contador_45 = 0;
				if (muda_led == 8)
				{
				muda_led = 0;
				}
			} 
			
		parametros[24] = voltas; //salva o valor das voltas atuais
		LCD_Print_String(parametros);	
		}

	// reset
	SysTick_Wait1ms(500);
	LCD_Clear();
	uint8_t msgfinal[31] = "FIM - pressione *para reiniciar";
	LCD_Print_String(msgfinal);
	uint8_t reset = 0; 
	while (reset != '*')
	{
		reset = Leitura_Teclado();
	}
	SysTick_Wait1ms(500);
	LCD_Clear();
	main(); 
	
	return 0;
}
