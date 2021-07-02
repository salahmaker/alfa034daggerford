//::///////////////////////////////////////////////
//:: FileName angel_kalvor_hdr
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/10/2004 2:01:53 AM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 80);


    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "kalvorshead");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}
