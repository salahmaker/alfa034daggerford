//::///////////////////////////////////////////////
//:: FileName cmk_watch_body
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:09:12 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!CheckPartyForItem(GetPCSpeaker(), "RatCorpse"))
        return FALSE;

    return TRUE;
}
