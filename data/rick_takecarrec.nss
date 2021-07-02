//::///////////////////////////////////////////////
//:: FileName rick_takedye
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:10:53 PM
//:://////////////////////////////////////////////

#include "SOS_include"
#include "subraces"

void main()
{
    SOS_SetPersistentInt(GetPCSpeaker(), "caravan_order_level_1", 3);

    // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 20);
// Commented out because it did not include ECL PCs, replaced with sei_xp function
//    GiveXPToCreature(GetPCSpeaker(), 40);
    XP_RewardXPForQuest(GetPCSpeaker(),0.5);
    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "CircleofAxesLetterofReceipt");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}
