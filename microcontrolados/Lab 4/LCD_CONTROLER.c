#include <stdint.h>

	void LCD_Command(uint8_t x);
	void LCD_Print(uint8_t x);
	
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
