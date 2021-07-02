#include "nw_i0_tool"
#include "SOS_include"
int StartingConditional()
{
   if(SOS_GetPersistentInt(GetPCSpeaker(), "ElixirofLove1") != 1)
         return TRUE;
   return FALSE;
}
