/*##############################################################################
Prof. Paulo Denis Garcez da Luz - 2023/2S
Desenvolvido para a placa EK-TM4C1294XL utilizando o SDK TivaWare no KEIL
Programa exemplo de blink usando 4 led, 2 bot�es e Perif�rico SysTick.
##############################################################################*/

//TivaWare uC: Usado internamente para identificar o uC em alguns .h da TivaWare
#define PART_TM4C1294NCPDT 1

#include <FreeRTOS.h>
#include <task.h>
#include <semphr.h>
#include <queue.h>


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

//Mapeamento
#define a1m 04860
#define a2m 09852
#define a3m 14867
#define a4m 19858
#define a5m 24851
#define a6m 29865
#define a7m 34857
#define a8m 39871
#define a9m 44863
#define a10m 49855
#define a11m 54869
#define a12m 59861
#define a13m 64853
#define a14m 69867
#define a15m 74858

#define a1M 05147
#define a2M 10139
#define a3M 15130
#define a4M 20144
#define a5M 25136
#define a6M 30129
#define a7M 35143
#define a8M 40135
#define a9M 45149
#define a10M 50141
#define a11M 55133
#define a12M 60147
#define a13M 65139
#define a14M 70131


//buffer de rx ...
char rx[13],tx[4];

//vari�vel para receber o retorno do cfg do clk
uint32_t SysClock;

// Mutex para proteger a vari�vel global
SemaphoreHandle_t xTargetMutex;
// Handle for the UART mutex
SemaphoreHandle_t xUARTMutex;

// Declara��o da fila
QueueHandle_t xUartQueue;



//Prot�tipos de fun��es criadas no programa, c�digo depois do main
void UARTStringSend(const uint8_t *String, uint32_t tamanho);
void UART_Interruption_Handler(void);
void SetupUart(void);
void GPIOInit(void);
void zerar_serial(void);


TaskHandle_t task1Handle = NULL;
TaskHandle_t task2Handle = NULL;
TaskHandle_t task3Handle = NULL;


void vTask1(void *pvParameters);
void vTask2(void *pvParameters);
void vTaskUARTRead(void *pvParameters);

//Elevador
char andar;                   //Andar atual
char btc_up[15];              //Botões do corredor up
char btc_down[15];            //Botões do corredor down
char btc_in[16];              //Botões da cabine interna
char porta;                   //Porta aberta (0) ou fechada (1)
char estado;
char target;
bool newTarget=0,hit = 1;

int main(void)
{	
	int i=0;
	BaseType_t xReturned;
	SysClock = SysCtlClockFreqSet((SYSCTL_XTAL_25MHZ | SYSCTL_OSC_MAIN | SYSCTL_USE_PLL | SYSCTL_CFG_VCO_240), 16000000);	
	SetupUart();  
	GPIOInit();
	zerar_serial();
	andar=0;
	estado = 'p';
	for (i=15;i>=0;i--) btc_in[i]=0;
	for (i=15;i>=0;i--) btc_down[i]=0;
	for (i=15;i>=0;i--) btc_up[i]=0;
	
	
	  // Create the UART mutex
    xUARTMutex = xSemaphoreCreateMutex();

    if (xUARTMutex == NULL)
    {
        // Failed to create the mutex]
				UARTStringSend("Failed to create Semaph\n",24);
        while(1);
    }
		
		
		xTargetMutex = xSemaphoreCreateMutex();
    if (xTargetMutex == NULL)
    {
        // Falha ao criar o mutex
				UARTStringSend("Failed to create Semaph\n",24);
        while (1);
    }
		
		xUartQueue = xQueueCreate(46, sizeof(uint8_t));
		if (xUartQueue == NULL){
        // Failed to create the queue
        UARTStringSend((uint8_t *)"Failed to create Queue\n", 23);
        while(1);
    }

    // Create tasks
    xReturned = xTaskCreate(vTask1, "Task 1", configMINIMAL_STACK_SIZE, NULL, 1, &task1Handle);
    if (xReturned != pdPASS)
    {
        // Task 1 was not created successfully
        UARTStringSend("Failed to create Task 1\n",24);
        while(1);  // Halt the program
    }
    xReturned = xTaskCreate(vTask2, "Task 2", configMINIMAL_STACK_SIZE, NULL, 1, &task2Handle);
    if (xReturned != pdPASS)
    {
        // Task 2 was not created successfully
        UARTStringSend("Failed to create Task 2\n",24);
        while(1);  // Halt the program
    }
	xReturned = xTaskCreate(vTaskUARTRead, "UART Task", configMINIMAL_STACK_SIZE, NULL, 1, &task3Handle);
    if (xReturned != pdPASS)
    {
        // UART Task was not created successfully
        UARTStringSend("Failed to create Task 3\n",24);
        while(1);  // Halt the program
    }
	
	// Startup of the FreeRTOS scheduler.  The program should block here. 
	vTaskStartScheduler();
	UARTStringSend("Erro",4);

	while(1);
	
	
}

