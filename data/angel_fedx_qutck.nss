//::///////////////////////////////////////////////
//:: FileName angel_fedx_qutck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:31:03 AM
//:://////////////////////////////////////////////
#include "sos_include"
#include "nw_i0_tool"

int StartingConditional()
{

    // Check to see if PC is still on Fedx quest
    if(SOS_GetPersistentInt(GetPCSpeaker(), "thieves_task_quest") == 2)
        return TRUE;

    return FALSE;
}
