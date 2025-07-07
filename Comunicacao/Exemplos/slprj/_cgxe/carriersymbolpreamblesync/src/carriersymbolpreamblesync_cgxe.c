/* Include files */

#include "carriersymbolpreamblesync_cgxe.h"
#include "m_fDtvgy2AehP9SrfQF6xUkB.h"

unsigned int cgxe_carriersymbolpreamblesync_method_dispatcher(SimStruct* S,
  int_T method, void* data)
{
  if (ssGetChecksum0(S) == 3507868153 &&
      ssGetChecksum1(S) == 164794618 &&
      ssGetChecksum2(S) == 2946253396 &&
      ssGetChecksum3(S) == 2308215579) {
    method_dispatcher_fDtvgy2AehP9SrfQF6xUkB(S, method, data);
    return 1;
  }

  return 0;
}
