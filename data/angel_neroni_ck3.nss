//::///////////////////////////////////////////////
//:: FileName angel_neroni_ck3
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/20/2004 4:09:55 AM
//:://////////////////////////////////////////////
#include "sos_include"
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "LetterToDante"))
        return FALSE;

    // Inspect local variables
    if(!(SOS_GetPersistentInt(GetPCSpeaker(), "Neroni_Checkpoint") == 1))
        return FALSE;

    return TRUE;
}
