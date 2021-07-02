#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "LetterofTesting3") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

