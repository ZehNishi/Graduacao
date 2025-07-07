/* Include files */

#include "carriersymbolsync_cgxe.h"
#include "m_I8HkJpzap0JY48PC2Uzg4.h"

unsigned int cgxe_carriersymbolsync_method_dispatcher(SimStruct* S, int_T method,
  void* data)
{
  if (ssGetChecksum0(S) == 2027781216 &&
      ssGetChecksum1(S) == 3512925635 &&
      ssGetChecksum2(S) == 4231772426 &&
      ssGetChecksum3(S) == 3483883842) {
    method_dispatcher_I8HkJpzap0JY48PC2Uzg4(S, method, data);
    return 1;
  }

  return 0;
}
