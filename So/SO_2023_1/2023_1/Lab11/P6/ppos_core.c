//==================================================================================
// UTFPR - SISTEMAS OPERACIONAIS |out/2020|
// P6 - CONTABILIZAÇÃO   (PPOS)
// - Definição das funções do PPOS para manipulação das tasks na TIVA
// Autores: Dennis Bragagnolo e Isabela Kloster
//==================================================================================
// Inclusão das funções 'systime' e 'Timer1_Init()', além de modificações no restante do código


#include <stdio.h>
#include <stdlib.h>

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

#include "ucontext.h"                   // Funções e structs adaptadas para TIVA
#include "queue.h"                      // Filas
#include "ppos_data.h"                  // Estruturas de dados do Ping Pong OS
#include "ppos.h"                       // Declaração de funções e defines do PPOS

#include "driverlib/timer.h"            // Bibliotecas para timers e interrupções
#include "inc/hw_ints.h"
uint32_t g_ui32SysClock;                // Clockrate
#define TEMPOTASK g_ui32SysClock/100    // Definicao do tempo utilizado para cada task

#include "inc/hw_nvic.h"                // Bibliotecas para cálculo de tempo
#include "inc/hw_memmap.h"
#define DWT_O_CYCCNT 0x00000004


//==================================================================================
// Definicoes de variaveis e funcoes

//#define DEBUG                           // Para apresentar mensagens de debug
//#define DEBUGlite                       // Para apresentar mensagens de debug específicas
#define STACKSIZE 512                   // Tamanho de pilha das threads
typedef enum ids {MAIN, DISPATCHER} ids;
task_t *taskMain, *taskCurrent;         // Tasks principal e atual
int taskID;                             // Contagem de ID de tasks
task_t taskDispatcher;                  // Dispatcher
task_t *taskQueue;                      // Fila de tarefas
task_t *taskNext;                       // Próxima tarefa a ser executada
//unsigned int execution_time=0;            // Tempo de execução do sistema
unsigned int taskStart_time;            // Tempo do inicio da atribuição do processador à tarefa



void Timer_Init();



//==================================================================================
// Escalonamento de tasks

task_t *scheduler ()                    // Funcao chamada pelo dispatcher para escalonar as threads
{
    task_t *taskSelection, *taskAux;
    taskSelection = taskQueue;          // A task selecionada é a primeira da fila (ou NULL) (escalonamento FCFS)
    taskAux = taskQueue;                // Auxiliar para manipulação da fila
    if (taskAux->dPrio > -20) taskAux->dPrio--;

    while ((taskAux=taskAux->next) != taskQueue) {                                  // Percorre a fila

            if (taskAux->dPrio <= taskSelection->dPrio) taskSelection = taskAux;    // Altera a seleção da tarefa se for mais prioritária
            if (taskAux->dPrio > -20) taskAux->dPrio--;                             // Modifica a prioridade da tarefa na fila
    }

    taskSelection->dPrio = taskSelection->sPrio;

    #ifdef DEBUG                        // Msg de debug
        UARTprintf("scheduler: proxima tarefa: %d - %s\n",
                   taskSelection->id, taskSelection->name);
    #endif

    return taskSelection;
}

void BodyDispatcher (void * arg)
{
    #if defined (DEBUG)|| defined(DEBUGlite)                                // Msg de debug
        UARTprintf("dispatcher: iniciado\n");
    #endif

    taskCurrent->activations +=1;                                           // --Atualiza o num de ativações do dispatcher

    while (taskQueue){                                                      // Verifica a existência de tarefa na fila
        taskNext = scheduler();                                             // Recebe a tarefa conforme algoritmo de escalonamento
        if (taskNext->status == READY || taskNext->status == SUSPENDED) {   // Verifica se a tarefa está pronta
            taskStart_time= systime();                                      // --Atualiza o tempo de processamento da task
            taskNext->activations +=1;                                      // --Atualiza o num de ativações da task
            queue_remove ((queue_t **) &taskQueue, (queue_t*) taskNext);    // --Remove a tarefa da posição na fila
            ROM_IntMasterEnable();                                          // --Ativa as interrupções
            task_switch(taskNext);                                          // --Troca para a próxima tarefa
        }
    }
    task_exit(1) ;                                                          // Encerra o dispatcher
}



//==================================================================================
// Inicialização do SO

