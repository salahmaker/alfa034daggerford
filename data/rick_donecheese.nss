//::///////////////////////////////////////////////
//:: FileName rick_givepatrolman
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
// Commented out because it did not include ECL PCs, replaced with sei_xp function
//    GiveXPToCreature(GetPCSpeaker(),40);
    XP_RewardXPForQuest(GetPCSpeaker(),0.65);
    GiveGoldToCreature(GetPCSpeaker(),30);
    SOS_SetPersistentInt(GetPCSpeaker(),"cheesebox_level_1",3);


}
