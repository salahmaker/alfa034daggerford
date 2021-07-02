#include "nw_i0_tool"
#include "SOS_include"
int StartingConditional()
{
   // Make sure the PC speaker has these items in their inventory
   if (GetItemPossessedBy(GetPCSpeaker(), "BallistaBoltQuarrel") != OBJECT_INVALID)
      // Inspect local variables
      if(SOS_GetPersistentInt(GetPCSpeaker(), "ballista2_level_1") == 1)
         return TRUE;
   return FALSE;
}