void ppos_init ()
{
    setvbuf (stdout, 0, _IONBF, 0);                     // Desativação do buffer (stdout) (do printf)
    taskID = 0;                                         // Inicialização do ID

    taskMain = (task_t*)malloc(sizeof(task_t));         // Inicialização da task principal
    char *stack;                                        // Inicialização da pilha de contexto
    stack = malloc (STACKSIZE);
    if (stack) {
        taskMain->context.uc_stack.ss_sp = stack;       // Contexto da task principal
        taskMain->context.uc_stack.ss_size = STACKSIZE;
        taskMain->context.uc_stack.ss_flags = 0;
        taskMain->context.uc_link = 0;
        taskMain->name = "MAIN";
        taskMain->type = SYSTEM;
    }
    else {
        UARTprintf("Erro na criação da pilha.\n");
        exit(1);
    }
    taskMain->next = NULL;
    taskMain->prev = NULL;
    taskMain->id = taskID;

    taskCurrent = taskMain;                                         // Definição da main como atual
    get_context_asm(&(taskMain->context));
    makecontextMain (&(taskMain->context), 0, 1, "--MAIN");

    #if defined (DEBUG)|| defined(DEBUGlite)                        // Msg de debug
        UARTprintf("ppos_init: PPOS inicializado\n");
    #endif

    task_create (&taskDispatcher,BodyDispatcher, "dispatcher");     // Criação do dispatcher

    Timer_Init();                                                   // Inicialização do timer e das interrupções
}


//==================================================================================
// Criação de tarefa

int task_create (task_t *task,                              // Nova tarefa
                 void (*start_func)(void *),                // Função corpo da task
                 void *arg)                                 // Argumento da task
{

    char *stack;                                            // Criação da pilha para contexto
    stack = malloc (STACKSIZE);
    if (stack) {
        task->context.uc_stack.ss_sp = stack;               // Inicialização dos elementos da task
        task->context.uc_stack.ss_size = STACKSIZE;
        task->context.uc_stack.ss_flags = 0;
        task->context.uc_link = 0;
        task->context.initialized = 0;
        task->status = READY;
        task->name = arg;
        task->sPrio = 0;
        task->dPrio = 0;
        task->pTime = 0;
        task->activations = 0;
    }
    else {
        UARTprintf("Erro na criação da pilha: ");
        exit(1);
    }
    //task = (task_t*)malloc(sizeof(task_t));               // Inicialização da task (não usar - causa erro)
    taskID++;
    task->next = NULL;
    task->prev = NULL;
    task->id = taskID;

    get_context_asm(&(task->context));                      // Contexto da task criada
    makecontext(&(task->context), (int)(*start_func), 1, (char*)arg);

    if (task != &taskDispatcher) {                          // Adiciona a tarefa criada ao final da fila
        queue_append ((queue_t **) &taskQueue, (queue_t*) task);
        task->type = USER;
    }
    else task->type = SYSTEM;


    #if defined(DEBUG) || defined(DEBUGlite)                // Msg de debug
        UARTprintf("task_create: tarefa %d (%s) - criada "
                "com sucesso\n", task->id, task->name);
    #endif

    return task->id;
}


//==================================================================================
// Mudança de tarefa em execução

int task_switch (task_t *task)                              // O parâmetro é a nova tarefa
{
    task_t *taskAux = taskCurrent;                              // Auxiliar receber a tarefa atual
    taskCurrent = task;                                     // Tarefa atual passa a ser a nova

    #ifdef DEBUG                                            // Msg de debug
        UARTprintf("task_switch: mudanca de contexto em "
                "andamento: %d->%d\n", taskAux->id, task->id);
    #endif

    swap_context_asm(&(taskAux->context),&(task->context));     // Mudança do contexto em execução

    return 0;
}


//==================================================================================
// Consulta do id da tarefa em execução

int task_id ()
{
    #ifdef DEBUG                                        // Mensagem de debug
        UARTprintf("task_id: tarefa atual: "
                "%d \n", taskCurrent->id);
    #endif

    return taskCurrent->id;                             // Retorna o id da tarefa em execução
}


//==================================================================================
// Encerramento de tarefa

void task_exit (int exitCode)
{
    #if defined (DEBUG)|| defined(DEBUGlite)                                                                    // Msg de debug
        UARTprintf("task_exit: encerramento da tarefa %d "
                "(%s) \n", taskCurrent->id, taskCurrent->name);
    #endif

    ROM_IntMasterDisable();                                                                                     // Desativa as interrupções
    UARTprintf("Task %d exit: execution time %d ms, processor time %d ms, %d activations\n",                    // Impressao dos dados de processamento da tarefa finalizada
               taskCurrent->id, systime(), taskCurrent->pTime, taskCurrent->activations);

    if (taskCurrent->id == DISPATCHER) {                                                                        // Retorno p/ main
        task_switch(taskMain);
    }
    else {                                                                                                      // Retorno p/ dispatcher
        if (taskQueue){
            task_t *taskFinalizada = (task_t *) queue_remove((queue_t **) &taskQueue, (queue_t *) taskCurrent); // --Retira a tarefa a ser finalizadada da fila
            free (taskFinalizada);                                                                              // --Limpa a memoria alocada
        }

        task_switch(&taskDispatcher);
    }
}


