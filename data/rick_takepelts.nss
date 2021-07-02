#include "subraces"

void main()
{
    object oItem = GetFirstItemInInventory(GetPCSpeaker());
    while(oItem != OBJECT_INVALID)
    {
        if(GetTag(oItem) == "AlbinoBuckskin")
        {
            DestroyObject(oItem);
            GiveGoldToCreature(GetPCSpeaker(),100);
        }
        else if(GetTag(oItem) == "BlackBearskin")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 8)
               GiveXPToCreature(GetPCSpeaker(),15);
            GiveGoldToCreature(GetPCSpeaker(),25);
        }
        else if(GetTag(oItem) == "BlackWolfSkin")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 8)
               GiveXPToCreature(GetPCSpeaker(),5);
            GiveGoldToCreature(GetPCSpeaker(),25);
        }
        else if(GetTag(oItem) == "BlueDiamondBackSkin")
        {
            DestroyObject(oItem);
             if(GetHitDice(GetPCSpeaker()) < 8)
               GiveXPToCreature(GetPCSpeaker(),15);
            GiveGoldToCreature(GetPCSpeaker(),60);
        }
        else if(GetTag(oItem) == "CougarPelt")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 8)
               GiveXPToCreature(GetPCSpeaker(),15);
            GiveGoldToCreature(GetPCSpeaker(),20);
        }
        else if(GetTag(oItem) == "GreyWolfSkin")
        {
            DestroyObject(oItem);
             if(GetHitDice(GetPCSpeaker()) < 8)
               GiveXPToCreature(GetPCSpeaker(),10);
            GiveGoldToCreature(GetPCSpeaker(),10);
        }
        else if(GetTag(oItem) == "LeopardPelt")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 8)
               GiveXPToCreature(GetPCSpeaker(),25);
            GiveGoldToCreature(GetPCSpeaker(),150);
        }
        else if(GetTag(oItem) == "LionPelt")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 8)
               GiveXPToCreature(GetPCSpeaker(),25);
            GiveGoldToCreature(GetPCSpeaker(),25);
        }
        else if(GetTag(oItem) == "TimberWolfSkin")
        {
            DestroyObject(oItem);
            GiveGoldToCreature(GetPCSpeaker(),5);
        }
        else if(GetTag(oItem) == "WhiteTailDeerSkin")
        {
            DestroyObject(oItem);
            GiveGoldToCreature(GetPCSpeaker(),1);
        }
        else if(GetTag(oItem) == "KodiakGrizzlyBearskin")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 8)
               GiveXPToCreature(GetPCSpeaker(),25);
            GiveGoldToCreature(GetPCSpeaker(),50);
        }
        oItem = GetNextItemInInventory(GetPCSpeaker());
    }
}

