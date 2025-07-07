#include <stdio.h>
//#include <printf.h>
#include <stdlib.h>
#include "ucontext.h"

// operating system check
#if defined(_WIN32) || (!defined(__unix__) && !defined(__unix) && (!defined(__APPLE__) || !defined(__MACH__)))
//#warning Este codigo foi planejado para ambientes UNIX (LInux, *BSD, MacOS). A compilacao e execucao em outros ambientes e responsabilidade do usuario.
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

