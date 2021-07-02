//::///////////////////////////////////////////////
//:: FileName angel_gunltr_chk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/29/2004 3:56:06 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"
#include "sos_include"
int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(HasItem(GetPCSpeaker(), "LetterFromG"))
        return TRUE;

    return FALSE;
}
