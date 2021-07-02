#include "NW_I0_GENERIC"
#include "sos_include"
#include "subraces"

int StartingConditional()
{
   if(SOS_GetPersistentInt(GetPCSpeaker(),"milapp_flag") == 1)
      return FALSE;
   return TRUE;
}
