//::///////////////////////////////////////////////
//:: FileName angel_highrct_ck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:11:35 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Check PC's inventory for Highwaymen's Recruit Pin
    if(!HasItem(GetPCSpeaker(), "HighwaymenRecruitPin"))
        return FALSE;

    return TRUE;
}
