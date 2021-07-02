#include "SOS_include"

int StartingConditional()
{
    object oItemToTake;

    // Make sure the PC speaker has these items in their inventory
    if (GetItemPossessedBy(GetPCSpeaker(), "AlbinoBuckskin") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "BlackBearskin") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "BlackWolfSkin") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "BlueDiamondBackSkin") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "CougarPelt") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "GreyWolfSkin") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "LeopardPelt") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "LionPelt") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "TimberWolfSkin") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "WhiteTailDeerSkin") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "KodiakGrizzlyBearskin") != OBJECT_INVALID)
       return TRUE;

    return FALSE;
}

