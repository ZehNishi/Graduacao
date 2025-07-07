// main.c


#include <stdint.h>
#include "tm4c1294ncpdt.h"

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
void inicial();
void loop();
void GPIOPortJ_Handler();
void LED_OUTPUT(_Bool x);
void EnableInterrupts();

int main(void)
{
	PLL_Init();
	SysTick_Init();
	GPIO_Init();
	LCD_INIT();
	Interrupcao();
	inicial();
	loop();
	return 0;
}
void inicial() {
	
	uint8_t msg0[31] = "Aperte * para   comecar        ";
	LCD_Print_String(msg0);
	uint8_t ini = 0;
	while (ini != '*'){
		ini = Leitura_Teclado();
	}
	LCD_Clear();
	SysTick_Wait1ms(500);
	
	return;
}

void loop(){
	
	uint8_t msg1[31] = "Numero de VoltasDesejada:01--10";
	LCD_Print_String(msg1);
	SysTick_Wait1ms(500);
	uint8_t voltas = 0;
	uint8_t voltas_2 = 0;
	while(voltas == 0){
		voltas = Leitura_Teclado();	
		if (voltas == 'A' || voltas == 'B' || voltas == 'C' || voltas == 'D'  || voltas == '*' || voltas == '#' || voltas == '2' || voltas == '3' || voltas == '4' || voltas == '5' || voltas == '6' || voltas == '7' || voltas == '8' || voltas == '9' )
			{
			voltas = 0;
			}
	}
	LCD_Clear();
	LCD_Print(voltas);
	SysTick_Wait1ms(500);
	while(voltas_2 == 0){
		voltas_2 = Leitura_Teclado();	
		if(voltas=='0'){
			if (voltas_2 == 'A' || voltas_2 == 'B' || voltas_2 == 'C' || voltas_2 == 'D'  || voltas_2 == '*' || voltas_2 == '#' || voltas_2 == '0'){
				voltas_2=0;
			}
		}else{
			if (voltas_2 == 'A' || voltas_2 == 'B' || voltas_2 == 'C' || voltas_2 == 'D'  || voltas_2 == '*' || voltas_2 == '#' || voltas_2 == '1' || voltas_2 == '2' || voltas_2 == '3' || voltas_2 == '4' || voltas_2 == '5'  || voltas_2 == '6' || voltas_2 == '7' || voltas_2 == '8' || voltas_2 == '9'){
				voltas_2=0;
			}
		}
	}
	LCD_Print(voltas_2);
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
			if (passo == 'A' || passo == 'B' || passo == 'C' || passo == 'D' || passo == '*' || passo == '#' || passo == '0' ||passo == '3' || passo == '4' || passo == '5' || passo == '6' || passo == '7' || passo == '8' || passo == '9')
			{
			passo = 0;
			} 
	}
	LCD_Clear();
	SysTick_Wait1ms(500);
	
	
	uint8_t msg4[31] = "Sentido Desejado               ";
	LCD_Print_String(msg4);
	SysTick_Wait1ms(1000);
	LCD_Clear();
	uint8_t msg5[31] = "A Anti-Horario  B Horario      ";
	LCD_Print_String(msg5);
	uint8_t sentido = 0;
	while ((sentido == 0)){
		sentido = Leitura_Teclado();
			if (sentido == 'C' || sentido == 'D' || sentido == '*' || sentido == '#' || sentido == '0' || sentido == '1' || sentido == '2' || sentido == '3'|| sentido == '4' || sentido == '5' || sentido == '6' || sentido == '7'|| sentido == '8' || sentido == '9')
			{
			sentido = 0;
			} 
	}
	LCD_Clear();
	SysTick_Wait1ms(500);
	
	
	// Final das configurações iniciais
	
	//string que mostrara os parametros selecionados
	uint8_t parametros[31] = "vel=   - sent=  voltas=        ";
	
	//Salva a velocidade em parametros
	if(passo == '1')
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
 
		uint16_t contador_voltas = 0; //contará os passos até atingir 1 volta completa
		uint8_t contador_45 = 0; //contará os passos para saber quando o eixo girar 45 graus
		uint8_t muda_led = 0; //parâmetro da função LED_A e LED_H, vai alterar os LEDS a cada 45 graus
		uint8_t voltas_rest = 0;
		if(voltas=='0'){
			voltas_rest = voltas_2 - 48;
		}else{
			voltas_rest = 10;
		}
		uint16_t passototal = voltas_rest*518;
		if(voltas_rest == 10){
					parametros[24] = '1';
					parametros[25] = '0';
				}else {
					parametros[24] = '0';
					parametros[25] = voltas_2;
				}
				LCD_Print_String(parametros);	
	
		 //funcionamento do motor
	while (passototal != 0)
	{
		GPIO_PORTJ_AHB_IM_R = 0x1;
			if(passo == '1')
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
			if(passo == '2')
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
			
			if (contador_voltas == 518) //completou uma volta
			{
				voltas_rest = voltas_rest - 1;
				voltas_2 = voltas_2 - 1;
				if(voltas_2<48){
					voltas_2 = '9';
				}
				contador_voltas = 0;
				if(voltas_rest == 10){
					parametros[24] = '1';
					parametros[25] = '0';
				}else {
					parametros[24] = '0';
					parametros[25] = voltas_2;
				}
				LCD_Print_String(parametros);	
				
			} 
			if (contador_45 == 65) //atingiu 45 graus
			{
				muda_led = muda_led + 1;
				contador_45 = 0;
				if (muda_led == 8)
				{
				muda_led = 0;
				}
			} 
		

		}
	
	
	// reset
	LCD_Clear();
	GPIO_PORTJ_AHB_IM_R = 0x0;
	SysTick_Wait1ms(500);
	uint8_t msgfinal[31] = "FIM-pressione * para reiniciar ";
	LCD_Print_String(msgfinal);
	uint8_t reset = 0; 
	while (reset != '*')
	{
		reset = Leitura_Teclado();
	}
	SysTick_Wait1ms(500);
	LCD_Clear();
	loop();	
	
	return;
}

void GPIOPortJ_Handler(){
	GPIO_PORTJ_AHB_ICR_R = 0x1;
	LCD_Clear();
	LED_OUTPUT(0);
	SysTick_Wait1ms(500);
	loop();
	return;
}
