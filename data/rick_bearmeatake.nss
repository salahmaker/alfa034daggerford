//::///////////////////////////////////////////////
//:: FileName rick_bearmeattake
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:10:53 PM
//:://////////////////////////////////////////////

#include "subraces"

void main()
{
    // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 50);

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "BearMeat");
    if(GetIsObjectValid(oItemToTake) != 0)
    {
        DestroyObject(oItemToTake);
//        GiveXPToCreature(GetPCSpeaker(),30);
    }
}
