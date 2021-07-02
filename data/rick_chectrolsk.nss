#include "SOS_include"

int StartingConditional()
{
    object oItemToTake;

    // Make sure the PC speaker has these items in their inventory
    if (GetItemPossessedBy(GetPCSpeaker(), "trollskin001") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

