#include "ppos.h"

extern void p6_test2 ();
extern void p6_test1 ();


void UARTprintf(const char *pcString, ...);

#define WORKLOAD 200000000000000000000

task_t Pang, Peng, Ping, Pong, Pung ;


void Body (void * arg)              // Corpo das threads criadas no teste
{
    int i,j ;

    for (i=0; i<10; i++)
    {
       UARTprintf ("%s %d\n", (char *) arg, i) ;
       for (j=0; j<1000000000000; j++) ;
    }
    UARTprintf ("%s FIM\n", (char *) arg) ;
    task_exit (0) ;

}


void p5_func ()                     // Funcao a ser chamada no main
{
   UARTprintf ("Inicio Main\n");
   ppos_init () ;

   task_create (&Pang, Body, "    Pang") ;
   task_create (&Peng, Body, "        Peng") ;
   task_create (&Ping, Body, "            Ping") ;
   task_create (&Pong, Body, "                Pong") ;
   task_create (&Pung, Body, "                    Pung") ;

   task_yield () ;

   UARTprintf ("main: fim\n");
   UARTprintf("Fernando Itiro\n");
   UARTprintf("Vinicius Wolter\n");
}


