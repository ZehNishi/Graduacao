#include "ppos.h"


extern void p3_disp ();

task_t Pang, Peng, Ping, Pong, Pung ;               


// Corpo das threads
void Body (void * arg)
{
  int i ;

  UARTprintf ("%s: inicio\n",(char *)arg) ;

  for (i=0; i<5; i++)
  {
    UARTprintf ("%s: %d\n", (char *) arg, i) ;
    task_yield ();                                  
  }
  
  UARTprintf ("%s: fim\n", (char *) arg) ;
  task_exit (0) ;                                   
}


void p3_disp ()
{
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
