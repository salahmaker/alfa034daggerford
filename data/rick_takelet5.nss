void main()
{
    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "LetterofRequisition");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}

