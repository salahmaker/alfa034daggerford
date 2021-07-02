#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "LetterofTesting5") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

