/*##############################################################################
Prof. Paulo Denis Garcez da Luz - 2023/2S
Desenvolvido para a placa EK-TM4C1294XL utilizando o SDK TivaWare no KEIL
Programa exemplo de uso do Shield: LCD-I2C+Teclado, Periférico Gpio, SysTick,
I2C0 e I2c7.
##############################################################################*/

//TivaWare uC: Usado internamente para identificar o uC em alguns .h
#define PART_TM4C1294NCPDT 1

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include "inc/hw_memmap.h"
#include "driverlib/pin_map.h"
#include "driverlib/gpio.h"
#include "driverlib/i2c.h"
#include "driverlib/sysctl.h"
#include "driverlib/systick.h"

#include "i2c.h"
#include "ssd1306.h"
#include "bitmap.h"
#include "teclado.h"

#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include "inc/hw_ints.h"
#include "inc/hw_memmap.h"
#include "driverlib/debug.h"
#include "driverlib/gpio.h"
#include "driverlib/sysctl.h"
#include "driverlib/interrupt.h"
#include "driverlib/rom.h"
#include "driverlib/rom_map.h"
#include "driverlib/uart.h"


#include "inc/hw_types.h"
#include "driverlib/pwm.h"

//variável que conta os ticks(1ms) - Volatile não permite o compilador otimizar o código 
static volatile unsigned int SysTicks1ms;

//Protótipos de funções criadas no programa:
void SetupSystick(void);
void SysTickIntHandler(void);
void PortM_config(void);
void PortL_config(void);
void I2C0_config(void);
void I2C0_sendSingleByte(uint8_t slave_addr, char data);
void I2C0_sendMultipleBytes(uint8_t slave_addr, uint8_t numOfBytes, char by[]);
void I2C7_config(void);
void I2C7_sendSingleByte(uint8_t slave_addr, char data);
void I2C7_sendMultipleBytes(uint8_t slave_addr, uint8_t numOfBytes, char by[]);
void SetupUart(void);
void UART_Interruption_Handler(void);
void UARTStringSend(const uint8_t *String, uint32_t tamanho);
void RelesTela(void);

uint32_t SysClock;
//buffer de rx ...
unsigned char rxbuffer[4];
bool newUart=0;
bool rele1=0, rele2=0, rele3=0;

int main (void)
{
//controle de tempo para cada oled0, oled7:
unsigned int oled0time=0, oled7time=0, tecladotime=0;
//controle de estado do oled0, tecla:
unsigned char oled0state=0, keyc=21, Teclado;
//Configura o clock para utilizar o xtal interno de 16MHz com PLL para 80MHz
SysClock = SysCtlClockFreqSet(SYSCTL_OSC_INT | SYSCTL_USE_PLL | SYSCTL_CFG_VCO_320, 80000000);

SysCtlPWMClockSet(SYSCTL_PWMDIV_1);         // Enable clock to PWM module
SysCtlPeripheralEnable(SYSCTL_PERIPH_PWM0); // Use PWM module 0	
	

	

//executa configuração e inicialização do SysTick
SetupSystick();
//executa configuração e inicialização do Port L
PortL_config();
//executa configuração e inicialização do Port M
PortM_config();	
	
	
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
GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_4);
GPIOPinTypePWM(GPIO_PORTF_BASE, GPIO_PIN_0);
//configura o pin_0 e pin_1 como entrada
GPIOPinTypeGPIOInput(GPIO_PORTJ_BASE, GPIO_PIN_0 | GPIO_PIN_1);
//configura os pinos para 2mA como limite de corrente e com week pull-up
GPIOPadConfigSet(GPIO_PORTJ_BASE, GPIO_PIN_0 | GPIO_PIN_1, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);
//executa configuração e inicialização do SysTick
SetupUart();  
	


//Configuração PWM  PF0 com M0PWM0



GPIOPinConfigure(GPIO_PF0_M0PWM0);  // Enable alternate function of PF0
PWMGenConfigure(PWM0_BASE, PWM_GEN_0, PWM_GEN_MODE_UP_DOWN | PWM_GEN_MODE_DB_NO_SYNC);
PWMGenPeriodSet(PWM0_BASE, PWM_GEN_0, (SysClock/10000));  // Set PWM frequency
PWMPulseWidthSet(PWM0_BASE, PWM_OUT_0, PWMGenPeriodGet(PWM0_BASE, PWM_GEN_0)*0); // Set Duty cycle
PWMOutputState(PWM0_BASE, PWM_OUT_0_BIT, true); // Enable PWM output channel 0	
PWMGenEnable(PWM0_BASE, PWM_GEN_0); // Enable PWM module


	
	
