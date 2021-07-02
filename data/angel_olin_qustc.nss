//::///////////////////////////////////////////////
//:: FileName angel_olin_qustc
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/10/2004 2:05:30 AM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 50);


    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "OlinsNecklace");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}
