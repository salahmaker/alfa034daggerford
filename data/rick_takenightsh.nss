//::///////////////////////////////////////////////
//:: FileName rick_takedye
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:10:53 PM
//:://////////////////////////////////////////////

#include "SOS_include"
#include "subraces"

void main()
{
    SOS_SetPersistentInt(GetPCSpeaker(), "nightshade_level_1", 2);

    // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 75);
    GiveXPToCreature(GetPCSpeaker(), 75);

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "cereusspines");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    CreateItemOnObject("delfentowerkey",GetPCSpeaker());

}
