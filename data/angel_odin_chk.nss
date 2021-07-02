//::///////////////////////////////////////////////
//:: FileName angel_odin_chk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/29/2004 11:31:01 PM
//:://////////////////////////////////////////////
#include "sos_include"

int StartingConditional()
{

    // Inspect local variables
    if(!(SOS_GetPersistentInt(GetPCSpeaker(), "Thief_Guild_Pledge") == 1))
        return FALSE;

    return TRUE;
}
