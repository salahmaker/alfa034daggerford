//:://////////////////////////////////////////////
//:: FileName angel_gunark_vt2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:31:03 AM
//:://////////////////////////////////////////////
#include "sos_include"

int StartingConditional()
{

    // Check to see if this is the PC's first visit
    if(!(SOS_GetPersistentInt(GetPCSpeaker(), "thieves_task_quest") == 0))
        return FALSE;

    return TRUE;
}
