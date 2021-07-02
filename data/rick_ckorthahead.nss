#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "OrthanMorgashhead") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

