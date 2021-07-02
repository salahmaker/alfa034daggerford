#include "nw_i0_tool"
#include "SOS_include"
int StartingConditional()
{
      // Inspect local variables
      if(SOS_GetPersistentInt(GetPCSpeaker(), "unicorncarving1") != 1)
         return TRUE;
   return FALSE;
}
