//::///////////////////////////////////////////////
//:: FileName rick_militiaapp
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:10:53 PM
//:://////////////////////////////////////////////

#include "nw_i0_tool"
#include "subraces"
#include "sos_include"

void main()
{
    // Give the speaker a militia note
    CreateItemOnObject("daggerfordmil024", GetPCSpeaker(), 1);
    SOS_SetPersistentInt(GetPCSpeaker(),"milapp_flag",1);
}
