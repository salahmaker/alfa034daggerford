#include "NW_I0_GENERIC"
#include "sos_include"
#include "subraces"

int StartingConditional()
{
   if(SOS_GetPersistentInt(GetPCSpeaker(),"rick_dragontest_allow") == 2)
      return TRUE;
   return FALSE;
}
