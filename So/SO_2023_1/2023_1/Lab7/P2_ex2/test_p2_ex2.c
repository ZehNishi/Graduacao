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
task_t task_2[MAXTASK+1] ;


void BodyTask (void * arg)                             
{
   int next ;

   UARTprintf ("Iniciei  tarefa %5d\n", task_id()) ;


   next = (task_id() < MAXTASK) ? task_id() + 1 : 1 ;   
   task_switch (&task_2[next]);

   UARTprintf ("Encerrei tarefa %5d\n", task_id()) ;

   task_exit (0) ;
}

void task (void)                                       
{
   int i ;
   UARTprintf ("main: inicio\n");
   ppos_init () ;                                       // Inicializacao do PPOS

   for (i=1; i<=MAXTASK; i++)                           // cria MAXTASK tarefas de uma vez
      task_create (&task_2[i], BodyTask, NULL) ;

   for (i=1; i<=MAXTASK; i++)                           // passa o controle para cada uma delas em sequencia
      task_switch (&task_2[i]) ;

   UARTprintf ("main: fim\n");

   UARTprintf("Flavia Domingos Zaganski\n");
   UARTprintf("Marcos Vinicius Simao de Souza\n");
}

