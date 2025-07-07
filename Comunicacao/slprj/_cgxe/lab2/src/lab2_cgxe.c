/* Include files */

#include "lab2_cgxe.h"
#include "m_L9XhrvUWs8N2si7gQnfKwB.h"

unsigned int cgxe_lab2_method_dispatcher(SimStruct* S, int_T method, void* data)
{
  if (ssGetChecksum0(S) == 4142657676 &&
      ssGetChecksum1(S) == 108027688 &&
      ssGetChecksum2(S) == 2478502516 &&
      ssGetChecksum3(S) == 161423857) {
    method_dispatcher_L9XhrvUWs8N2si7gQnfKwB(S, method, data);
    return 1;
  }

  return 0;
}
