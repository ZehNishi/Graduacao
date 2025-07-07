#include "queue.h"
void UARTprintf(const char *pcString, ...);

void queue_append (queue_t **queue, queue_t *elem)
{
    if(queue == NULL) // A fila deve existir
            {
                //printf("Fila nao existe\n");
                UARTprintf("Fila nao existe\n");
                return;
            }
            else if(elem == NULL) // O elemento deve existir
            {
                //printf("Elemento nao existe\n");
                UARTprintf("Elemento nao existe\n");
                return;
            }
            else if(elem->next != NULL || elem->prev != NULL) // O elemento n�o deve estar em outra fila
            {
                //printf("Elemento esta em outra fila\n");
                UARTprintf("Elemento esta em outra fila\n");
                return;
            }
            if(!(*queue)) //fila vazia
            {
                *queue = elem;
                (*queue)->next = *queue;
                (*queue)->prev = *queue;
                return;
            }
            queue_t *aux;
            aux = (*queue)->prev;
            aux->next = elem;
            elem->prev = aux;
            elem->next = (*queue);
            (*queue)->prev = elem;

            return;
}
//------------------------------------------------------------------------------
// Remove o elemento indicado da fila, sem o destruir.
// Condicoes a verificar, gerando msgs de erro:
// - a fila deve existir
// - a fila nao deve estar vazia
// - o elemento deve existir
// - o elemento deve pertencer a fila indicada
// Retorno: apontador para o elemento removido, ou NULL se erro

queue_t *queue_remove (queue_t **queue, queue_t *elem)
{
    if(queue == NULL) // A fila deve existir
            {
                //printf("Fila nao existe\n");
                UARTprintf("Fila nao existe\n");
                return NULL;
            }
            else if(!(*queue)) //A fila n�o deve estar vazia
            {
                //printf("Fila vazia");
                UARTprintf("Fila vazia\n");
                return NULL;
            }
            else if(elem == NULL) // O elemento deve existir
            {
                //printf("Elemento nao existe\n");
                UARTprintf("Elemento nao existe\n");
                return NULL;
            }
            queue_t *aux, *aux2;
            aux = (*queue);
            if(aux == elem) // Elemento a ser removido � o primeiro
            {
                if(aux->next == aux || aux->prev == aux) //Fila com um s� elemento
                {
                    elem->next = NULL;
                    elem->prev = NULL;
                    *queue = NULL; //Limpa a lista
                    return elem;
                }
                else
                {
                    aux2 = aux->next;
                    aux = aux->prev;
                    (*queue) = aux2;
                    (*queue)->prev = aux;
                    aux->next = (*queue);
                    elem->next = NULL;
                    elem->prev = NULL;
                    return elem;
                }
            }
            aux = (*queue)->next;
            while(aux != (*queue))
            {
                if(aux == elem) // Encontrou o elemento a ser removido
                {
                    aux = elem->next;
                    aux->prev = elem->prev;
                    aux->prev->next=aux;
                    elem->next = NULL;
                    elem->prev = NULL;
                    return elem;
                }
                if (aux == (*queue)){ //Elemento n�o est� na lista
                    //printf("O elemento n�o est� na lista/n");
                    UARTprintf("O elemento n�o est� na lista\n");
                    return NULL;
                }

                aux = aux->next;
            }
            return NULL;
}

//------------------------------------------------------------------------------
// Conta o numero de elementos na fila
// Retorno: numero de elementos na fila

int queue_size (queue_t *queue)
{
    queue_t *aux;
            int count=1;
            aux = queue;
            if(!queue)
                return 0;
            aux = aux->next;
            while(aux != queue)
            {
                aux = aux->next;
                count++;
            }
            return count;
}

//------------------------------------------------------------------------------
// Percorre a fila e imprime na tela seu conte�do. A impress�o de cada
// elemento � feita por uma fun��o externa, definida pelo programa que
// usa a biblioteca.
//
// Essa fun��o deve ter o seguinte prot�tipo:
//
// void print_elem (void *ptr) ; // ptr aponta para o elemento a imprimir

void queue_print (char *name, queue_t *queue, void print_elem (void*) )
{
    //printf(name);
        UARTprintf(name);
            if (queue != NULL)
            {
                queue_t *aux = queue;
                do {
                    print_elem (aux);
                    //printf(" ");
                    UARTprintf(" ");
                    aux = aux->next;
                } while (aux!=queue);
            }
            //printf("\n");
            UARTprintf("\n");
            return;
}
