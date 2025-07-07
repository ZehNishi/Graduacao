// main.c

#include <stdint.h>
#include "tm4c1294ncpdt.h"

void PLL_Init(void);
void SysTick_Init(void);
void SysTick_Wait1ms(uint32_t delay);
void GPIO_Init(void);
uint8_t Leitura_Teclado();
void LCD_INIT ();
void LCD_Command(uint8_t x);
void LCD_Print(uint8_t x);
void LCD_Clear();
void Segunda_Linha();
void LCD_Print_String(uint8_t mensagem[31]);
uint32_t ADC();
uint8_t conv();
void loop();
void TimerInit();
_Bool LeituraTimer();
uint8_t inicial_1();
uint8_t inicial_2();
uint8_t inicial_3();
void eq_A(uint8_t n1, uint8_t n2);
void eq_B(uint8_t n2, uint8_t n3);
void eq_C(uint8_t n1, uint8_t n3);
	
int main(void)
{
	PLL_Init();
	SysTick_Init();
	GPIO_Init();
	LCD_INIT();
	LCD_Clear();
	//TimerInit();
	//TIMER0_CTL_R = 0x01;	
	uint8_t n1 = (inicial_1()/26);
	uint8_t n2 = (inicial_2()/26);
	
	uint8_t nivel = 0; 
	nivel = Leitura_Teclado(); //leitura do nivel vindo da função inicial_2
	
	uint8_t n3 = (inicial_3()/26);
	uint8_t op = 0;
	uint8_t erro[31] = "Erro                          ";
	
	// variáveis para while de op
	uint8_t contA = 0;
	uint8_t contB = 0;
	uint8_t contC = 0;
	uint8_t bloqueioA[31] = "Equacao A ja    visualizada!   ";
	uint8_t bloqueioB[31] = "Equacao B ja    visualizada!   ";
	uint8_t bloqueioC[31] = "Equacao C ja    visualizada!   ";
		
	while(op != 'D'){
	
	op = Leitura_Teclado(); //leitura da equacao selecionada vindo da função inicial_3
		
	if(nivel == '1'){
		switch(op){
			case 'A':
				eq_A(n1, n2);
				break;
			case 'B':
				eq_B(n2, n3);
				break;
			case 'C':
				eq_C(n1, n3);
				break;
			
			SysTick_Wait1ms(500);
		}
	}
	if(nivel == '2'){
	
		switch(op){
				case 'A':
					SysTick_Wait1ms(100);
					contA++;
					if (contA == 1){
						eq_A(n1, n2);
					} 
					else{
						LCD_Clear();	
						LCD_Print_String(bloqueioA);
					} 
					break;
					
				case 'B':
					SysTick_Wait1ms(100);
					contB++;
					if (contB == 1){
						eq_B(n2, n3);
					} 
					else{
						LCD_Clear();	
						LCD_Print_String(bloqueioB);
					} 	
					break;
					
				case 'C':
					SysTick_Wait1ms(100);
					contC++;	
					if (contC == 1){
						eq_C(n1, n3);
					} 
					else {
						LCD_Clear();	
						LCD_Print_String(bloqueioC);
					} 
					break;
				}
				SysTick_Wait1ms(500);
		}
		
		if(nivel == '3'){
	
		switch(op){
				case 'A':
					SysTick_Wait1ms(100);
					contA++;
					if (contA == 1){
						eq_A(n1, n2);
						SysTick_Wait1ms(2000);
						LCD_Clear();
						LCD_Print_String(bloqueioA);
					} 
					else{
						LCD_Clear();	
						LCD_Print_String(bloqueioA);
					} 
					break;
					
				case 'B':
					SysTick_Wait1ms(100);
					contB++;
					if (contB == 1){
						eq_B(n2, n3);
						SysTick_Wait1ms(2000);
						LCD_Clear();
						LCD_Print_String(bloqueioB);
					} 
					else{
						LCD_Clear();	
						LCD_Print_String(bloqueioB);
					} 	
					break;
					
				case 'C':
					SysTick_Wait1ms(100);
					contC++;	
					if (contC == 1){
						eq_C(n1, n3);
						SysTick_Wait1ms(2000);
						LCD_Clear();
						LCD_Print_String(bloqueioC);
					} 
					else {
						LCD_Clear();	
						LCD_Print_String(bloqueioC);
					} 
					break;
				}
				SysTick_Wait1ms(500);
		}
	}
	
	LCD_Clear();
	SysTick_Wait1ms(500);
	op = 0;
	
	//Responder o jogo
	uint8_t msg4[31]="Ordem dos       digitos:       ";
	msg4[26] = 242;
	msg4[27] = 227;
	msg4[28] = 244;
	LCD_Print_String(msg4);
	SysTick_Wait1ms(2000);
	LCD_Clear();
	uint8_t msg3[31]="Aperte D para   Confirmar      ";
	LCD_Print_String(msg3);
	SysTick_Wait1ms(1000);
	LCD_Clear();
	uint8_t msg2[31]="Selecione os    digitos:       ";
	while(op != 'D'){
		LCD_Print_String(msg2);
		op = Leitura_Teclado();
		msg2[26]=conv();
		SysTick_Wait1ms(50);
	}
		op = 0;
		SysTick_Wait1ms(500);
		while(op != 'D'){
		LCD_Print_String(msg2);
		op = Leitura_Teclado();
		msg2[27]=conv();
		SysTick_Wait1ms(50);
	}
		op = 0;
		SysTick_Wait1ms(500);
			while(op != 'D'){
		LCD_Print_String(msg2);
		op = Leitura_Teclado();
		msg2[28]=conv();
		SysTick_Wait1ms(50);
	}
		LCD_Clear();
	
	if(msg2[26] == (n1 +48)){
		if(msg2[27] == (n2 +48)){
			if(msg2[28] == (n3 +48)){
		uint8_t msg4[31]=" Voce acertou!!    Parabens! :)";
		LCD_Print_String(msg4);
			}
		}
	}else{
		uint8_t msg4[31]="  Voce errou                 :(";
		LCD_Print_String(msg4);
	}
	
	SysTick_Wait1ms(2000);
	LCD_Clear();
	uint8_t msgfinal[31] = "FIM - pressione *para reiniciar";
	LCD_Print_String(msgfinal);
	uint8_t reset = 0; 
	while (reset != '*')
	{
		reset = Leitura_Teclado();
	}
	SysTick_Wait1ms(500);
	LCD_Clear();
	main(); 
	
	return 0;
}

