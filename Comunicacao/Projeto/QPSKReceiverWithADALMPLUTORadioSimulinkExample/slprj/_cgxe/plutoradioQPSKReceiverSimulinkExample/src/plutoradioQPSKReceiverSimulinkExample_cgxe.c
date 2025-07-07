/* Include files */

#include "plutoradioQPSKReceiverSimulinkExample_cgxe.h"
#include "m_eUHePDy2hsu2cPeKv5k5SC.h"

unsigned int cgxe_plutoradioQPSKReceiverSimulinkExample_method_dispatcher
  (SimStruct* S, int_T method, void* data)
{
  if (ssGetChecksum0(S) == 2251206492 &&
      ssGetChecksum1(S) == 888028987 &&
      ssGetChecksum2(S) == 2938239647 &&
      ssGetChecksum3(S) == 3557308023) {
    method_dispatcher_eUHePDy2hsu2cPeKv5k5SC(S, method, data);
    return 1;
  }

  return 0;
}