//==================================================================================
// Acionamento voluntario do dispatcher

void task_yield ()
{
    #ifdef DEBUG                                                                // Mensagem de debug
        UARTprintf("task_yeld: chamada pela tarefa %d (%s)"
                "\n", taskCurrent->id, taskCurrent->name);
    #endif

    if (taskCurrent->id != MAIN && taskCurrent->id != DISPATCHER){              // Verifica se a task não é main ou dispatcher
        taskCurrent->pTime += (systime() - taskStart_time);                     // -- Atualização do tempo de processamento da task
        queue_append((queue_t **) &taskQueue, (queue_t *) taskCurrent);         // --Envia task p/ final da fila

    }

    task_switch (&taskDispatcher);                                              // Retorna p/ o dispatcher
}


//==================================================================================
// Acionamento por timer do dispatcher
void task_timeOut ()
{
    #if defined (DEBUG)|| defined(DEBUGlite)                                                                // Mensagem de debug
        UARTprintf("\ntask_timeOut: tempo esgotado pela tarefa %d"
                "\n", taskCurrent->id);
    #endif

    if (taskCurrent->type == USER) {                                            // Verifica se a task não é de sistema (incluindo main e dispatcher)
        taskCurrent->pTime += (systime() - taskStart_time);                     // -- Atualização do tempo de processamento da task
        taskCurrent->status = SUSPENDED;                                        // -- Suspende a tarefa
        queue_append((queue_t **) &taskQueue, (queue_t *) taskCurrent);         // -- Envia task p/ final da fila de prontos
        task_switch (&taskDispatcher);                                              // Retorna p/ o dispatcher

    }

}



//==================================================================================
// Definição da prioridade estática de uma tarefa (ou a tarefa atual)

void task_setprio (task_t *task, int prio)
{
    if (task == NULL) task = taskCurrent;                   // Caso não haja parâmetro, a task atual deve ser modificada

    task->sPrio = prio;                                     // Modificação da prioridade estática da task
    task->dPrio = task->sPrio;                              // Modificando a prioridade estática, a dinâmica passa a ser a nova prioridade
}


//==================================================================================
// Consulta da prioridade estática de uma tarefa (ou a tarefa atual)

int task_getprio (task_t *task)
{
    int prio = (task)?  task->sPrio : taskCurrent->sPrio;   // Caso não haja parâmetro, a prioridade da task atual deve ser retornada

    return prio;
}


//==================================================================================
// Inicializacao do Timer 0 (usado para interrupção da preempção)
void Timer_Init(){
    // Debug msg
    #if defined (DEBUG)
        UARTprintf("  Init_Timer--TaskCurrentId: %d\n",taskCurrent->id);
    #endif

    // Enable the peripherals used.
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);

    // Enable processor interrupts.
    //ROM_IntMasterEnable();

    // Configure the 32-bit periodic timer.
    ROM_TimerConfigure(TIMER0_BASE, TIMER_CFG_PERIODIC);
    ROM_TimerLoadSet(TIMER0_BASE, TIMER_A, TEMPOTASK);

    // Setup the interrupts for the timer timeouts.
    ROM_IntEnable(INT_TIMER0A);
    ROM_TimerIntEnable(TIMER0_BASE, TIMER_TIMA_TIMEOUT);

    // Enable the timer.
    ROM_TimerEnable(TIMER0_BASE, TIMER_A);
}


//==================================================================================
// Retorna o relógio atual (em milisegundos)

unsigned int systime ()
{
    unsigned int execution_time = TimerValueGet(TIMER1_BASE, TIMER_A)/(g_ui32SysClock/1000);
    return execution_time;
}


//==================================================================================
// Inicializacao do Timer 1 (contagem de tempo)
void Timer1_Init(){
    ROM_SysCtlPeripheralClockGating(true);
    // Enable the peripherals used.
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER1);

    // Configure 32-bit one-shot timer in count-up mode.
    ROM_TimerConfigure(TIMER1_BASE, TIMER_CFG_ONE_SHOT_UP);
    ROM_TimerLoadSet(TIMER1_BASE, TIMER_A, g_ui32SysClock);

    // Enable the timer.
    ROM_TimerEnable(TIMER1_BASE, TIMER_A);
}
