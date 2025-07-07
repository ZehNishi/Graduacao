#include <stdint.h>

#include "tm4c1294ncpdt.h"

void SysTick_Wait1ms(uint32_t delay);
void PortA_Output(uint8_t x);
void PortQ_Output(uint8_t x);
void LED_OUTPUT(_Bool x);

void LED_H(uint8_t x)
{
	switch (x){
			case 0: 
				GPIO_PORTQ_DATA_R = 0x0F;
				GPIO_PORTA_AHB_DATA_R = 0x70;
				LED_OUTPUT(1);
						break;
			case 1: 
				GPIO_PORTQ_DATA_R = 0x0F;
				GPIO_PORTA_AHB_DATA_R = 0xB0;
				LED_OUTPUT(1);
						break;
			case 2: 
				GPIO_PORTQ_DATA_R = 0x0F;
				GPIO_PORTA_AHB_DATA_R = 0xD0;
				LED_OUTPUT(1);
						break;
			case 3: 
				GPIO_PORTQ_DATA_R = 0x0F;
				GPIO_PORTA_AHB_DATA_R = 0xE0;
				LED_OUTPUT(1);
						break;
			case 4: 
				GPIO_PORTQ_DATA_R = 0x07;
				GPIO_PORTA_AHB_DATA_R = 0xF0;
				LED_OUTPUT(1);
						break;
			case 5: 
				GPIO_PORTQ_DATA_R = 0x0B;
				GPIO_PORTA_AHB_DATA_R = 0xF0;
				LED_OUTPUT(1);
						break;
			case 6: 
				GPIO_PORTQ_DATA_R = 0x0D;
				GPIO_PORTA_AHB_DATA_R = 0xF0;
				LED_OUTPUT(1);
						break;
			case 7: 
				GPIO_PORTQ_DATA_R = 0x0E;
				GPIO_PORTA_AHB_DATA_R = 0xF0;
				LED_OUTPUT(1);
						break;
	}
	return;
}
void LED_A(uint8_t x)
{
	switch (x){
			case 7: 
				GPIO_PORTQ_DATA_R = 0x0F;
				GPIO_PORTA_AHB_DATA_R = 0x70;
				LED_OUTPUT(1);
						break;
			case 6: 
				GPIO_PORTQ_DATA_R = 0x0F;
				GPIO_PORTA_AHB_DATA_R = 0xB0;
				LED_OUTPUT(1);
						break;
			case 5: 
				GPIO_PORTQ_DATA_R = 0x0F;
				GPIO_PORTA_AHB_DATA_R = 0xD0;
				LED_OUTPUT(1);
						break;
			case 4: 
				GPIO_PORTQ_DATA_R = 0x0F;
				GPIO_PORTA_AHB_DATA_R = 0xE0;
				LED_OUTPUT(1);
						break;
			case 3: 
				GPIO_PORTQ_DATA_R = 0x07;
				GPIO_PORTA_AHB_DATA_R = 0xF0;
				LED_OUTPUT(1);
						break;
			case 2: 
				GPIO_PORTQ_DATA_R = 0x0B;
				GPIO_PORTA_AHB_DATA_R = 0xF0;
				LED_OUTPUT(1);
						break;
			case 1: 
				GPIO_PORTQ_DATA_R = 0x0D;
				GPIO_PORTA_AHB_DATA_R = 0xF0;
				LED_OUTPUT(1);
						break;
			case 0: 
				GPIO_PORTQ_DATA_R = 0x0E;
				GPIO_PORTA_AHB_DATA_R = 0xF0;
				LED_OUTPUT(1);
						break;
	}
return;
}

