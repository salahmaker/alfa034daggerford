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
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "MackKippersHead");
    if(GetIsObjectValid(oItemToTake) != 0)
    {
        DestroyObject(oItemToTake);
// Commented out because it did not include ECL PCs, replaced with sei_xp function
//      GiveXPToCreature(GetPCSpeaker(),200);
        XP_RewardXPForQuest(GetPCSpeaker(),3.3);
        GiveGoldToCreature(GetPCSpeaker(),250);
        SOS_SetPersistentInt(GetPCSpeaker(),"mack_level_1",2);

    }
}
