// p6 changes: pTime and activations added in struct task_t

// PingPongOS - PingPong Operating System
// Prof. Carlos A. Maziero, DINF UFPR

// Estruturas de dados internas do sistema operacional

#ifndef __PPOS_DATA__
#define __PPOS_DATA__

#include "ucontext.h"       // biblioteca POSIX de trocas de contexto
#include "queue.h"      // biblioteca de filas gen�ricas

typedef enum task_state {READY, SUSPENDED, FINISHED} task_state;
typedef enum task_type {SYSTEM, USER} task_type;

// Estrutura que define um Task Control Block (TCB)
typedef struct task_t
{
   struct task_t *prev, *next ;     // ponteiros para usar em filas
   int id ;             // identificador da tarefa
   ucontext_t context ;         // contexto armazenado da tarefa
   task_state status;                                                                   // Status (READY, SUSPENDED, FINISHED)
   char *name;                                                                          // Nome
   int sPrio;                                                                           // Prioridade estatica
   int dPrio;                                                                           // Prioridade dinamica
   task_type type;                                                                      // Se a tarefa � de sistema ou de usuario
   int pTime;                                                                           // tempo de processador utilizado pela task
   int activations;                                                                     // Numero de ativacoes da task

   // ... (outros campos ser�o adicionados mais tarde)
} task_t ;

// estrutura que define um sem�foro
typedef struct
{
  // preencher quando necess�rio
} semaphore_t ;

// estrutura que define um mutex
typedef struct
{
  // preencher quando necess�rio
} mutex_t ;

// estrutura que define uma barreira
typedef struct
{
  // preencher quando necess�rio
} barrier_t ;

// estrutura que define uma fila de mensagens
typedef struct
{
  // preencher quando necess�rio
} mqueue_t ;

#endif
