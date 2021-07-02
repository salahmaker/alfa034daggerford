#include "SOS_include"
void main()
{
    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "BallistaBoltQuarrel");
    if(GetIsObjectValid(oItemToTake) != 0)
    {
        DestroyObject(oItemToTake);
        GiveXPToCreature(GetPCSpeaker(),25);
        GiveGoldToCreature(GetPCSpeaker(),10);
        SOS_SetPersistentInt(GetPCSpeaker(),"ballista2_level_1",2);
    }
}

