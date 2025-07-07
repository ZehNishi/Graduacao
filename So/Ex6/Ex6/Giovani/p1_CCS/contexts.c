#include <stdio.h>
//#include <printf.h>
#include <stdlib.h>
#include "ucontext.h"

// operating system check
#if defined(_WIN32) || (!defined(__unix__) && !defined(__unix) && (!defined(__APPLE__) || !defined(__MACH__)))
#warning Este codigo foi planejado para ambientes UNIX (LInux, *BSD, MacOS). A compilacao e execucao em outros ambientes e responsabilidade do usuario.
#endif

//#define STACKSIZE 32768		/* tamanho de pilha das threads */
#define STACKSIZE 4096		/* tamanho de pilha das threads */
#define _XOPEN_SOURCE 600	/* para compilar no MacOS */

ucontext_t ContextPing, ContextPong, ContextMain;

/*****************************************************/

int flag;
int memPC = 0;

//-D DEBUG -D gcc CFLAGS =-g -Wall -I. -mcpu=cortex-m4 -mfloat-abi=hard
//-D DEBUG -D gcc CFLAGS =-g -Wall -I. -mcpu=cortex-m4 -mfloat-abi=hard
void BodyPing (void * arg)
{
   int i ;

   UARTprintf ("PING  %s iniciada\n", (char *) arg) ;
   
   for (i=0; i<6; i++)
   {
      UARTprintf ("PING  %s %d\n", (char *) arg, i) ;
      swap_context_asm (&ContextPing, &ContextPong);
   }	
   UARTprintf ("%s FIM\n", (char *) arg) ;

   swap_context_asm (&ContextPing, &ContextMain) ;
}

/*****************************************************/

void BodyPong (void * arg)
{
   int i ;

   UARTprintf ("PONG  %s iniciada\n", (char *) arg) ;

   for (i=0; i<6; i++)
   {
      UARTprintf ("PONG  %s %d\n", (char *) arg, i) ;
      swap_context_asm (&ContextPong, &ContextPing);
   }
   UARTprintf ("%s FIM\n", (char *) arg) ;

   UARTprintf ("Giovani Sperandio de Moraes 1819976\n") ;

   swap_context_asm (&ContextPong, &ContextMain) ;
}

/*****************************************************/

//int main (int argc, char *argv[])
void teste1(void){ //main1(void){

//{
   char *stack ;

//	int a;
//	a = 10;
	
   printf ("Main INICIO\n");

   get_context_asm (&ContextMain);
   makecontextMain(&ContextMain, (int)(*teste1), 1, "        teste1");


   get_context_asm (&ContextPing);

   stack = malloc (10) ;
   if (stack)
   {
      ContextPing.uc_stack.ss_sp = stack ;
      ContextPing.uc_stack.ss_size = STACKSIZE;
      ContextPing.uc_stack.ss_flags = 0;
      ContextPing.uc_link = 0;
   }
   else
   {
      perror ("Erro na cria��o da pilha: ");
//      exit (1);
   }

   makecontext (&ContextPing, (int) (*BodyPing), 1, "    Ping");

   get_context_asm (&ContextPong);

   stack = malloc (STACKSIZE) ;
   if (stack)
   {
      ContextPong.uc_stack.ss_sp = stack ;
      ContextPong.uc_stack.ss_size = STACKSIZE;
      ContextPong.uc_stack.ss_flags = 0;
      ContextPong.uc_link = 0;
   }
   else
   {
      perror ("Erro na cria��o da pilha: ");
//      exit (1);
   }

   makecontext (&ContextPong, (int)(*BodyPong), 1, "        Pong");

   swap_context_asm (&ContextMain, &ContextPing);
   //swap_context (&ContextMain, &ContextPing);
   swap_context_asm (&ContextMain, &ContextPong);
   //swap_context (&ContextMain, &ContextPong);

   printf ("Aluno: Henrique Mazzuchetti  RA: 1354922\n");
   printf ("Main FIM\n");

//   exit (0);
	return;
}
