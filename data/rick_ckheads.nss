#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "LordBonebreaksSkull") != OBJECT_INVALID)
       return TRUE;


    if (GetItemPossessedBy(GetPCSpeaker(), "GreentoothsHead") != OBJECT_INVALID)
       return TRUE;


    if (GetItemPossessedBy(GetPCSpeaker(), "SlytheHead") != OBJECT_INVALID)
       return TRUE;


    if (GetItemPossessedBy(GetPCSpeaker(), "IronhammersHead") != OBJECT_INVALID)
       return TRUE;

    return FALSE;
}

