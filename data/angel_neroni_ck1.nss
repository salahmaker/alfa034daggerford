//::///////////////////////////////////////////////
//:: FileName angel_neroni_ck1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/17/2004 3:01:47 AM
//:://////////////////////////////////////////////
#include "sos_include"

int StartingConditional()
{

    // Inspect local variables
    if(!(SOS_GetPersistentInt(GetPCSpeaker(), "Thief_Guild_Patsy") == 1))
        return FALSE;

    return TRUE;
}
