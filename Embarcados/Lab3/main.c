/*##############################################################################
Prof. Paulo Denis Garcez da Luz - 2023/2S
Desenvolvido para a placa EK-TM4C1294XL utilizando o SDK TivaWare no KEIL
Programa exemplo de blink usando 4 led, 2 botões e Periférico SysTick.
##############################################################################*/

//TivaWare uC: Usado internamente para identificar o uC em alguns .h da TivaWare
#define PART_TM4C1294NCPDT 1

#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include "inc/hw_ints.h"
#include "inc/hw_memmap.h"
#include "driverlib/debug.h"
#include "driverlib/gpio.h"
#include "driverlib/sysctl.h"
#include "driverlib/systick.h"
#include "driverlib/interrupt.h"
#include "driverlib/pin_map.h"
#include "driverlib/rom.h"
#include "driverlib/rom_map.h"
#include "driverlib/uart.h"

//variável que conta os ticks(1ms) - Volatile não permite o compilador otimizar o código 
static volatile unsigned int SysTicks1ms;
//buffer de rx ...
unsigned char rxbuffer[4];
//variável para receber o retorno do cfg do clk
uint32_t SysClock;

//Protótipos de funções criadas no programa, código depois do main
void SysTickIntHandler(void);
void UARTStringSend(const uint8_t *String, uint32_t tamanho);
void UART_Interruption_Handler(void);
void SetupSystick(void);
void SetupUart(void);
void SysTick_Wait1ms(uint32_t delay);

void colunas(uint8_t x);
uint8_t linhas();
uint8_t Leitura_Teclado();

void LCD_INIT ();
void LCD_Command(uint8_t x);
void LCD_Print(uint8_t x);
void LCD_Clear();
void Segunda_Linha();
void LCD_Print_String(uint8_t mensagem[31]);


int main(void)
{

	
   //Inicializar clock principal a 120MHz
  SysClock = SysCtlClockFreqSet((SYSCTL_XTAL_25MHZ | SYSCTL_OSC_MAIN | SYSCTL_USE_PLL | SYSCTL_CFG_VCO_240), 120000000);
  //executa configuração e inicialização do SysTick
  SetupSystick();  
  //habilitar gpio port N
  SysCtlPeripheralEnable(SYSCTL_PERIPH_GPION);
  //aguardar o periférico ficar pronto para uso
  while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPION)) {/*Espera habilitar o port*/}
  //habilitar gpio port F
  SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
  //aguardar o periférico ficar pronto para uso
  while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOF)) {/*Espera habilitar o port*/}
  //configura o pin_0 e pin_1 como saída
  //habilitar gpio port J
  SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOJ);
  //aguardar o periférico ficar pronto para uso
  while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOJ)) {/*Espera habilitar o port*/}
  GPIOPinTypeGPIOOutput(GPIO_PORTN_BASE, GPIO_PIN_0 | GPIO_PIN_1);
  //configura o pin_0 e pin_4 como saída
  GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_0 | GPIO_PIN_4);
  //configura o pin_0 e pin_1 como entrada
  GPIOPinTypeGPIOInput(GPIO_PORTJ_BASE, GPIO_PIN_0 | GPIO_PIN_1);
  //configura os pinos para 2mA como limite de corrente e com week pull-up
  GPIOPadConfigSet(GPIO_PORTJ_BASE, GPIO_PIN_0 | GPIO_PIN_1, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);
  //executa configuração e inicialização do SysTick
  SetupUart(); 
	
	
  //Portas L e M para o teclado
	//habilitar gpio port L
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOL);
  //aguardar o periférico ficar pronto para uso
  while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOL)) {/*Espera habilitar o port*/}
	//habilitar gpio port M
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOM);
  //aguardar o periférico ficar pronto para uso
  while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOM)) {/*Espera habilitar o port*/}
	
	//configura o pin_0,1,2,3 como saída
  GPIOPinTypeGPIOOutput(GPIO_PORTL_BASE, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3);
	//configura o pin_0 e pin_1 como entrada
  GPIOPinTypeGPIOInput(GPIO_PORTM_BASE, GPIO_PIN_7 | GPIO_PIN_6 | GPIO_PIN_5 | GPIO_PIN_4);
  //configura os pinos para 2mA como limite de corrente e com week pull-up
  GPIOPadConfigSet(GPIO_PORTM_BASE, GPIO_PIN_7 | GPIO_PIN_6 | GPIO_PIN_5 | GPIO_PIN_4, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);
	
	//Portas K e M para para o LCD
	//habilitar gpio port K
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOK);
  //aguardar o periférico ficar pronto para uso
  while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOK)) {/*Espera habilitar o port*/}
	
	//configura todos pinos como saída
  GPIOPinTypeGPIOOutput(GPIO_PORTK_BASE, 0xFF);
	GPIOPinTypeGPIOOutput(GPIO_PORTM_BASE, 0x07);
	
	LCD_INIT();
	LCD_Clear();
	
	bool db=true;
	unsigned int dbtime=0;
	#define dbt 100;
	uint8_t Teclado = '0';
	uint8_t Caracteres = 0;
	uint8_t string[10]; 
	uint8_t LCD_msg[31];
	
  //loop infinito
  while (1)
        {
					
					
				Teclado = Leitura_Teclado();
          if (db) 
	     {
	       
	       if ((SysTicks1ms>=dbtime))
	          {
	            //botão liberado
                    db=false;
	            //55ms para liberar estado do botão ... tempo anti-debouncing
                    dbtime=SysTicks1ms+dbt;
	          }
	     }
          else
	     {
	       //botão1 pressionado !!!
	       if (((Teclado)!=0)&&(SysTicks1ms>=dbtime))
	          {
	            //botão pressionado
	            db=true;
	            //55ms para liberar estado do botão ... tempo anti-debouncing
	            dbtime=SysTicks1ms+dbt;
										Caracteres = sprintf(string,"%c",Teclado);
										UARTStringSend(string, Caracteres);
										sprintf(LCD_msg,"Botao pressionado = %c              ",Teclado);
										LCD_Clear();
										LCD_Print_String(LCD_msg);
										
	          }
	     }
				
				



			 
					
				}
         
}


