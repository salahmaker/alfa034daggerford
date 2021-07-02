#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "SidiciousFangHead") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

