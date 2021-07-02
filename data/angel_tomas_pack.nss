//::///////////////////////////////////////////////
//:: FileName angel_tomas_pack
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/9/2004 1:36:16 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"
#include "sos_include"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if((HasItem(GetPCSpeaker(), "ThePackage")) &&(SOS_GetPersistentInt(GetPCSpeaker(), "thieves_task_quest") == 3))
        return TRUE;

    return FALSE;
}
