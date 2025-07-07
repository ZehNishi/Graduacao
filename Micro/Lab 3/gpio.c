// gpio.c
// Desenvolvido para a placa EK-TM4C1294XL
// Inicializa as portas J e N


#include <stdint.h>

#include "tm4c1294ncpdt.h"

void SysTick_Wait1ms(uint32_t delay);
void GPIOPortJ_Handler(); 
int loop();

#define GPIO_PORTA  (0x0001)
#define GPIO_PORTB  (0x0002)
#define GPIO_PORTC  (0x0004)
#define GPIO_PORTD  (0x0008)
#define GPIO_PORTE  (0x0010)
#define GPIO_PORTF  (0x0020)
#define GPIO_PORTG  (0x0040)
#define GPIO_PORTH  (0x0080)
#define GPIO_PORTJ  (0x0100)
#define GPIO_PORTK  (0x0200)
#define GPIO_PORTL	(0x0400)
#define GPIO_PORTM 	(0x0800)
#define GPIO_PORTN	(0x1000)
#define GPIO_PORTP	(0x2000)
#define GPIO_PORTQ	(0x4000)

// -------------------------------------------------------------------------------
// Função GPIO_Init
// Inicializa os ports J e N
// Parâmetro de entrada: Não tem
// Parâmetro de saída: Não tem
void GPIO_Init(void)
{
	//1a. Ativar o clock para a porta setando o bit correspondente no registrador RCGCGPIO
	SYSCTL_RCGCGPIO_R = (GPIO_PORTA | GPIO_PORTB | GPIO_PORTC | GPIO_PORTD | GPIO_PORTE | GPIO_PORTF | GPIO_PORTG | GPIO_PORTH | GPIO_PORTJ | GPIO_PORTK | GPIO_PORTL | GPIO_PORTM | GPIO_PORTN | GPIO_PORTP | GPIO_PORTQ);
	//1b.   após isso verificar no PRGPIO se a porta está pronta para uso.
  while((SYSCTL_PRGPIO_R & (GPIO_PORTA | GPIO_PORTB | GPIO_PORTC | GPIO_PORTD | GPIO_PORTE | GPIO_PORTF | GPIO_PORTG | GPIO_PORTH | GPIO_PORTJ | GPIO_PORTK | GPIO_PORTL | GPIO_PORTM | GPIO_PORTN | GPIO_PORTP | GPIO_PORTQ) ) != (GPIO_PORTA | GPIO_PORTB | GPIO_PORTC | GPIO_PORTD | GPIO_PORTE | GPIO_PORTF | GPIO_PORTG | GPIO_PORTH | GPIO_PORTJ | GPIO_PORTK | GPIO_PORTL | GPIO_PORTM | GPIO_PORTN | GPIO_PORTP | GPIO_PORTQ) ){};
	
	// 2. Limpar o AMSEL para desabilitar a analógica
	GPIO_PORTA_AHB_AMSEL_R = 0x00;
	GPIO_PORTB_AHB_AMSEL_R = 0x00;
	//GPIO_PORTC_AHB_AMSEL_R = 0x00;
	GPIO_PORTD_AHB_AMSEL_R = 0x00;
	GPIO_PORTE_AHB_AMSEL_R = 0x00;
	GPIO_PORTF_AHB_AMSEL_R = 0x00;
	GPIO_PORTG_AHB_AMSEL_R = 0x00;
	GPIO_PORTH_AHB_AMSEL_R = 0x00;
	GPIO_PORTJ_AHB_AMSEL_R = 0x00;
	GPIO_PORTK_AMSEL_R = 0x00;
	GPIO_PORTL_AMSEL_R = 0x00;
	GPIO_PORTM_AMSEL_R = 0x00;
	GPIO_PORTN_AMSEL_R = 0x00;
	GPIO_PORTP_AMSEL_R = 0x00;
	GPIO_PORTQ_AMSEL_R = 0x00;
		
	// 3. Limpar PCTL para selecionar o GPIO PCTL
	GPIO_PORTA_AHB_PCTL_R = 0x00;
	GPIO_PORTB_AHB_PCTL_R = 0x00;
	//GPIO_PORTC_AHB_PCTL_R = 0x00;
	GPIO_PORTD_AHB_PCTL_R = 0x00;
	GPIO_PORTE_AHB_PCTL_R = 0x00;
	GPIO_PORTF_AHB_PCTL_R = 0x00;
	GPIO_PORTG_AHB_PCTL_R = 0x00;
	GPIO_PORTH_AHB_PCTL_R = 0x00;
	GPIO_PORTJ_AHB_PCTL_R = 0x00;
	GPIO_PORTK_PCTL_R = 0x00;
	GPIO_PORTL_PCTL_R = 0x00;
	GPIO_PORTM_PCTL_R = 0x00;
	GPIO_PORTN_PCTL_R = 0x00;
	GPIO_PORTP_PCTL_R = 0x00;
	GPIO_PORTQ_PCTL_R = 0x00;

	// 4. DIR para 0 se for entrada, 1 se for saída
	GPIO_PORTA_AHB_DIR_R = 0xF0;
	GPIO_PORTB_AHB_DIR_R = 0x30;
	//GPIO_PORTC_AHB_DIR_R = 0x00;
	GPIO_PORTD_AHB_DIR_R = 0x00;
	GPIO_PORTE_AHB_DIR_R = 0x00;
	GPIO_PORTF_AHB_DIR_R = 0x00;
	GPIO_PORTG_AHB_DIR_R = 0x00;
	GPIO_PORTH_AHB_DIR_R = 0x0F;
	GPIO_PORTJ_AHB_DIR_R = 0x00;
	GPIO_PORTK_DIR_R = 0xFF;
	GPIO_PORTL_DIR_R = 0x0F;
	GPIO_PORTM_DIR_R = 0x07;
	GPIO_PORTN_DIR_R = 0x03; //BIT0 | BIT1
	GPIO_PORTP_DIR_R = 0x20;
	GPIO_PORTQ_DIR_R = 0x0F;
	
		
	// 5. Limpar os bits AFSEL para 0 para selecionar GPIO sem função alternativa	
	GPIO_PORTA_AHB_AFSEL_R = 0x00;
	GPIO_PORTB_AHB_AFSEL_R = 0x00;
	//GPIO_PORTC_AHB_AFSEL_R = 0x00;
	GPIO_PORTD_AHB_AFSEL_R = 0x00;
	GPIO_PORTE_AHB_AFSEL_R = 0x00;
	GPIO_PORTF_AHB_AFSEL_R = 0x00;
	GPIO_PORTG_AHB_AFSEL_R = 0x00;
	GPIO_PORTH_AHB_AFSEL_R = 0x00;
	GPIO_PORTJ_AHB_AFSEL_R = 0x00;
	GPIO_PORTK_AFSEL_R = 0x00;
	GPIO_PORTL_AFSEL_R = 0x00;
	GPIO_PORTM_AFSEL_R = 0x00;
	GPIO_PORTN_AFSEL_R = 0x00;
	GPIO_PORTP_AFSEL_R = 0x00;
	GPIO_PORTQ_AFSEL_R = 0x00;
		
	// 6. Setar os bits de DEN para habilitar I/O digital	
	GPIO_PORTA_AHB_DEN_R = 0xF0;
	GPIO_PORTB_AHB_DEN_R = 0x30;
	//GPIO_PORTC_AHB_DEN_R = 0x00;
	GPIO_PORTD_AHB_DEN_R = 0x00;
	GPIO_PORTE_AHB_DEN_R = 0x00;
	GPIO_PORTF_AHB_DEN_R = 0x00;
	GPIO_PORTG_AHB_DEN_R = 0x00;
	GPIO_PORTH_AHB_DEN_R = 0xFF;
	GPIO_PORTJ_AHB_DEN_R = 0x03;
	GPIO_PORTK_DEN_R = 0xFF;
	GPIO_PORTL_DEN_R = 0x0F;
	GPIO_PORTM_DEN_R = 0xF7;
	GPIO_PORTN_DEN_R = 0x03; //BIT0 | BIT1
	GPIO_PORTP_DEN_R = 0x20;
	GPIO_PORTQ_DEN_R = 0x0F;
	
	// 7. Habilitar resistor de pull-up interno, setar PUR para 1
	GPIO_PORTJ_AHB_PUR_R = 0x03;   //Bit0 e bit1	
	GPIO_PORTM_PUR_R = 0xF0;   //Bit0 e bit1	

}	

