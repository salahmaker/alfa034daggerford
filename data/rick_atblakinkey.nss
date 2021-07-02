void main()
{
  object oClicker = GetClickingObject();
  object oStore = GetNearestObjectByTag("Blackstone",OBJECT_SELF);
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);

    object oItem = GetFirstItemInInventory(oClicker);
    while(oItem != OBJECT_INVALID)
    {
        if(GetStringLeft(GetTag(oItem),15) == "GrimyBlackstone")
        {
            if(GetItemPossessedBy(oStore,GetTag(oItem)) == OBJECT_INVALID)
                CreateItemOnObject(GetResRef(oItem),oStore);
            DestroyObject(oItem);
        }
        oItem = GetNextItemInInventory(oClicker);
    }
    SetLocalInt(oClicker,"rick_no_sleep_flag",FALSE);
    AssignCommand(oClicker,JumpToLocation(lLoc));
}
