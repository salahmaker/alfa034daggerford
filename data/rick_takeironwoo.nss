#include "subraces"

void main()
{
    object oItem = GetFirstItemInInventory(GetPCSpeaker());
    while(oItem != OBJECT_INVALID)
    {
        if(GetTag(oItem) == "ironwoodtimber")
        {
            DestroyObject(oItem);
            XP_RewardXPForQuest(GetPCSpeaker(),0.13);
            GiveGoldToCreature(GetPCSpeaker(), 10);
        }
        oItem = GetNextItemInInventory(GetPCSpeaker());
    }
}

