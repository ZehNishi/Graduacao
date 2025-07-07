#include "ppos.h"

extern void p6_test2 ();
extern void p6_test1 ();


void UARTprintf(const char *pcString, ...);

#define WORKLOAD 2000000000000000000

task_t Pang, Peng, Ping, Pong, Pung ;


void hardwork (int n)                // Simulacao de um processamento pesado para uso dos timers
{
   int i, j, conta ;

   conta = 0 ;
   for (i=0; i<n; i++){
       for (j=0; j<n; j++){
           conta += j ;
       }
   }
}

void Body (void * arg)              // Corpo das threads criadas no teste
{

   int i;

   UARTprintf ("%s: inicio em %4d ms\n", (char *) arg, systime()) ;
   for (i=0; i<10; i++)
   {
       UARTprintf ("%s: %d\n", (char *) arg, i) ;
       hardwork(WORKLOAD);

   }
   UARTprintf ("%s: fim    em %4d ms\n", (char *) arg, systime()) ;
   task_exit (0) ;
}


void p6_test1 ()                     // Funcao a ser chamada no main
{
   UARTprintf ("Inicio Test 1\n");
   UARTprintf ("main: inicio\n");

   ppos_init () ;

   task_create (&Pang, Body, "    Pang") ;
   task_create (&Peng, Body, "        Peng") ;
   task_create (&Ping, Body, "            Ping") ;
   task_create (&Pong, Body, "                Pong") ;
   task_create (&Pung, Body, "                    Pung") ;

   task_yield () ;

   UARTprintf ("main: fim\n");
   UARTprintf("Flavia Domingos Zaganski\n");
   UARTprintf("Marcos Vinicius Simao de Souza\n");
}

// corpo das threads
void Body2 (void * arg)
{
   UARTprintf ("%s: inicio em %4d ms (prio: %d)\n", (char *) arg,
           systime(), task_getprio(NULL)) ;
   int i;
   for (i=0; i<10; i++)
   {
       hardwork(WORKLOAD);

   }
   UARTprintf ("%s: fim    em %4d ms\n", (char *) arg, systime()) ;
   task_exit (0) ;
}

void p6_test2 ()
{
    UARTprintf ("Inicio Test 2\n");
   UARTprintf ("main: inicio\n");

   ppos_init () ;

   task_create (&Pang, Body2, "    Pang") ;
   task_setprio (&Pang, 0);

   task_create (&Peng, Body2, "        Peng") ;
   task_setprio (&Peng, -2);

   task_create (&Ping, Body2, "            Ping") ;
   task_setprio (&Ping, -4);

   task_create (&Pong, Body2, "                Pong") ;
   task_setprio (&Pong, -6);

   task_create (&Pung, Body2, "                    Pung") ;
   task_setprio (&Pung, -8);

   task_yield () ;

   UARTprintf ("main: fim\n");
   UARTprintf("Flavia Domingos Zaganski\n");
   UARTprintf("Marcos Vinicius Simao de Souza\n");
}
