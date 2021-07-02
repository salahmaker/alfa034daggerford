#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "LetterofTesting1") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

