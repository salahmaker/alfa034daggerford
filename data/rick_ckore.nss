#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "ironoresmall") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "ironoremedium") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "ironorelarge") != OBJECT_INVALID)
       return TRUE;



    return FALSE;
}

