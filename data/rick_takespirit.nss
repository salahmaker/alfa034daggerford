#include "subraces"

void main()
{
    object oItem = GetFirstItemInInventory(GetPCSpeaker());
    while(oItem != OBJECT_INVALID)
    {
        if(GetTag(oItem) == "LessLathSpirit")
        {
            DestroyObject(oItem);
// Commented out because it did not include ECL PCs, replaced with sei_xp function
//            if(GetHitDice(GetPCSpeaker()) < 3)
//                GiveXPToCreature(GetPCSpeaker(),20);
//            else
//                GiveXPToCreature(GetPCSpeaker(),5);
        XP_RewardXPForQuest(GetPCSpeaker(),0.1);
        }
        else if(GetTag(oItem) == "LathSpirit")
        {
            DestroyObject(oItem);
// Commented out because it did not include ECL PCs, replaced with sei_xp function
//            if(GetHitDice(GetPCSpeaker()) < 3)
//                GiveXPToCreature(GetPCSpeaker(),30);
//            else
//              GiveXPToCreature(GetPCSpeaker(),10);
        XP_RewardXPForQuest(GetPCSpeaker(),0.18);
        }
        else if(GetTag(oItem) == "GreatLathSpirit")
        {
            DestroyObject(oItem);
// Commented out because it did not include ECL PCs, replaced with sei_xp function
//            if(GetHitDice(GetPCSpeaker()) < 3)
//                GiveXPToCreature(GetPCSpeaker(),50);
//            else
//               GiveXPToCreature(GetPCSpeaker(),15);
        XP_RewardXPForQuest(GetPCSpeaker(),0.25);
        }
        oItem = GetNextItemInInventory(GetPCSpeaker());
    }
}

