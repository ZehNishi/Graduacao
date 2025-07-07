#include <stdio.h>                              
#include <stdlib.h>
#include "ppos.h"
/*
#include <stdint.h>
#include <stdbool.h>
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "driverlib/gpio.h"
#include "drivers/pinout.h"
#include "driverlib/pin_map.h"
#include "driverlib/rom.h"
#include "driverlib/rom_map.h"
#include "driverlib/sysctl.h"
#include "driverlib/uart.h"
#include "utils/uartstdio.h"
*/


extern void task(void);                        
extern void BodyTask (void * arg);

#define MAXTASK 10                              
task_t task_t3 ;                                



void BodyTask3(void * arg)                             
{
    UARTprintf ("Estou na tarefa %5d\n", task_id()) ;
   task_exit (0) ;                                      
}

void task (void)
{
   int j ;
   UARTprintf ("main: inicio\n");

   ppos_init () ;                                       // Inicializacao do PPOS

   // cria MAXTASK tarefas, ativando cada uma apos sua criacao
   for (j=0; j<MAXTASK; j++)
   {
     task_create (&task_t3, BodyTask3, NULL) ;
     task_switch (&task_t3) ;
   }

   UARTprintf ("main: fim\n");
   UARTprintf("Flavia Domingos Zaganski\n");
   UARTprintf("Marcos Vinicius Simao de Souza\n");

}