//Tempo de 5s antes de começar o Blinky:
oled0time=SysTicks1ms+2000;
//Inicializa periférico I2C0:
I2C0_config();
//config 128x64:	
OLED0_Init();
//Limpa Buffer do Display Oled0
SSD1306_I2C0_cls();
//Desenha a Logo da Utfpr no Buffer do Oled0
SSD1306_I2C0_DrawBitmap(0,0,Rele1,76,16);
SSD1306_I2C0_DrawBitmap(64,0,ReleOff,76,16);

SSD1306_I2C0_DrawBitmap(0,21,Rele2,76,16);
SSD1306_I2C0_DrawBitmap(64,21,ReleOff,76,16);

SSD1306_I2C0_DrawBitmap(0,42,Rele3,76,16);
SSD1306_I2C0_DrawBitmap(64,42,ReleOff,76,16);

//Atualiza o Buffer para a tela do Oled0
SSD1306_I2C0_UpdateScreen();
//Inicializa periférico I2C7:
I2C7_config();
//config 128x32:
OLED7_Init();
//Limpa Display Oled7
OLED7_clearDisplay();
//Escreve String no Oled7 x,y I=invertido
OLED7_sendStrXYI("Digite o PWM", 0, 0);
//Escreve String no Oled7 x,y I=invertido
OLED7_sendStrXYI("# confirma", 2, 0);
OLED7_sendStrXYI("* reseta", 3, 0);



uint8_t PWMLed=0;
#define dbt 100;
bool db=true;
unsigned int dbtime=0;
uint8_t combined=0;
unsigned int	xbuffer[4];
uint8_t reles[4];
uint8_t LCD_msg[31];
uint8_t LCDBuffer[3]={' ',' ',' '};
uint8_t tec=1;

