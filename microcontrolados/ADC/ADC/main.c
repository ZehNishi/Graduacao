// main.c
// Desenvolvido para a placa EK-TM4C1294XL
// Verifica se recebeu alguma coisa pela serial e acende um dos leds de acordo com o caractere recebido
// Verifica o estado da chave USR_SW2, e, caso seja pressionada envia o caracter A pela serial


#include <stdint.h>

void PLL_Init(void);
void SysTick_Init(void);
void SysTick_Wait1ms(uint32_t delay);
void ADC_Init(void);
uint32_t ADC0_InSeq0(void);



int main(void)
{
	uint32_t conv;
	PLL_Init();
	SysTick_Init();
	ADC_Init();
 
	while (1)
	{

            
						conv = ADC0_InSeq0();
            SysTick_Wait1ms(50);            //Debounce

			
	}
}