uint8_t inicial_1() {
	
	uint8_t x = 0;
	//start
	uint8_t msg0[31] = "Aperte * para   comecar        ";
	LCD_Print_String(msg0);
	uint8_t ini = 0;
	while (ini != '*'){
		ini = Leitura_Teclado();
		x++;
		if(x == 0xFF){
			x = 0;
		}
	}
	LCD_Clear();
	SysTick_Wait1ms(500);
	
	return x;
}

uint8_t inicial_2() {
	
	uint8_t x = 0;
	//start
	uint8_t msg1[31] = "Selecione a     dificuldade:   ";
	LCD_Print_String(msg1);
	SysTick_Wait1ms(1000);
	LCD_Clear();
	uint8_t msg0[31] = "1-Facil 2-Medio    3-Dificil   ";
	LCD_Print_String(msg0);
	uint8_t ini = 0;
	while(ini == 0){
		ini = Leitura_Teclado();	
		if (ini == 'A' || ini == 'B' || ini == 'C' || ini == 'D'  || ini == '*' || ini == '#' || ini == '0' || ini == '4' || ini == '5' || ini == '6' || ini == '7' || ini == '8' || ini == '9' )
			{
			ini = 0;
			}
		x++;
		if(x == 0xFF){
			x = 0;
		}
	}
	LCD_Clear();	
	return x;
}

uint8_t inicial_3() {
	
	uint8_t x = 0;
	uint8_t msg1[31] = "Para responder  Aperte D       ";
	LCD_Print_String(msg1);
	SysTick_Wait1ms(2000);
	LCD_Clear();
	//start
	uint8_t msg0[31] = "Visualizar as   equacoes: A-B-C";
	LCD_Print_String(msg0);
	uint8_t ini = 0;
	while (ini == 0){
		ini = Leitura_Teclado();
		if (ini == '1' || ini == '2' || ini == '3' || ini == '*' || ini == '#' || ini == '0' || ini == '4' || ini == '5' || ini == '6' || ini == '7' || ini == '8' || ini == '9' )
			{
			ini = 0;
			}
		x++;
		if(x == 0xFF){
			x = 0;
		}
	}
	
	LCD_Clear();
	
	return x;
}

void eq_A(uint8_t n1, uint8_t n2){
	LCD_Clear();
		uint8_t A = n1 + n2;
		uint8_t A1, A2;
			if(A > 9){
				A1 = 49; 
				A = A-10;
				A2 = A + 48;
			} else {
					A1 = 48;
					A2 = A + 48;
			}
		uint8_t msg0[31] = "                               ";
		msg0[4] = 242;
		msg0[6] = 43;
		msg0[8] = 227;
		msg0[10] = 61;
		msg0[12] = A1;
		msg0[13] = A2;
		LCD_Clear();
		LCD_Print_String(msg0);
		return; 
}

void eq_B(uint8_t n2, uint8_t n3){
	LCD_Clear();
		uint8_t A = n2 - n3;
		uint8_t A1, A2;
			if(n3 <= n2){
				A1 = 48; 
				A2 = 48 + A;
			} else {
					A1 = 45;
					A2 = -A + 48;
			}
		uint8_t msg0[31] = "                               ";
		msg0[4] = 227;
		msg0[6] = 45;
		msg0[8] = 244;
		msg0[10] = 61;
		msg0[12] = A1;
		msg0[13] = A2;
		LCD_Clear();
		LCD_Print_String(msg0);
		return; 
}

void eq_C(uint8_t n1, uint8_t n3){
	LCD_Clear();
		uint8_t A = n1*n3;
		uint8_t A1 = 0, A2;
		while (A>9){
			A1++;
			A -= 10;
		}
		A2 = A + 48;
		A1 = A1 + 48;
		uint8_t msg0[31] = "                               ";
		msg0[4] = 242;
		msg0[6] = 42;
		msg0[8] = 244;
		msg0[10] = 61;
		msg0[12] = A1;
		msg0[13] = A2;
		LCD_Clear();
		LCD_Print_String(msg0);
		return; 
}

uint8_t conv (){
	
	uint32_t x = ADC();
	
	if(x <= 0x100){
	return '0';
	} 
	else
	if(x <= 0x200){
	return '1';
	}
	else
	if(x <= 0x400){
	return '2';
	}
	else
	if(x <= 0x500){
	return '3';
	}
	else
	if(x <= 0x700){
	return '4';
	}
	else
	if(x <= 0x800){
	return '5';
	}
	else
	if(x <= 0xA00){
	return '6';
	}
	else
	if(x <= 0xB00){
	return '7';
	}
	else
	if(x <= 0xD00){
	return '8';
	}
	else
	if(x <= 0xFFF){
	return '9';
	}
	return '0';
}