//Teclado 4x4
void colunas(uint8_t x)
{
		GPIOPinWrite(GPIO_PORTL_BASE, 0x0F,x);
	
		return;
	
}

uint8_t linhas()
{
		
		uint8_t x = GPIOPinRead(GPIO_PORTM_BASE,0xF0);
		x = x | 0x0F;
	

		return x;
	
}


uint8_t Leitura_Teclado()
{
		uint8_t y = 0;
		colunas(0x0E);
		uint8_t x = linhas();
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
					y = '1';
					break;
			case 0xDF:
					y = '2';
					break;
			case 0xBF:
					y = '3';
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
					y = '#';
					break;
			case 0xDF:
					y = '0';				
					break;
			case 0xBF:
					y = '*';
					break;
			case 0x7F:
					y = 'D';
					break;
			default: 
					break;
		}
		
		
		
		
		
		
		
		
		return y;





}



//LCD
void LCD_INIT (){
		GPIOPinWrite(GPIO_PORTK_BASE, 0xFF,0x38);
		SysTick_Wait1ms (2);
	
		GPIOPinWrite(GPIO_PORTM_BASE, 0x07,0x04);
		SysTick_Wait1ms (1);
	
		GPIOPinWrite(GPIO_PORTM_BASE, 0x07,0x00);
	
		GPIOPinWrite(GPIO_PORTK_BASE, 0xFF,0x06);
		SysTick_Wait1ms (2);
	
		GPIOPinWrite(GPIO_PORTM_BASE, 0x07,0x04);
		SysTick_Wait1ms (1);
	
		GPIOPinWrite(GPIO_PORTM_BASE, 0x07,0x00);

	
		GPIOPinWrite(GPIO_PORTK_BASE, 0xFF,0x0C);
		SysTick_Wait1ms (2);
	
		GPIOPinWrite(GPIO_PORTM_BASE, 0x07,0x04);
		SysTick_Wait1ms (1);
	
		GPIOPinWrite(GPIO_PORTM_BASE, 0x07,0x00);
	
		GPIOPinWrite(GPIO_PORTK_BASE, 0xFF,0x01);
		SysTick_Wait1ms (2);
	
		GPIOPinWrite(GPIO_PORTM_BASE, 0x07,0x04);
		SysTick_Wait1ms (1);
	
		GPIOPinWrite(GPIO_PORTM_BASE, 0x07,0x00);
		
		return;
}	