void vTask1(void *pvParameters)
{
	char recebidos_in[16]={},recebidos_up[15]={},recebidos_down[15]={},receivedChar,msgBuffer[50]={};
		int a=0,b=0,c=0, i =0;
    while(1)
    {
				if (xQueueReceive(xUartQueue, &receivedChar, pdMS_TO_TICKS(10)) == pdTRUE){
					if(receivedChar<16){
						sprintf(msgBuffer,"eL%c\r",receivedChar + 97);
						// Try to take the UART mutex
						if (xSemaphoreTake(xUARTMutex, portMAX_DELAY) == pdTRUE)
						{
								vTaskDelay(pdMS_TO_TICKS(30));
								UARTStringSend(msgBuffer,4);
								// Give the UART mutex back
								xSemaphoreGive(xUARTMutex);
						}
						
					recebidos_in[a] = receivedChar;		
					a++;
					}
					if(receivedChar>=16 && receivedChar<31){ //de 16 a 30 bot�o sobe
						recebidos_up[b] = receivedChar - 16;		
						b++;
					}
					if(receivedChar>=31){ //de 31 a 46 bot�o desce
						recebidos_down[c] = receivedChar - 31;		
						c++;
					}
					if(a==15)a=0;
					if(b==14)b=0;
					if(c==14)c=0;
				}
				
				
			if(xSemaphoreTake(xTargetMutex, portMAX_DELAY) == pdTRUE){
				
				if(estado=='s'){
					for(i = 0; i<16;i++){
						if(recebidos_in[i]<target && recebidos_in[i]>=andar) target = recebidos_in[i];
						if(recebidos_up[i]<target && recebidos_up[i]>=andar && i<15) target = recebidos_up[i];
					}
				}
				xSemaphoreGive(xTargetMutex);
				}
				if(xSemaphoreTake(xTargetMutex, portMAX_DELAY) == pdTRUE){
					if(estado=='d'){
						for(i = 0; i<16;i++){
							if(recebidos_in[i]>target && recebidos_in[i]<=andar) target = recebidos_in[i];
							if(recebidos_down[i]>target && recebidos_down[i]<=andar && i<15) target = recebidos_down[i];
						}
					}
				xSemaphoreGive(xTargetMutex);
				}
				if(xSemaphoreTake(xTargetMutex, portMAX_DELAY) == pdTRUE){
					if (hit){
						for(i = 0; i<16;i++){
							if(recebidos_in[i]==target) recebidos_in[i] = 20;
							if(recebidos_up[i]==target && estado!='d' && i<15) recebidos_up[i] = 20;
							if(recebidos_down[i]==target && estado!='s' && i<15) recebidos_down[i] = 20;
						}
						
						if(estado=='s'){
							for(i = 0; i<16;i++){
								if(recebidos_in[i]>andar && recebidos_in[i]!=20) target = recebidos_in[i];
								if(recebidos_up[i]>andar && recebidos_up[i]!=20 && i<15) target = recebidos_up[i];
								}
							}
					
						if(estado=='d'){
							for(i = 0; i<16;i++){
								if(recebidos_in[i]<andar && recebidos_in[i]!=20) target = recebidos_in[i];
								if(recebidos_down[i]<andar && recebidos_down[i]!=20 && i<15) target = recebidos_down[i];
								}
							}
						if(target==andar){
							for(i = 0; i<16;i++){
								if(abs(recebidos_in[i]-andar)>0 && recebidos_in[i]!=20) target = recebidos_in[i];
								if(abs(recebidos_up[i]-andar)>0 && recebidos_up[i]!=20 && i<15) target = recebidos_up[i];
								if(abs(recebidos_down[i]-andar)>0 && recebidos_down[i]!=20 && i<15) target = recebidos_down[i];
							}
							for(i = 0; i<16;i++){
								if(abs(recebidos_in[i]-andar)<abs(target - andar) && recebidos_in[i]!=20) target = recebidos_in[i];
								if(abs(recebidos_up[i]-andar)<abs(target - andar) && recebidos_up[i]!=20 && i<15) target = recebidos_up[i];
								if(abs(recebidos_down[i]-andar)<abs(target - andar) && recebidos_down[i]!=20 && i<15) target = recebidos_down[i];
							}
						}
						if(target!=andar){
							newTarget=1;
							hit = 0;
						} 
						
					}
				xSemaphoreGive(xTargetMutex);
				}
    }
}