while (1)
      {
				
				if(newUart){
						if (rxbuffer[0]=='#'){
							
							if (rxbuffer[1]=='R'){
							
								switch(rxbuffer[2]){
									case '2':
										if (rxbuffer[3]=='1'){
											GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_4, 1<<4);
											UARTStringSend("@R21", 4);
											newUart=0;
											rele3=1;
											RelesTela();
										}
										if (rxbuffer[3]=='0'){
											GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_4, 0<<4);
											UARTStringSend("@R20", 4);
											newUart=0;
											rele3=0;
											RelesTela();
										}
										break;
									case '1':
										if (rxbuffer[3]=='1'){
											GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_0, 1);
											UARTStringSend("@R11", 4);
											newUart=0;
											rele2=1;
											RelesTela();
										}
										if (rxbuffer[3]=='0'){
											GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_0, 0);
											UARTStringSend("@R10", 4);
											newUart=0;
											rele2=0;
											RelesTela();
										}
										break;
									case '0':
										if (rxbuffer[3]=='1'){
											GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, 1<<1);
											UARTStringSend("@R01", 4);
											newUart=0;
											rele1=1;
											RelesTela();
										}
										if (rxbuffer[3]=='0'){
											GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, 0<<1);
											UARTStringSend("@R00", 4);
											newUart=0;
											rele1=0;
											RelesTela();
										}
										break;
									default:
										newUart=0;
										break;
								}
							}
							if(rxbuffer[1]=='T'){
								if (rxbuffer[2]=='X' && rxbuffer[3]=='1'){
									GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_4, 1<<4);
									GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_0, 1);
									GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, 1<<1);
									UARTStringSend("@TX1", 4);
									newUart=0;
									rele1=1;
									rele2=1;
									rele3=1;
									RelesTela();
								}
								if (rxbuffer[2]=='X' && rxbuffer[3]=='0'){
									GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_4, 0<<4);
									GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_0, 0);
									GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1, 0<<1);									
									UARTStringSend("@TX0", 4);
									newUart=0;
									rele1=0;
									rele2=0;
									rele3=0;
									RelesTela();
								}
								if (rxbuffer[2]=='S' && rxbuffer[3]=='T'){
									combined = 0x40 | (rele3 << 2) | (rele2 << 1) | (rele1<<0);
									sprintf(reles,"@TS%c",combined);								
									UARTStringSend(reles, 4);
									newUart=0;
								}
							}
						}
					}
				
				
					
					
					
		    //Varre teclado Matricial 4x4
				Teclado=VarreTeclado();
				if(tec!=Teclado){
				tec = Teclado;
				
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
							
								
								if(LCDBuffer[1]!=' ' && (Teclado=='#' || Teclado=='*')) LCDBuffer[2]=Teclado;
								if(LCDBuffer[2]=='*'){
									LCDBuffer[0]=' ';
									LCDBuffer[1]=' ';
									LCDBuffer[2]=' ';
									sprintf(LCD_msg,"PWM=%c%c",LCDBuffer[0],LCDBuffer[1]);
									OLED7_clearDisplay();
									OLED7_sendStrXYI(LCD_msg, 0, 0);
								
								}
								if(LCDBuffer[0]!=' ' && LCDBuffer[1]==' ' && Teclado!='#' && Teclado!='A' && Teclado!='B' && Teclado!='C' && Teclado!='D') LCDBuffer[1]=Teclado;
								if(LCDBuffer[1]=='*'){
									LCDBuffer[0]=' ';
									LCDBuffer[1]=' ';
									LCDBuffer[2]=' ';
									sprintf(LCD_msg,"PWM=%c%c",LCDBuffer[0],LCDBuffer[1]);
									OLED7_clearDisplay();
									OLED7_sendStrXYI(LCD_msg, 0, 0);
								
								}
								if(LCDBuffer[0]==' ' && Teclado!='#' && Teclado!='*' && Teclado!='A' && Teclado!='B' && Teclado!='C' && Teclado!='D') LCDBuffer[0]=Teclado;
								if(LCDBuffer[2]=='#'){
									PWMLed = (LCDBuffer[0]-48)*10+(LCDBuffer[1]-48);
									PWMPulseWidthSet(PWM0_BASE, PWM_OUT_0, PWMGenPeriodGet(PWM0_BASE, PWM_GEN_0)*PWMLed/100);
									sprintf(LCD_msg,"PWM=%c%c",LCDBuffer[0],LCDBuffer[1]);
									OLED7_clearDisplay();
									OLED7_sendStrXYI(LCD_msg, 0, 0);
									LCDBuffer[0]=' ';
									LCDBuffer[1]=' ';
									LCDBuffer[2]=' ';
									}
								if(LCDBuffer[2]!='#'){
										sprintf(LCD_msg,"PWM=%c%c",LCDBuffer[0],LCDBuffer[1]);
										OLED7_clearDisplay();
										OLED7_sendStrXYI(LCD_msg, 0, 0);
										OLED7_sendStrXYI("# confirma", 2, 0);
										OLED7_sendStrXYI("* reseta", 3, 0);
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

//função para configurar e inicializar o periférico Systick a 1ms
void SetupSystick(void)
{
  SysTicks1ms=0;
  //desliga o SysTick para poder configurar
  SysTickDisable();
  //clock 40MHz <=> SysTick deve contar 1ms=80k-1 do Systick_Counter - 12 trocas de contexto PP->IRQ - (1T Mov, 1T Movt, 3T LDR, 1T INC ... STR e IRQ->PP já não contabilizam atrasos para a variável)  
  SysTickPeriodSet(80000-1-12-6);
  //registra a função de atendimento da interrupção
  SysTickIntRegister(SysTickIntHandler);
  //liga o atendimento via interrupção
  SysTickIntEnable();
  //liga novamente o SysTick
  SysTickEnable();
}

//função para configurar e inicializar o periférico Port M output
void PortM_config(void)
{
//habilitar gpio port M
SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOM);
//aguardar o periférico ficar pronto para uso
while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOM)) {/*Espera habilitar o port*/}
//configura o pin_4, pin_5, pin_6 e pin_7 como saída
GPIOPinTypeGPIOOutput(GPIO_PORTM_BASE, GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6  | GPIO_PIN_7);
}

//função para configurar e inicializar o periférico Port L input
void PortL_config(void)
{
//habilitar gpio port L
SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOL);
//aguardar o periférico ficar pronto para uso
while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOL)) {/*Espera habilitar o port*/}
//configura o pin_0, pin_1, pin_2 e pin_3 como entrada
GPIOPinTypeGPIOInput(GPIO_PORTL_BASE, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3);
//configura os pinos para 2mA como limite de corrente e com week pull-up
GPIOPadConfigSet(GPIO_PORTL_BASE, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);
}


//I2C
void I2C0_config(void)
{
// Configure I2C0 for pins PB2 and PB3
SysCtlPeripheralEnable(SYSCTL_PERIPH_I2C0);
SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);
while (!SysCtlPeripheralReady(SYSCTL_PERIPH_I2C0) || !SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOB));  
//Configuração da PORTB PIN2 e PIN3 - B.M.
GPIOPinConfigure(GPIO_PB2_I2C0SCL);
GPIOPinConfigure(GPIO_PB3_I2C0SDA);
GPIOPinTypeI2CSCL(GPIO_PORTB_BASE, GPIO_PIN_2);
GPIOPinTypeI2C(GPIO_PORTB_BASE, GPIO_PIN_3);
I2CMasterInitExpClk(I2C0_BASE, SysCtlClockGet(), false);
}

