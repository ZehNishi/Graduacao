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

#include "ucontext.h"
#include "queue.h"
#include "ppos_data.h"
#include "ppos.h"

#define STACKSIZE 512

task_t *taskMain, *taskAtual;
typedef enum idd {main, dispatcher} idd;

int taskID;
task_t taskdisp;
task_t *taskQueue;
task_t *taskNext;

task_t *scheduler ()
{
    task_t *taskSelection, *taskAux;
    taskSelection = taskQueue;          
    taskAux = taskQueue;                
if (taskAux->dinPrio > -20) taskAux->dinPrio--;

    while ((taskAux=taskAux->next) != taskQueue) {                                  
            if (taskAux->dinPrio > -20) taskAux->dinPrio--;
            if (taskAux->dinPrio <= taskSelection->dinPrio) taskSelection = taskAux;
    }
taskSelection->dinPrio = taskSelection->estPrio;
    #ifdef DEBUG                        
        UARTprintf("scheduler: proxima tarefa: %d - %s\n",
        taskSelection->id, taskSelection->name);
    #endif
    return taskSelection;
}

void Bodydispatcher (void * arg)
{
    #if defined (DEBUG)|| defined(DEBUGlite)
        UARTprintf("dispatcher: iniciado\n");
    #endif

    while (taskQueue){
        taskNext = scheduler();
        if (taskNext->status == PRONTA) {
            queue_remove ((queue_t **) &taskQueue, (queue_t*) taskNext);
            task_switch(taskNext);
        }
    }
    task_exit(1) ;
}

void ppos_init ()
{
    setvbuf (stdout, 0, _IONBF, 0);
    taskID = 0;

    taskMain = (task_t*)malloc(sizeof(task_t));
    char *stack;
    stack = malloc (STACKSIZE);

    if(stack)
    {
        taskMain->context.uc_stack.ss_sp = stack;
        taskMain->context.uc_stack.ss_size = STACKSIZE;
        taskMain->context.uc_stack.ss_flags = 0;
        taskMain->context.uc_link = 0;
        taskMain->name = "main";
    }
    else
    {
        UARTprintf("Erro na criacao da pilha.\n");
        exit(1);
    }
    taskMain->next = NULL;
    taskMain->prev = NULL;
    taskMain->id = taskID;

    taskAtual = taskMain;
    get_context_asm(&(taskMain->context));
    makecontextMain (&(taskMain->context), 0, 1, "main");



    #if defined (DEBUG)|| defined(DEBUGlite)                                                               
        UARTprintf("ppos_init: PPOS inicializado\n");
    #endif
    task_create (&taskdisp,Bodydispatcher, "dispatcher");

}

int task_create (task_t *task,
                 void (*start_func)(void *),
                 void *arg)
{
    char *stack;
    stack = malloc (STACKSIZE);
    if (stack)
    {
        task->context.uc_stack.ss_sp = stack;
        task->context.uc_stack.ss_size = STACKSIZE;
        task->context.uc_stack.ss_flags = 0;
        task->context.uc_link = 0;
        task->context.initialized = 0;
        task->status = PRONTA;
        task->name = arg;
    task->estPrio = 0;
        task->dinPrio = 0;
}
    else
    {
        UARTprintf("Erro na criacao da pilha: ");
        exit(1);
    }
    
    taskID++;
    task->next = NULL;
    task->prev = NULL;
    task->id = taskID;

    get_context_asm(&(task->context));                  
    makecontext(&(task->context), (int)(*start_func), 1, (char*)arg);

                                      
    if (task != &taskdisp)
                queue_append ((queue_t **) &taskQueue, (queue_t*) task);


    #if defined(DEBUG) || defined(DEBUGlite)
        UARTprintf("task_create: tarefa %d (%s) - criada com sucesso\n", task->id, task->name);
    #endif

    return task->id;
}

int task_switch (task_t *task)                              
{
    task_t *taskAux = taskAtual;                              
    taskAtual = task;                                     

    #ifdef DEBUG                                            
        UARTprintf("task_switch: mudanca de contexto em andamento: %d->%d\n", taskAux->id, task->id);
    #endif


    swap_context_asm(&(taskAux->context),&(task->context));

    return 0;
}

int task_id ()
{
    #ifdef DEBUG                                        
        UARTprintf("task_id: tarefa atual: %d \n", taskAtual->id);
    #endif

    return taskAtual->id;
}

void task_exit (int exitCode)
{
    #if defined (DEBUG)|| defined(DEBUGlite)                                                                    
        UARTprintf("task_exit: encerramento da tarefa %d (%s) \n", taskAtual->id, taskAtual->name);
    #endif


    if (taskAtual->id == dispatcher)                                                                         
        task_switch(taskMain);
    else {                                                                                                      
        if (taskQueue){
            task_t *taskFinalizada = (task_t *) queue_remove((queue_t **) &taskQueue, (queue_t *) taskAtual); 
            free (taskFinalizada);                                                                              
        }

        task_switch(&taskdisp);
    }

}

void task_yield ()
{
    #ifdef DEBUG
        UARTprintf("task_yeld: chamada pela tarefa %d (%s)\n", taskAtual->id, taskAtual->name);
    #endif

    if (taskAtual->id != main && taskAtual->id != dispatcher){
        queue_append((queue_t **) &taskQueue, (queue_t *) taskAtual);
    }

    task_switch (&taskdisp);
}

void task_setprio (task_t *task, int prio)
{
    if (task == NULL) task = taskAtual;

    task->estPrio = prio;
    task->dinPrio = task->estPrio;
}

int task_getprio (task_t *task)
{
    int prio = (task)?  task->estPrio : taskAtual->estPrio;  

    return prio;
}