void vTask2(void *pvParameters)
{
	int i;
	char msgBuffer[50]={};
	bool parado=1;
    while(1)
    {
			if(newTarget){
				newTarget = 0;
				if (xSemaphoreTake(xTargetMutex, portMAX_DELAY) == pdTRUE){
						if(andar < target){
							tx[0]='e';tx[1]='f';tx[2]='\r';
							if(xSemaphoreTake(xUARTMutex, portMAX_DELAY) == pdTRUE){
								vTaskDelay(pdMS_TO_TICKS(30));
								UARTStringSend(tx,3);
								zerar_serial();
								xSemaphoreGive(xUARTMutex);
							}
							vTaskDelay(pdMS_TO_TICKS(200));
							tx[0]='e';tx[1]='s';tx[2]='\r';
							estado = 's';
							parado = 1;
						}
						if(andar > target){
							
							tx[0]='e';tx[1]='f';tx[2]='\r';
							if(xSemaphoreTake(xUARTMutex, portMAX_DELAY) == pdTRUE){
								vTaskDelay(pdMS_TO_TICKS(30));
								UARTStringSend(tx,3);
								zerar_serial();
								xSemaphoreGive(xUARTMutex);
							}
							vTaskDelay(pdMS_TO_TICKS(200));
							tx[0]='e';tx[1]='d';tx[2]='\r';
							estado = 'd';
							parado = 1;
						}
						if(xSemaphoreTake(xUARTMutex, portMAX_DELAY) == pdTRUE){
							vTaskDelay(pdMS_TO_TICKS(30));
							UARTStringSend(tx,3);
							zerar_serial();
							xSemaphoreGive(xUARTMutex);
						}
					xSemaphoreGive(xTargetMutex);
				}
			}
			
			if (andar == target && parado){
				if(xSemaphoreTake(xTargetMutex, portMAX_DELAY) == pdTRUE){
					hit = 1;
					tx[0]='e';tx[1]='p';tx[2]='\r';
					if(xSemaphoreTake(xUARTMutex, portMAX_DELAY) == pdTRUE){
						vTaskDelay(pdMS_TO_TICKS(30));
						UARTStringSend(tx,3);
						zerar_serial();
						xSemaphoreGive(xUARTMutex);
					}
					vTaskDelay(pdMS_TO_TICKS(200));
					tx[0]='e';tx[1]='a';tx[2]='\r';
							if(xSemaphoreTake(xUARTMutex, portMAX_DELAY) == pdTRUE){
								vTaskDelay(pdMS_TO_TICKS(30));
								UARTStringSend(tx,3);
								zerar_serial();
								xSemaphoreGive(xUARTMutex);
							}
					parado = 0;
					vTaskDelay(pdMS_TO_TICKS(200));
					sprintf(msgBuffer,"eD%c\r",target+97);
					// Try to take the UART mutex
					if (xSemaphoreTake(xUARTMutex, portMAX_DELAY) == pdTRUE)
					{
							vTaskDelay(pdMS_TO_TICKS(30));
							UARTStringSend(msgBuffer,4);
							// Give the UART mutex back
							xSemaphoreGive(xUARTMutex);
					}
				}
				xSemaphoreGive(xTargetMutex);
				vTaskDelay(pdMS_TO_TICKS(5000));
			}
    }
}

