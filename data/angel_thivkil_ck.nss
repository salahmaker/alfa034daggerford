//::///////////////////////////////////////////////
//:: FileName angel_thivkil_ck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:31:03 AM
//:://////////////////////////////////////////////
#include "sos_include"

int StartingConditional()
{

    // Check to see if PC is on Assination Training
    if(SOS_GetPersistentInt(GetPCSpeaker(), "thieves_app_drive") == 3)
        return TRUE;

    return FALSE;
}
