//:://////////////////////////////////////////////
//:: FileName angel_tomas_dtck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:31:03 AM
//:://////////////////////////////////////////////
#include "sos_include"

int StartingConditional()
{

    // Check to see if PC is still owns Tomas money
    if(!(SOS_GetPersistentInt(GetPCSpeaker(), "tomas_debt") == 1))
        return FALSE;

    return TRUE;
}
