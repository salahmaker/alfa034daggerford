#include "subraces"

void main()
{
    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "PatrolLog2");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    GiveGoldToCreature(GetPCSpeaker(), 125);
// Commented out because it did not include ECL PCs, replaced with sei_xp function
//    GiveXPToCreature(GetPCSpeaker(), 125);
    XP_RewardXPForQuest(GetPCSpeaker(),2.05);
}
