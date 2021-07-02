#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "orctesticles001") != OBJECT_INVALID)
       return TRUE;


      if (GetItemPossessedBy(GetPCSpeaker(), "duergarbeard") != OBJECT_INVALID)
       return TRUE;


          if (GetItemPossessedBy(GetPCSpeaker(), "item099") != OBJECT_INVALID)
       return TRUE;


    return FALSE;
}

