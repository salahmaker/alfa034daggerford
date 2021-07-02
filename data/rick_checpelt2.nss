#include "SOS_include"

int StartingConditional()
{
    object oItemToTake;

    if (GetItemPossessedBy(GetPCSpeaker(), "BlackBearskin") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "BlackWolfSkin") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "GreyWolfSkin") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "LeopardPelt") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "TimberWolfSkin") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "KodiakGrizzlyBearskin") != OBJECT_INVALID)
       return TRUE;

    return FALSE;
}

