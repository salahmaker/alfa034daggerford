#include "SOS_include"

int StartingConditional()
{
    //Check for MOT Guard badges.
    if (GetItemPossessedBy(GetPCSpeaker(), "034_MosqueofTyrGuardBadgeofHonor") != OBJECT_INVALID)
       if(SOS_GetPersistentInt(GetPCSpeaker(), "ballista1_level_1") == 0)
          return TRUE;
    return FALSE;
}

