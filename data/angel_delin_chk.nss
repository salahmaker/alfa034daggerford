//::///////////////////////////////////////////////
//:: FileName angel_delin_chk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/17/2004 12:57:48 AM
//:://////////////////////////////////////////////
#include "sos_include"

int StartingConditional()
{

    // Restrict based on the player's class
    int iPassed = 0;
    if(GetLevelByClass(CLASS_TYPE_ROGUE, GetPCSpeaker()) >= 1 && SOS_GetPersistentInt(GetPCSpeaker(), "Dlg_Init_" + GetTag(OBJECT_SELF)) == FALSE)
        iPassed = 1;
    if(iPassed == 0)
        return FALSE;

    return TRUE;
}
