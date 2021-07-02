#include "subraces"

void main()
{
    object oItem = GetFirstItemInInventory(GetPCSpeaker());
    while(oItem != OBJECT_INVALID)
    {
        if(GetTag(oItem) == "ironoresmall")
        {
            DestroyObject(oItem);
            GiveXPToCreature(GetPCSpeaker(),10);
            GiveGoldToCreature(GetPCSpeaker(),5);
        }
        else if(GetTag(oItem) == "ironoremedium")
        {
            DestroyObject(oItem);
            GiveXPToCreature(GetPCSpeaker(),10);
            GiveGoldToCreature(GetPCSpeaker(),15);
        }
        else if(GetTag(oItem) == "ironorelarge")
        {
            DestroyObject(oItem);
            GiveXPToCreature(GetPCSpeaker(),10);
            GiveGoldToCreature(GetPCSpeaker(),25);
        }

        oItem = GetNextItemInInventory(GetPCSpeaker());
    }
}

