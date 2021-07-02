#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "FentonMardysHead") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

