//#define UARTprintf UARTprintf
#include <stdio.h>
#include <stdlib.h>
//#include <assert.h>
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

#include "ucontext.h"               // Para troca de contexto
#include "queue.h"                  // Filas
#include "ppos_data.h"              // Estruturas de dados do Ping Pong
#include "ppos.h"                   // Declaracao de funcoes e defines do PPOS

#define STACKSIZE 512

task_t *taskMain, *taskAtual;     	// Task principal e atual
int taskID;                         // ID de tasks


// Inicializa o sistema operacional; deve ser chamada no inicio do main()
void ppos_init (void(*start_func)(void*),
				void *arg)
{
	taskID = 0;
	
	taskMain = (task_t*)malloc(sizeof(task_t)); 		
	char *stack;      							//Pilha de contexto                             
    stack = malloc (STACKSIZE);
	
	if(stack)
	{
		taskMain->context.uc_stack.ss_sp = stack;       
        taskMain->context.uc_stack.ss_size = STACKSIZE;
        taskMain->context.uc_stack.ss_flags = 0;
        taskMain->context.uc_link = 0;
	}
	else
	{
		UARTprintf("Erro na criação da pilha.\n");
        exit(1);
	}
	taskMain->next = NULL;
    taskMain->prev = NULL;
    taskMain->id = taskID;

    taskAtual = taskMain;
    get_context_asm(&(taskMain->context));
    makecontextMain (&(taskMain->context), (int)(*start_func), 1, (char*)arg);
	
	/* desativa o buffer da saida padrao (stdout), usado pela funcao printf */
    setvbuf (stdout, 0, _IONBF, 0);                     

    #ifdef DEBUG                                        
        UARTprintf("ppos_init: PPOS inicializado\n");
    #endif
}


// Cria uma nova tarefa. Retorna um ID> 0 ou erro.
int task_create (task_t *task,					// descritor da nova tarefa
                 void (*start_func)(void *),	// funcao corpo da tarefa
                 void *arg)						// argumentos para a tarefa
{
	char *stack;                                        // Criacao da pilha para contexto
    stack = malloc (STACKSIZE);
    if (stack)
    {
        task->context.uc_stack.ss_sp = stack;
        task->context.uc_stack.ss_size = STACKSIZE;
        task->context.uc_stack.ss_flags = 0;
        task->context.uc_link = 0;
        task->context.initialized = 0;
    }
    else
    {
        UARTprintf("Erro na criacaoo da pilha: ");
        exit(1);
    }
    
    taskID++;
    task->next = NULL;
    task->prev = NULL;
    task->id = taskID;

    get_context_asm(&(task->context));                  
    makecontext(&(task->context), (int)(*start_func), 1, (char*)arg);

    #ifdef DEBUG                                       
        UARTprintf("task_create: tarefa %d criada com sucesso\n", task->id);
    #endif

    return task->id;
}

// Termina a tarefa corrente, indicando um valor de status encerramento
void task_exit (int exitCode)
{
	#ifdef DEBUG                                    // Msg de debug
        UARTprintf("task_exit: encerramento da tarefa %d \n", taskCurrent->id);
    #endif
    //task_switch(taskMain);                          // Retorno p/ main
    task_t *aux = taskAtual;                          // Mudança da tarefa atual
    taskAtual = taskMain;

    swap_context_asm(&(aux->context), &(taskMain->context));// Mudanca do contexto em execucao

}

// alterna a execucao para a tarefa indicada
int task_switch (task_t *task)
{
	task_t *aux = taskAtual;
    taskAtual = task;

    #ifdef DEBUG                                        
        UARTprintf("task_switch: mudanca de contexto em andamento: %d->%d\n", aux->id, task->id);
    #endif

    swap_context_asm(&(aux->context), &(task->context));// Mudança do contexto em execucao

    return 0;
}

// retorna o identificador da tarefa corrente (main deve ser 0)
int task_id ()
{
	#ifdef DEBUG                                    
        UARTprintf("task_id: tarefa atual: %d \n", taskCurrent->id);
    #endif

    return taskAtual->id;
}
