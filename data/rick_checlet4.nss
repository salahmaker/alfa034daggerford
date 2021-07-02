#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "LetterofTesting4") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

