//::///////////////////////////////////////////////
//:: FileName rick_ironwoodcheck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:07:22 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(GetItemPossessedBy(GetPCSpeaker(), "ironwoodtimber") == OBJECT_INVALID)
       return FALSE;
    return TRUE;
}
