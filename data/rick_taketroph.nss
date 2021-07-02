#include "subraces"

void main()
{
    object oItem = GetFirstItemInInventory(GetPCSpeaker());
    while(oItem != OBJECT_INVALID)
    {
        if(GetTag(oItem) == "duergarbeard")
        {
            DestroyObject(oItem);
            GiveXPToCreature(GetPCSpeaker(),10);
            GiveGoldToCreature(GetPCSpeaker(),5);
        }
        else if(GetTag(oItem) == "orctesticles")
        {
            DestroyObject(oItem);
            GiveXPToCreature(GetPCSpeaker(),10);
            GiveGoldToCreature(GetPCSpeaker(),5);
        }
        else if(GetTag(oItem) == "YuanTitongue")
        {
            DestroyObject(oItem);
            GiveXPToCreature(GetPCSpeaker(),10);
            GiveGoldToCreature(GetPCSpeaker(),5);
        }

        oItem = GetNextItemInInventory(GetPCSpeaker());
    }
}

