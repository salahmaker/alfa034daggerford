#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "oldnoblefamilysignetpendant") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "oldnoblefamilysignetring") != OBJECT_INVALID)
       return TRUE;


    return FALSE;
}

