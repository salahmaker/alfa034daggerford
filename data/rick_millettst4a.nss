//::///////////////////////////////////////////////
//:: FileName rick_milletteroftesting
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:10:53 PM
//:://////////////////////////////////////////////

#include "nw_i0_tool"
#include "sos_include"
#include "subraces"

void main()
{
    // Give the speaker a militia note
    CreateItemOnObject("letteroftesting4", GetPCSpeaker(), 1);
    SOS_SetPersistentInt(GetPCSpeaker(),"rick_militiatest_allow",3);
    GiveXPToCreature(GetPCSpeaker(),100);
}