// -------------------------------------------------------------------------------
// Função PortJ_Input
// Lê os valores de entrada do port J
// Parâmetro de entrada: Não tem
// Parâmetro de saída: o valor da leitura do port
uint32_t PortJ_Input(void)
{
	return GPIO_PORTJ_AHB_DATA_R;
}

// -------------------------------------------------------------------------------
// Função PortN_Output
// Escreve os valores no port N
// Parâmetro de entrada: Valor a ser escrito
// Parâmetro de saída: não tem
void PortN_Output(uint32_t valor)
{
    uint32_t temp;
    //vamos zerar somente os bits menos significativos
    //para uma escrita amigável nos bits 0 e 1
    temp = GPIO_PORTN_DATA_R & 0xFC;
    //agora vamos fazer o OR com o valor recebido na função
    temp = temp | valor;
    GPIO_PORTN_DATA_R = temp; 
}

void colunas(uint8_t x)
{
		GPIO_PORTL_DATA_R = x;
		return;
	
}

uint8_t linhas()
{
		uint8_t x = GPIO_PORTM_DATA_R;
		x = x | 0x0F;
		return x;
	
}

void PortA_Output(uint8_t x)
{
		x = x & 0xF0;
		GPIO_PORTA_AHB_DATA_R = x;
		return;
}

