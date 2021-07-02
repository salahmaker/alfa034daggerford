//::///////////////////////////////////////////////
//:: FileName angel_thief_chk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/25/2004 12:48:22 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(HasItem(GetPCSpeaker(), "BrotherhoodPledgePin"))
        return TRUE;

    return FALSE;
}
