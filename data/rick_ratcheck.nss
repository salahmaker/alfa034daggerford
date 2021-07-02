//::///////////////////////////////////////////////
//:: FileName rick_ratcheck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:07:22 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
    if(GetHitDice(GetPCSpeaker()) > 2)
       return FALSE;

    // Make sure the PC speaker has these items in their inventory
    if( (GetItemPossessedBy(GetPCSpeaker(), "RatCorpse") == OBJECT_INVALID)
       && (GetItemPossessedBy(GetPCSpeaker(), "RatTrap") == OBJECT_INVALID) )
        return FALSE;
    return TRUE;
}
