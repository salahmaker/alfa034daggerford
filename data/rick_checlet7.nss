#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "LetterofRequisition") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

