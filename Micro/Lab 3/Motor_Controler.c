#include <stdint.h>

#include "tm4c1294ncpdt.h"

void SysTick_Wait1ms(uint32_t delay);


void Passo_Completo_A()
{
		GPIO_PORTH_AHB_DATA_R = 0x01;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x02;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x04;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x08;
		SysTick_Wait1ms(2);

		return;

}

void Passo_Completo_H()
{
		GPIO_PORTH_AHB_DATA_R = 0x08;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x04;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x02;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x01;
		SysTick_Wait1ms(2);

		return;

}

void Meio_Passo_A()
{
		GPIO_PORTH_AHB_DATA_R = 0x09;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x01;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x03;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x02;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x06;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x04;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x0C;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x08;
		SysTick_Wait1ms(2);

		return;

}

void Meio_Passo_H()
{
	
		GPIO_PORTH_AHB_DATA_R = 0x08;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x0C;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x04;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x06;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x02;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x03;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x01;
		SysTick_Wait1ms(2);
		GPIO_PORTH_AHB_DATA_R = 0x09;
		SysTick_Wait1ms(2);	
	
		return;

}