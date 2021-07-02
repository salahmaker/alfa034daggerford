#include "subraces"

void main()
{
    object oItem = GetFirstItemInInventory(GetPCSpeaker());
    while(oItem != OBJECT_INVALID)
    {
        if(GetTag(oItem) == "LizardmanHead")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 6)
                GiveXPToCreature(GetPCSpeaker(),25);
            else
                GiveXPToCreature(GetPCSpeaker(),15);
            GiveGoldToCreature(GetPCSpeaker(),15);
        }
        oItem = GetNextItemInInventory(GetPCSpeaker());
    }

}

