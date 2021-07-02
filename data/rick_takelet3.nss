void main()
{
    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "LetterofTesting3");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}