void vTaskUARTRead(void *pvParameters)
{
		int i=0, temp=0;
    while(1)
    {
			
			if (rx[0]=='i'&&rx[1]=='n'&&rx[2]=='i'&&rx[3]=='t'&&rx[4]=='i'&&rx[5]=='a'&&rx[6]=='l'&&rx[7]=='i'&&rx[8]=='z'&&rx[9]=='e'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
				vTaskDelay(pdMS_TO_TICKS(2000));
				tx[0]='e';tx[1]='r';tx[2]='\r';
				andar=0;
				for (i=15;i>=0;i--) btc_in[i]=0;
				for (i=15;i>=0;i--) btc_down[i]=0;
				for (i=15;i>=0;i--) btc_up[i]=0;
				if(xSemaphoreTake(xUARTMutex, portMAX_DELAY) == pdTRUE){
					UARTStringSend(tx,3);
					zerar_serial();
					xSemaphoreGive(xUARTMutex);
				}
			}
				
				//Andares
				if (xSemaphoreTake(xTargetMutex, portMAX_DELAY) == pdTRUE){
				if (rx[9]=='e'&&rx[10]=='0'&&rx[11]=='\r'&&rx[12]=='\n'){
					
						andar = 0;
						zerar_serial();
				}
				if (rx[9]=='e'&&rx[10]=='1'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 1;
						zerar_serial();
				}
				if (rx[9]=='e'&&rx[10]=='2'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 2;
						zerar_serial();
				}
				if (rx[9]=='e'&&rx[10]=='3'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 3;
						zerar_serial();
				}
				if (rx[9]=='e'&&rx[10]=='4'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 4;
						zerar_serial();
				}
				if (rx[9]=='e'&&rx[10]=='5'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 5;
						zerar_serial();
				}
				if (rx[9]=='e'&&rx[10]=='6'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 6;
						zerar_serial();
				}
				if (rx[9]=='e'&&rx[10]=='7'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 7;
						zerar_serial();
				}
				if (rx[9]=='e'&&rx[10]=='8'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 8;
						zerar_serial();
				}
				if (rx[9]=='e'&&rx[10]=='9'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 9;
						zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='1'&&rx[10]=='0'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 10;
						zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='1'&&rx[10]=='1'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 11;
						zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='1'&&rx[10]=='2'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 12;
						zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='1'&&rx[10]=='3'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 13;
						zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='1'&&rx[10]=='4'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 14;
						zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='1'&&rx[10]=='5'&&rx[11]=='\r'&&rx[12]=='\n'){
						andar = 15;
						zerar_serial();
				}
				
				//Bot�o interno
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='a'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 0){
						btc_in[0]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='b'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 1){
						btc_in[1]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='c'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 2){
						btc_in[2]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 3){
						btc_in[3]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='e'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 4){
						btc_in[4]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='f'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 5){
						btc_in[5]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='g'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 6){
						btc_in[6]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='h'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 7){
						btc_in[7]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='i'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 8){
						btc_in[8]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='j'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 9){
						btc_in[9]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='k'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 10){
						btc_in[10]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='l'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 11){
						btc_in[11]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='m'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 12){
						btc_in[12]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='n'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 13){
						btc_in[13]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='o'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 14){
						btc_in[14]=1;
						
					}
					zerar_serial();
				}
				if (rx[8]=='e'&&rx[9]=='I'&&rx[10]=='p'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 15){
						btc_in[15]=1;
						
					}
					zerar_serial();
				}
				
				
				//Bot�es corredor
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='0'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 0){
						btc_up[0]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='1'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 1){
						btc_up[1]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='2'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 2){
						btc_up[2]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='3'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 3){
						btc_up[3]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='4'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 4){
						btc_up[4]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='5'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 5){
						btc_up[5]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='6'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 6){
						btc_up[6]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='7'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 7){
						btc_up[7]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='8'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 8){
						btc_up[8]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='9'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 9){
						btc_up[9]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='1'&&rx[9]=='0'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 10){
						btc_up[10]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='1'&&rx[9]=='1'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 11){
						btc_up[11]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='1'&&rx[9]=='2'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 12){
						btc_up[12]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='1'&&rx[9]=='3'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 13){
						btc_up[13]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='1'&&rx[9]=='4'&&rx[10]=='s'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 14){
						btc_up[14]=1;
						
					}
					zerar_serial();
				}
				
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='0'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 0){
						btc_down[0]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='1'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 1){
						btc_down[1]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='2'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 2){
						btc_down[2]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='3'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 3){
						btc_down[3]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='4'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 4){
						btc_down[4]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='5'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 5){
						btc_down[5]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='6'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 6){
						btc_down[6]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='7'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 7){
						btc_down[7]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='8'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 8){
						btc_down[8]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='0'&&rx[9]=='9'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 9){
						btc_down[9]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='1'&&rx[9]=='0'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 10){
						btc_down[10]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='1'&&rx[9]=='1'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 11){
						btc_down[11]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='1'&&rx[9]=='2'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 12){
						btc_down[12]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='1'&&rx[9]=='3'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 13){
						btc_down[13]=1;
						
					}
					zerar_serial();
				}
				if (rx[6]=='e'&&rx[7]=='E'&&rx[8]=='1'&&rx[9]=='4'&&rx[10]=='d'&&rx[11]=='\r'&&rx[12]=='\n'){
					if (andar != 14){
						btc_down[14]=1;
						
					}
					zerar_serial();
				}
			xSemaphoreGive(xTargetMutex);
			}
				
			for(char i=0;i<16;i++){
				if(btc_in[i]){
					xQueueSend(xUartQueue,&i,portMAX_DELAY);
					btc_in[i] = 0;
				}
			}
			for(char i=0;i<15;i++){
				if(btc_up[i]){
					temp = i + 16;
					xQueueSend(xUartQueue,&temp,portMAX_DELAY);
					btc_up[i] = 0;
				}
			}
			for(char i=0;i<15;i++){
				if(btc_down[i]){
					temp = i + 31;
					xQueueSend(xUartQueue,&temp,portMAX_DELAY);
					btc_down[i] = 0;
				}
			}
    }
}


