#include "subraces"

void main()
{
    object oItem = GetFirstItemInInventory(GetPCSpeaker());
    while(oItem != OBJECT_INVALID)
    {
        if(GetTag(oItem) == "034_LesserSymbolBane")
        {
            DestroyObject(oItem);
            XP_RewardXP( GetPCSpeaker(), 20 );
            //if(GetHitDice(GetPCSpeaker()) < 20)
             //   XP_RewardXPForQuest(GetPCSpeaker(),0.09);
            //else
             //   XP_RewardXPForQuest(GetPCSpeaker(),0.07);

        }
        else if(GetTag(oItem) == "034_SymbolBane")
        {
            DestroyObject(oItem);
            XP_RewardXP( GetPCSpeaker(), 25 );
            //DestroyObject(oItem);
            //if(GetHitDice(GetPCSpeaker()) < 20)
            //    XP_RewardXPForQuest(GetPCSpeaker(),0.04);
            //else
            //    XP_RewardXPForQuest(GetPCSpeaker(),0.05);
        }
        else if(GetTag(oItem) == "034_GreaterSymbolBane")
        {
            DestroyObject(oItem);
            XP_RewardXP( GetPCSpeaker(), 30 );
            //if(GetHitDice(GetPCSpeaker()) < 20)
            //    XP_RewardXPForQuest(GetPCSpeaker(),0.3);
            //else
            //    XP_RewardXPForQuest(GetPCSpeaker(),0.1);

        }
        oItem = GetNextItemInInventory(GetPCSpeaker());
    }
}

