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

extern void task1(void);                        
extern void BodyPong (void * arg);
extern void BodyPing (void * arg);


task_t Ping, Pong ;                             


void BodyPing (void * arg)                      
{
   int i ;
   char* name = (char *) arg ;

   UARTprintf ("%s: inicio\n", name) ;
   for (i=0; i<4; i++)
   {
       UARTprintf ("%s: %d\n", name, i) ;
      task_switch (&Pong);
   }
   UARTprintf ("%s: fim\n", name) ;
   task_exit (0) ;
}

void BodyPong (void * arg)                      
{
   int i ;
   char* name = (char *) arg ;

   UARTprintf ("%s: inicio\n", name) ;
   for (i=0; i<4; i++)
   {
       UARTprintf ("%s: %d\n", name, i) ;
      task_switch (&Ping);
   }
   UARTprintf ("%s: fim\n", name) ;
   task_exit (0) ;
}


void task(void)                                // Funcao de teste a ser chamada no main
{
   UARTprintf ("main: inicio\n");

   ppos_init () ;                               // Inicializacao do PPOS

   task_create (&Ping, BodyPing, "    Ping") ;  // Criacao das Tasks
   task_create (&Pong, BodyPong, "        Pong") ;
   UARTprintf ("task_switch:Ping") ;
   task_switch (&Ping) ;                        // Troca da task main para a Ping
   UARTprintf ("task_switch:Pong") ;
   task_switch (&Pong) ;                        // Troca da task Ping para a Pong

   UARTprintf ("main: fim\n");
   UARTprintf("Flavia Domingos Zaganski\n");
   UARTprintf("Marcos Vinicius Simao de Souza\n");
}



