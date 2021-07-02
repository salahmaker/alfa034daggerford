//::///////////////////////////////////////////////
//:: FileName angel_dante_job2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:31:03 AM
//:://////////////////////////////////////////////
#include "sos_include"

int StartingConditional()
{

    // Inspect local variables
    if(!(SOS_GetPersistentInt(GetPCSpeaker(), "thieves_task_quest") == 2))
        return FALSE;

    return TRUE;
}
