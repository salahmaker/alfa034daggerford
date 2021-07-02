#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "MackKippersHead") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

