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

    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "OrthanMorgashhead");
    if(GetIsObjectValid(oItemToTake) != 0)
    {
        DestroyObject(oItemToTake);
// Commented out because it did not include ECL PCs, replaced with sei_xp function
//        GiveXPToCreature(GetPCSpeaker(),100);
        XP_RewardXPForQuest(GetPCSpeaker(),1.65);
        GiveGoldToCreature(GetPCSpeaker(),100);
        SOS_SetPersistentInt(GetPCSpeaker(),"orthan_level_1",2);

    }
}
