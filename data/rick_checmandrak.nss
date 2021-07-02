#include "nw_i0_tool"

int StartingConditional()
{
    object oItemToTake;

    // Make sure the PC speaker has these items in their inventory
    if (GetItemPossessedBy(GetPCSpeaker(), "vgs_mandraroot") != OBJECT_INVALID)
       return TRUE;

    return FALSE;


}