void I2C0_sendSingleByte(uint8_t slave_addr, char data)
{
I2CMasterSlaveAddrSet(I2C0_BASE, slave_addr, false);
I2CMasterDataPut(I2C0_BASE, data);
I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_SEND);
while(I2CMasterBusy(I2C0_BASE));
}

void I2C0_sendMultipleBytes(uint8_t slave_addr, uint8_t numOfBytes, char by[])
{
uint8_t i;
I2CMasterSlaveAddrSet(I2C0_BASE, slave_addr, false);
I2CMasterDataPut(I2C0_BASE, by[0]);
I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_BURST_SEND_START);
while(I2CMasterBusy(I2C0_BASE));
for (i = 1; i < numOfBytes - 1; i++)
	  {
      I2CMasterDataPut(I2C0_BASE, by[i]);
      I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_BURST_SEND_CONT);
      while(I2CMasterBusy(I2C0_BASE));
    }
I2CMasterDataPut(I2C0_BASE, by[numOfBytes - 1]);
I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_BURST_SEND_FINISH);
while(I2CMasterBusy(I2C0_BASE));
}

void I2C7_config(void)
{
SysCtlPeripheralEnable(SYSCTL_PERIPH_I2C7);
SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
while (!SysCtlPeripheralReady(SYSCTL_PERIPH_I2C7) || !SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOD));  
//Configuração da PORTD PIN0 e PIN1 - B.M.
GPIOPinConfigure(GPIO_PD0_I2C7SCL);
GPIOPinConfigure(GPIO_PD1_I2C7SDA);
GPIOPinTypeI2CSCL(GPIO_PORTD_BASE, GPIO_PIN_0);
GPIOPinTypeI2C(GPIO_PORTD_BASE, GPIO_PIN_1);
I2CMasterInitExpClk(I2C7_BASE, SysCtlClockGet(), false);
}

void I2C7_sendSingleByte(uint8_t slave_addr, char data)
{
I2CMasterSlaveAddrSet(I2C7_BASE, slave_addr, false);
I2CMasterDataPut(I2C7_BASE, data);
I2CMasterControl(I2C7_BASE, I2C_MASTER_CMD_SINGLE_SEND);
while (I2CMasterBusy(I2C7_BASE));
}

void I2C7_sendMultipleBytes(uint8_t slave_addr, uint8_t numOfBytes, char by[])
{
uint8_t i;
I2CMasterSlaveAddrSet(I2C7_BASE, slave_addr, false);
I2CMasterDataPut(I2C7_BASE, by[0]);
I2CMasterControl(I2C7_BASE, I2C_MASTER_CMD_BURST_SEND_START);
while(I2CMasterBusy(I2C7_BASE));
for (i = 1; i < numOfBytes - 1; i++)
	  {
			I2CMasterDataPut(I2C7_BASE, by[i]);
			I2CMasterControl(I2C7_BASE, I2C_MASTER_CMD_BURST_SEND_CONT);
			while (I2CMasterBusy(I2C7_BASE));
    }
I2CMasterDataPut(I2C7_BASE, by[numOfBytes - 1]);
I2CMasterControl(I2C7_BASE, I2C_MASTER_CMD_BURST_SEND_FINISH);
while (I2CMasterBusy(I2C7_BASE));
}

//novas

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

//função para enviar string pela uart
void UARTStringSend(const uint8_t *String, uint32_t tamanho)
{
while (tamanho--) UARTCharPut(UART0_BASE, *String++);
}

void RelesTela(void){
	
//Limpa Buffer do Display Oled0
SSD1306_I2C0_cls();

	if(rele1){
			SSD1306_I2C0_DrawBitmap(0,0,Rele1,76,16);
			SSD1306_I2C0_DrawBitmap(64,0,ReleOn,76,16);
	}else{
			SSD1306_I2C0_DrawBitmap(0,0,Rele1,76,16);
			SSD1306_I2C0_DrawBitmap(64,0,ReleOff,76,16);
	}

	if(rele2){
			SSD1306_I2C0_DrawBitmap(0,21,Rele2,76,16);
			SSD1306_I2C0_DrawBitmap(64,21,ReleOn,76,16);
	}else{
			SSD1306_I2C0_DrawBitmap(0,21,Rele2,76,16);
			SSD1306_I2C0_DrawBitmap(64,21,ReleOff,76,16);
	}
	
	if(rele3){
			SSD1306_I2C0_DrawBitmap(0,42,Rele3,76,16);
			SSD1306_I2C0_DrawBitmap(64,42,ReleOn,76,16);
	}else{
			SSD1306_I2C0_DrawBitmap(0,42,Rele3,76,16);
			SSD1306_I2C0_DrawBitmap(64,42,ReleOff,76,16);
	}
	
//Atualiza o Buffer para a tela do Oled0
SSD1306_I2C0_UpdateScreen();
	

} 
