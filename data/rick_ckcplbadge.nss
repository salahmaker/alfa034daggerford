//::///////////////////////////////////////////////
//:: FileName rick_patrolmancheck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:07:22 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    if (GetItemPossessedBy(GetPCSpeaker(), "DaggerfordMilitiaCorpBadge") != OBJECT_INVALID)
       return TRUE;

    return FALSE;
}