void PortQ_Output(uint8_t x)
{
		x = x & 0x0F;
		GPIO_PORTQ_DATA_R = x;
		return;
}

void LED_OUTPUT(_Bool x)
{
		if (x)
		{
			GPIO_PORTB_AHB_DATA_R = 0;
			GPIO_PORTP_DATA_R = 0x20;		
		} 
		else
		{
			GPIO_PORTB_AHB_DATA_R = 0;
			GPIO_PORTP_DATA_R = 0;		
		}
}	

void LCD_INIT (){
		GPIO_PORTK_DATA_R = 0x38;
		SysTick_Wait1ms (2);
	
		GPIO_PORTM_DATA_R = 0x04;
		SysTick_Wait1ms (1);
	
		GPIO_PORTM_DATA_R = 0;
	
		GPIO_PORTK_DATA_R = 0x06;
		SysTick_Wait1ms (2);
	
		GPIO_PORTM_DATA_R = 0x04;
		SysTick_Wait1ms (1);
	
		GPIO_PORTM_DATA_R = 0;

	
		GPIO_PORTK_DATA_R = 0x0C;
		SysTick_Wait1ms (2);
	
		GPIO_PORTM_DATA_R = 0x04;
		SysTick_Wait1ms (1);
	
		GPIO_PORTM_DATA_R = 0;
	
		GPIO_PORTK_DATA_R = 0x01;
		SysTick_Wait1ms (2);
	
		GPIO_PORTM_DATA_R = 0x04;
		SysTick_Wait1ms (1);
	
		GPIO_PORTM_DATA_R = 0;
		
		return;
}	

void LCD_Command(uint8_t x)
{
		GPIO_PORTK_DATA_R = x;
		SysTick_Wait1ms (2);

		GPIO_PORTM_DATA_R = 0x04;
		SysTick_Wait1ms (1);
	
		GPIO_PORTM_DATA_R = 0;
	
		return;
}	

void LCD_Print(uint8_t x)
{
		GPIO_PORTK_DATA_R = x;
		SysTick_Wait1ms (2);

		GPIO_PORTM_DATA_R = 0x05;
		SysTick_Wait1ms (1);
	
		GPIO_PORTM_DATA_R = 0;
	
		return;
}

void Interrupcao()
{
	
	GPIO_PORTJ_AHB_IM_R = 0x0;
	GPIO_PORTJ_AHB_IS_R = 0x0;
	GPIO_PORTJ_AHB_IBE_R = 0x0;
	GPIO_PORTJ_AHB_IEV_R = 0x1;
	GPIO_PORTJ_AHB_ICR_R = 0x1;
	NVIC_EN1_R = 0x80000;
	NVIC_PRI12_R = (1<<29);	
} 




