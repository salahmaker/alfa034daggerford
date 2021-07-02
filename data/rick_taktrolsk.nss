#include "subraces"

void main()
{
    object oItem = GetFirstItemInInventory(GetPCSpeaker());
    while(oItem != OBJECT_INVALID)
    {
        if(GetTag(oItem) == "trollskin001")
        {
            DestroyObject(oItem);
            GiveGoldToCreature(GetPCSpeaker(),100);
            iveXPToCreature(GetPCSpeaker(),100);
        }

        oItem = GetNextItemInInventory(GetPCSpeaker());
    }
}

