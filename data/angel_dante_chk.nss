//::///////////////////////////////////////////////
//:: FileName angel_dante_chk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/22/2004 1:37:36 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "LetterToDante"))
        return FALSE;

    return TRUE;
}
