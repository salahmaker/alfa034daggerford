//::///////////////////////////////////////////////
//:: FileName angel_dante_ltr2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/30/2004 12:52:58 AM
//:://////////////////////////////////////////////
void main()
{

    // Remove 'Letter to Dante' from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "LetterToDante");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}
