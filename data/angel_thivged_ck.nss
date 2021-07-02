//::///////////////////////////////////////////////
//:: FileName angel_thivged_ck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:31:03 AM
//:://////////////////////////////////////////////
#include "sos_include"

int StartingConditional()
{

    // Check to see if PC is on Greed Training
    if(SOS_GetPersistentInt(GetPCSpeaker(), "thieves_app_drive") == 1)
        return TRUE;

    return FALSE;
}
