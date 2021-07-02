//::///////////////////////////////////////////////
//:: FileName angel_fedx_qt2ck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:31:03 AM
//:://////////////////////////////////////////////
#include "sos_include"

int StartingConditional()
{

    // Check to see if PC is still on Fedx quest part 2
    if(!(SOS_GetPersistentInt(GetPCSpeaker(), "thieves_task_quest") == 3))
        return FALSE;

    return TRUE;
}
