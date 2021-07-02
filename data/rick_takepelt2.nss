void main()
{
    object oItem = GetFirstItemInInventory(GetPCSpeaker());
    while(oItem != OBJECT_INVALID)
    {
        if(GetTag(oItem) == "blackbearskin")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 5)
                GiveXPToCreature(GetPCSpeaker(),100);
            else
              GiveXPToCreature(GetPCSpeaker(),40);
            GiveGoldToCreature(GetPCSpeaker(),15);
        }
        else if(GetTag(oItem) == "blackwolfskin")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 6)
                GiveXPToCreature(GetPCSpeaker(),40);
            else
               GiveXPToCreature(GetPCSpeaker(),20);
            GiveGoldToCreature(GetPCSpeaker(),25);
        }
        else if(GetTag(oItem) == "greywolfskin")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 4)
                GiveXPToCreature(GetPCSpeaker(),25);
            else
               GiveXPToCreature(GetPCSpeaker(),15);
            GiveGoldToCreature(GetPCSpeaker(),15);
        }
        else if(GetTag(oItem) == "leopardpelt")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 6)
                GiveXPToCreature(GetPCSpeaker(),50);
            else
               GiveXPToCreature(GetPCSpeaker(),15);
            GiveGoldToCreature(GetPCSpeaker(),250);
        }
        else if(GetTag(oItem) == "timberwolfskin")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 5)
                GiveXPToCreature(GetPCSpeaker(),25);
            else
               GiveXPToCreature(GetPCSpeaker(),15);
            GiveGoldToCreature(GetPCSpeaker(),15);
        }
        else if(GetTag(oItem) == "kodiakgrizzpelt")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 7)
                GiveXPToCreature(GetPCSpeaker(),150);
            else
               GiveXPToCreature(GetPCSpeaker(),75);
            GiveGoldToCreature(GetPCSpeaker(),230);
        }
        oItem = GetNextItemInInventory(GetPCSpeaker());
    }

}

