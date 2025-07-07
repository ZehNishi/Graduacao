// gpio.c
// Desenvolvido para a placa EK-TM4C1294XL + Shield LCD(1602b) + Teclado (4x4)
// Inicializa as portas ...
// Projeto e Esquemático do Shield: http://www.elf52.daeln.com.br
// Prof. DaLuz
// Prof. Guilherme Peron
// Prof. Marcos P.

#include <stdint.h>
#include "tm4c1294ncpdt.h"
#include "gpio.h"

#define GPIO_PORTC (0x0004) //bit 2
#define GPIO_PORTJ (0x0100) //bit 8
#define GPIO_PORTK (0x0200) //bit 9
#define GPIO_PORTL (0x0400) //bit 10
#define GPIO_PORTM (0x0800) //bit 11
#define GPIO_PORTN (0x1000) //bit 12

// -------------------------------------------------------------------------------
// Função GPIO_Init
// Inicializa os ports 
// Parâmetro de entrada: Não tem
// Parâmetro de saída: Não tem
void GPIO_Init(void)
{
	//1a. Ativar o clock para a porta setando o bit correspondente no registrador RCGCGPIO
	SYSCTL_RCGCGPIO_R |= GPIO_PORTC | GPIO_PORTJ | GPIO_PORTK | GPIO_PORTL | GPIO_PORTM | GPIO_PORTN;
	//1b.   após isso verificar no PRGPIO se a porta está pronta para uso.
  while((SYSCTL_PRGPIO_R & (GPIO_PORTJ | GPIO_PORTK | GPIO_PORTL | GPIO_PORTM | GPIO_PORTN) ) != 
                           (GPIO_PORTJ | GPIO_PORTK | GPIO_PORTL | GPIO_PORTM | GPIO_PORTN) ){};
	
	// 2. Limpar o AMSEL para desabilitar a analógica
	GPIO_PORTJ_AHB_AMSEL_R = 0x00;
	GPIO_PORTK_AMSEL_R = 0x00;
  GPIO_PORTL_AMSEL_R = 0x00;
	GPIO_PORTM_AMSEL_R = 0x00;
	GPIO_PORTN_AMSEL_R = 0x00;
														 
	// 3. Limpar PCTL para selecionar o GPIO
	GPIO_PORTJ_AHB_PCTL_R = 0x00;
	GPIO_PORTK_PCTL_R = 0x00;
  GPIO_PORTL_PCTL_R = 0x00;
	GPIO_PORTM_PCTL_R = 0x00;
	GPIO_PORTN_PCTL_R = 0x00;

	// 4. DIR para 0 se for entrada, 1 se for saída
	GPIO_PORTJ_AHB_DIR_R = 0x00;        //J0 e J1 entrada
	GPIO_PORTK_DIR_R = 0xFF;            //K7-K0 saída
  GPIO_PORTL_DIR_R = 0x00;            //L3-L0 entrada
	GPIO_PORTM_DIR_R = 0xF7;            //M2-M0 e M7-M4 saída
	GPIO_PORTN_DIR_R = 0x03;		    //N0 e N1 saída												 

		
	// 5. Limpar os bits AFSEL para 0 para selecionar GPIO sem função alternativa	
	GPIO_PORTJ_AHB_AFSEL_R = 0x00;
	GPIO_PORTK_AFSEL_R = 0x00;
  GPIO_PORTL_AFSEL_R = 0x00;
	GPIO_PORTM_AFSEL_R = 0x00;
	GPIO_PORTN_AFSEL_R = 0x00;
		
	// 6. Setar os bits de DEN para habilitar I/O digital
	GPIO_PORTJ_AHB_DEN_R = 0x03;        //J0 e J1
	GPIO_PORTK_DEN_R = 0xFF;            //K7-K0
  GPIO_PORTL_DEN_R = 0x0F;            //L3-L0
	GPIO_PORTM_DEN_R = 0xF7;            //M2-M0 e M7-M4
	GPIO_PORTN_DEN_R = 0x03;		    //N0 e N1
	
	// 7. Habilitar resistor de pull-up interno, setar PUR para 1
	GPIO_PORTJ_AHB_PUR_R = 0x03;   //Bit0 e bit1
	GPIO_PORTL_PUR_R = 0x0F;       //L3-L0	

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
// Função PortK_Output
// Escreve os valores no port K
// Parâmetro de entrada: Valor a ser escrito
// Parâmetro de saída: não tem
void PortK_Output(uint32_t valor)
{
    uint32_t temp;
    //vamos zerar somente os bits menos significativos
    //para uma escrita amigável nos bits 0 a 7
    temp = GPIO_PORTK_DATA_R & 0x00;
    //agora vamos fazer o OR com o valor recebido na função
    temp = temp | valor;
    GPIO_PORTK_DATA_R = temp; 
}

// -------------------------------------------------------------------------------
// Função PortL_Input
// Lê os valores de entrada do port L
// Parâmetro de entrada: Não tem
// Parâmetro de saída: o valor da leitura do port
uint32_t PortL_Input(void)
{
	return GPIO_PORTL_DATA_R & 0xF; //Somente os L3-L0
}

// -------------------------------------------------------------------------------
// Função PortM_Output
// Escreve os valores no port M
// Parâmetro de entrada: Valor a ser escrito
// Parâmetro de saída: não tem
void PortM_Output(uint32_t valor)
{
    uint32_t temp;
    //vamos zerar somente os bits menos significativos
    //para uma escrita amigável nos bits 0, 1 e 2
    temp = GPIO_PORTM_DATA_R & 0xF8;
    //agora vamos fazer o OR com o valor recebido na função
    temp = temp | valor;
    GPIO_PORTM_DATA_R = temp; 
}

// -------------------------------------------------------------------------------
// Função PortM_Output2
// Escreve os valores no port M Pinos 4 a 7
// Parâmetro de entrada: Valor a ser escrito
// Parâmetro de saída: não tem
void PortM_Output2(uint32_t valor)
{
    uint32_t temp;
    //vamos zerar somente os bits menos significativos
    //para uma escrita amigável nos bits 4 a 7
    temp = GPIO_PORTM_DATA_R & 0x0F;
    //agora vamos fazer o OR com o valor recebido na função
    temp = temp | valor;
    GPIO_PORTM_DATA_R = temp; 
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
