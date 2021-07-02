//::///////////////////////////////////////////////
//:: FileName angel_kalvor_hed
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:48:31 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"
#include "sos_include"
int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if((HasItem(GetPCSpeaker(), "kalvorshead")) && (SOS_GetPersistentInt(GetPCSpeaker(), "thieves_task_quest") == 4))
        return TRUE;

    return FALSE;
}
