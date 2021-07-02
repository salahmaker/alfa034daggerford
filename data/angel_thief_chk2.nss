//::///////////////////////////////////////////////
//:: FileName angel_thief_chk2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/25/2004 12:51:08 AM
//:://////////////////////////////////////////////
#include "sos_include"

int StartingConditional()
{

    // Inspect local variables
    if(SOS_GetPersistentInt(GetPCSpeaker(), "Thief_Guild_Pledge") == 1)
        return TRUE;

    return FALSE;
}
