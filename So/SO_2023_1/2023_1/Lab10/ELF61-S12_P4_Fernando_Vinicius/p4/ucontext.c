// #pragma ARM
#include "ucontext.h"
extern int flag;
extern int memPC;
extern set_context_asm(ucontext_t*);
extern get_context_asm (ucontext_t*);

void makecontext(ucontext_t *context, int start_routine, int n_parms, char* parm)
{
	context->func = start_routine;
	context->uc_mcontext.regR0 = parm;
}
void makecontextMain(ucontext_t *context, int start_routine, int n_parms, char* parm)
{
    context->func = start_routine;
    context->initialized = 1;
	context->uc_mcontext.regR0 = parm;

}

int swapcontext(ucontext_t *saida, ucontext_t *entrada)
{
    get_context_asm(saida);
    set_context_asm(entrada);

    return 0;
}
