//::///////////////////////////////////////////////
//:: FileName angel_bromgr_chk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/29/2004 12:44:35 PM
//:://////////////////////////////////////////////
/* Check to see if Character needs Message from Gunark (Thieves' Brotherhood)
*/
#include "sos_include"

int StartingConditional()
{

    // Check PC and see if they are Thieves' guild ready
    if(GetName(GetPCSpeaker()) == "Marshall Quickfingers")
    {
    if(SOS_GetPersistentInt(GetEnteringObject(), "thieves_task_quest") == 5)
            return TRUE;
    }
    return FALSE;
}
