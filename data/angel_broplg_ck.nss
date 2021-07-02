//::///////////////////////////////////////////////
//:: FileName angel_broplg_ck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:12:40 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Check PC's inventory for Brotherhood Pledge Pin
    if(!HasItem(GetPCSpeaker(), "BrotherhoodPledgePin"))
        return FALSE;

    return TRUE;
}
