#include "nw_i0_tool"

int StartingConditional()
{
    object oItemToTake;

    // Make sure the PC speaker has these items in their inventory
    if (GetItemPossessedBy(GetPCSpeaker(), "Militialetterofapplication") != OBJECT_INVALID)
       return TRUE;

    return FALSE;
}
