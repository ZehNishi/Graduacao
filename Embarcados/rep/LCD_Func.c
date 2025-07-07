#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include "inc/hw_memmap.h"
#include "driverlib/gpio.h"

void LCD_INIT ();
void LCD_Command(uint8_t x);
void LCD_Print(uint8_t x);
void LCD_Clear();
void Segunda_Linha();
void LCD_Print_String(uint8_t mensagem[31]);
void SysTick_Wait1ms(uint32_t delay);

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