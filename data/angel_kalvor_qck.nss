//::///////////////////////////////////////////////
//:: FileName angel_kalvor_qck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:31:03 AM
//:://////////////////////////////////////////////
#include "sos_include"

int StartingConditional()
{

    // Check to see if PC is still on Kal'vor quest
    if(!(SOS_GetPersistentInt(GetPCSpeaker(), "thieves_task_quest") == 4))
        return FALSE;

    return TRUE;
}
