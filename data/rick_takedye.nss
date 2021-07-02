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
    SOS_SetPersistentInt(GetPCSpeaker(), "farrel_quest_level_1", 2);

    // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 25);
// Commented out because it did not include ECL PCs, replaced with sei_xp function
//    GiveXPToCreature(GetPCSpeaker(), 20);
    XP_RewardXPForQuest(GetPCSpeaker(),0.33);
    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "golddye");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}
