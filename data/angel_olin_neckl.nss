//::///////////////////////////////////////////////
//:: FileName angel_olin_neckl
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:48:31 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"
#include "sos_include"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(HasItem(GetPCSpeaker(), "OlinsNecklace"))
        return TRUE;

    return FALSE;
}
