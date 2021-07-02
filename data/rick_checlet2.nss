#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "LetterofTesting2") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