void LCD_Command(uint8_t x)
{

		GPIOPinWrite(GPIO_PORTK_BASE, 0xFF,x);
		SysTick_Wait1ms (2);

		GPIOPinWrite(GPIO_PORTM_BASE, 0x07,0x04);
		SysTick_Wait1ms (1);
	
		GPIOPinWrite(GPIO_PORTM_BASE, 0x07,0x00);
	
		return;
}	
void LCD_Print(uint8_t x)
{
		GPIOPinWrite(GPIO_PORTK_BASE, 0xFF,x);
		SysTick_Wait1ms (2);

		GPIOPinWrite(GPIO_PORTM_BASE, 0x07,0x05);
		SysTick_Wait1ms (1);
	
		GPIOPinWrite(GPIO_PORTM_BASE, 0x07,0x00);
	
		return;
}
void LCD_Clear()
	{
		LCD_Command(0x01);
		return;
	}
void Segunda_Linha()
	{
		LCD_Command(0xC0);
		return;
	}
	
void LCD_Print_String(uint8_t mensagem[31]){
		uint16_t i = 0;
		for(i = 0; i<31; i++)
		{
			LCD_Print(mensagem[i]);
			if(i==15)
			{
				Segunda_Linha();
			}
		}
		
		return;
	}
//função de tratamento da interrupção do SysTick
void SysTickIntHandler(void)
{
  SysTicks1ms++;
}

void SysTick_Wait1ms(uint32_t delay){
	unsigned int x = SysTicks1ms;
	while(SysTicks1ms<=delay+x);
}

//função para enviar string pela uart
void UARTStringSend(const uint8_t *String, uint32_t tamanho)
{
while (tamanho--) UARTCharPut(UART0_BASE, *String++);
}

//função de tratamento da interrupção do uart
void UART_Interruption_Handler(void) 
{
  uint8_t last;
  //limpar IRQ exec
  UARTIntClear(UART0_BASE,UARTIntStatus(UART0_BASE,true));
  // Ler o próximo caractere na uart.
  last = (uint8_t)UARTCharGetNonBlocking(UART0_BASE);
  //rotacionar buffer circular
  rxbuffer[0]=rxbuffer[1];
  rxbuffer[1]=rxbuffer[2];
  rxbuffer[2]=rxbuffer[3];
  rxbuffer[3]=last;
}

//função para configurar e inicializar o periférico Systick a 1ms
void SetupSystick(void)
{
  SysTicks1ms=0;
  //desliga o SysTick para poder configurar
  SysTickDisable();
  //clock 120MHz <=> SysTick deve contar 1ms=120k - 1 do Systick_Counter - 12 trocas de contexto PP->IRQ - (1T Mov, 1T Movt, 3T LDR, 1T INC ... STR e IRQ->PP já não contabilizam atrasos para a variável)  
  SysTickPeriodSet(120000-1-12-6);
  //registra a função de atendimento da interrupção
  SysTickIntRegister(SysTickIntHandler);
  //liga o atendimento via interrupção
  SysTickIntEnable();
  //liga novamente o SysTick
  SysTickEnable();
}

//função para configurar e inicializar o periférico Uart a 115.2k,8,n,1
void SetupUart(void)
{
  //Habilitar porta serial a 115200 com interrupção seguindo sequencia de inicializações abaixo:
  SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);
  while(!SysCtlPeripheralReady(SYSCTL_PERIPH_UART0));
  UARTConfigSetExpClk(UART0_BASE, SysClock, 115200, (UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE));
  UARTFIFODisable(UART0_BASE);
  UARTIntEnable(UART0_BASE,UART_INT_RX);
  UARTIntRegister(UART0_BASE,UART_Interruption_Handler);
  SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
  while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOA));
  GPIOPinConfigure(GPIO_PA0_U0RX);
  GPIOPinConfigure(GPIO_PA1_U0TX);
  GPIOPinTypeUART(GPIO_PORTA_BASE,(GPIO_PIN_0|GPIO_PIN_1));
}
