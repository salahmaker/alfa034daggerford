#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "LetterofTesting4a") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

