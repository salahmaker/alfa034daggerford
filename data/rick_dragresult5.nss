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
    SOS_SetPersistentInt(GetPCSpeaker(),"rick_dragontest_allow",2);
    GiveXPToCreature(GetPCSpeaker(),500);
}
