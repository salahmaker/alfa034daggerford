#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "LetterofTesting6") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

