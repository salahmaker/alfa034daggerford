#include "subraces"

void main()
{
    object oItem = GetFirstItemInInventory(GetPCSpeaker());
    while(oItem != OBJECT_INVALID)
    {
        if(GetTag(oItem) == "cherries")
        {
            GiveXPToCreature(GetPCSpeaker(),1);
            GiveGoldToCreature(GetPCSpeaker(), 1);
            DestroyObject(oItem);
        }
        if(GetTag(oItem) == "vgs_cherries")
        {
            GiveXPToCreature(GetPCSpeaker(),1);
            GiveGoldToCreature(GetPCSpeaker(), 1);
            DestroyObject(oItem);
        }
        oItem = GetNextItemInInventory(GetPCSpeaker());
    }
}

