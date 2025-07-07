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
bool newUart=0;
//variável para receber o retorno do cfg do clk
uint32_t SysClock;

//Protótipos de funções criadas no programa, código depois do main
void SysTickIntHandler(void);
void UARTStringSend(const uint8_t *String, uint32_t tamanho);
void UART_Interruption_Handler(void);
void SetupSystick(void);
void SetupUart(void);

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
	
unsigned int	xbuffer[4];
bool rele1=0, rele2=0, rele3=0, rele4=0;
uint8_t reles[4];
uint8_t combined=0;
	
  //loop infinito
  while (1)
		
        {
					if(newUart){
						if (rxbuffer[0]=='#'){
							
							if (rxbuffer[1]=='R'){
							
								switch(rxbuffer[2]){
									case '3':
										if (rxbuffer[3]=='1'){
											GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_0, 1);
											UARTStringSend("@R31", 4);
											newUart=0;
											rele4=1;
										}
										if (rxbuffer[3]=='0'){
											GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_0, 0);
											UARTStringSend("@R30", 4);
											newUart=0;
											rele4=0;
										}
										break;
									case '2':
										if (rxbuffer[3]=='1'){
											GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_4, 1<<4);
											UARTStringSend("@R21", 4);
											newUart=0;
											rele3=1;
										}
										if (rxbuffer[3]=='0'){
											GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_4, 0<<4);
											UARTStringSend("@R20", 4);
											newUart=0;
											rele3=0;
										}
										break;
									case '1':
										if (rxbuffer[3]=='1'){
											GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_0, 1);
											UARTStringSend("@R11", 4);
											newUart=0;
											rele2=1;
										}
										if (rxbuffer[3]=='0'){
											GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_0, 0);
											UARTStringSend("@R10", 4);
											newUart=0;
											rele2=0;
										}
										break;
									case '0':
										if (rxbuffer[3]=='1'){
											GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, 1<<1);
											UARTStringSend("@R01", 4);
											newUart=0;
											rele1=1;
										}
										if (rxbuffer[3]=='0'){
											GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, 0<<1);
											UARTStringSend("@R00", 4);
											newUart=0;
											rele1=0;
										}
										break;
									default:
										newUart=0;
										break;
								}
							}
							if(rxbuffer[1]=='T'){
								if (rxbuffer[2]=='X' && rxbuffer[3]=='1'){
									GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_0, 1);
									GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_4, 1<<4);
									GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_0, 1);
									GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, 1<<1);
									UARTStringSend("@TX1", 4);
									newUart=0;
									rele1=1;
									rele2=1;
									rele3=1;
									rele4=1;
								}
								if (rxbuffer[2]=='X' && rxbuffer[3]=='0'){
									GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_0, 0);
									GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_4, 0<<4);
									GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_0, 0);
									GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, 0<<1);									
									UARTStringSend("@TX0", 4);
									newUart=0;
									rele1=0;
									rele2=0;
									rele3=0;
									rele4=0;
								}
								if (rxbuffer[2]=='S' && rxbuffer[3]=='T'){
									combined = 0x40 | (rele4 << 3) | (rele3 << 2) | (rele2 << 1) | (rele1<<0);
									sprintf(reles,"@TS%c",combined);								
									UARTStringSend(reles, 4);
									newUart=0;
								}
							}
						}
					}
        }
}

//função de tratamento da interrupção do SysTick
void SysTickIntHandler(void)
{
  SysTicks1ms++;
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
	newUart=1;
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