void zerar_serial(void){
rx[0]=0;rx[1]=0;rx[2]=0;rx[3]=0;rx[4]=0;rx[5]=0;rx[6]=0;rx[7]=0;rx[8]=0;rx[9]=0;rx[10]=0;rx[11]=0;rx[12]=0;
tx[0]=0;tx[1]=0;tx[2]=0;tx[3]=0;
}
void GPIOInit(void){
    // Enable the GPIO port that is used for the on-board LED.
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPION);

    // Wait for the GPIO module to be ready.
    while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPION));

    // Configure the GPIO pin for the LED (PN0).
    GPIOPinTypeGPIOOutput(GPIO_PORTN_BASE, GPIO_PIN_0);
}


//fun��o para enviar string pela uart
void UARTStringSend(const uint8_t *String, uint32_t tamanho){
while (tamanho--) UARTCharPut(UART0_BASE, *String++);
}

//fun��o de tratamento da interrup��o do uart
void UART_Interruption_Handler(void) {
  uint8_t last;
	int i;
  //limpar IRQ exec
  UARTIntClear(UART0_BASE,UARTIntStatus(UART0_BASE,true));
  // Ler o pr�ximo caractere na uart.
  last = (uint8_t)UARTCharGetNonBlocking(UART0_BASE);
	// Enviar o caractere para a fila
	//xQueueSendFromISR(xUartQueue, &last, NULL);
	for (i = 0; i < 12; i++)
	{
			rx[i] = rx[i + 1];
	}	
	rx[12]=last;
}

//fun��o para configurar e inicializar o perif�rico Uart a 115.2k,8,n,1
void SetupUart(void){
    // Habilitar porta serial a 115200 com interrup��o seguindo a sequ�ncia de inicializa��es abaixo:
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);
    while(!SysCtlPeripheralReady(SYSCTL_PERIPH_UART0));
    UARTConfigSetExpClk(UART0_BASE, SysClock, 115200, (UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE));
    UARTFIFODisable(UART0_BASE); // Desabilitar FIFO para simplificar o c�digo
    UARTIntEnable(UART0_BASE, UART_INT_RX | UART_INT_RT); // Habilitar interrup��es de recebimento e timeout
    UARTIntRegister(UART0_BASE, UART_Interruption_Handler); // Registrar a fun��o de interrup��o
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
    while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOA));
    GPIOPinConfigure(GPIO_PA0_U0RX);
    GPIOPinConfigure(GPIO_PA1_U0TX);
    GPIOPinTypeUART(GPIO_PORTA_BASE, (GPIO_PIN_0 | GPIO_PIN_1));
}
