//::///////////////////////////////////////////////
//:: Name Way Inn door Exit s
//:: FileName angel_wayinnexit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script is used to search through a PC's inventory and remove any
    Way Inn room keys he may have on his way out of the inn.
*/
//:://////////////////////////////////////////////
//:: Created By: Angel_Caller
//:: Created On: August 8, 2004
//:://////////////////////////////////////////////

void main()
{
   object oPC = GetEnteringObject();
   object oItemToTake = GetFirstItemInInventory(oPC);
   object oStore = GetNearestObjectByTag("WayInnBar", oPC);
   location lLoc = GetLocation(GetTransitionTarget(OBJECT_SELF));

   // Check if its a PC
   if(GetIsPC(oPC))
   {
    //Check all inventory items
    while(GetIsObjectValid(oItemToTake))
    {
    //See if the item is a inn key
    if(GetStringLeft(GetTag(oItemToTake),10) == "WayInnRoom")
        {
            //Check to see if key is in Store, if not make one
            if(GetItemPossessedBy(oStore,GetTag(oItemToTake)) == OBJECT_INVALID)
                CreateItemOnObject(GetResRef(oItemToTake), oStore);
            // Remove inn key from PC's inventory
            DestroyObject(oItemToTake);
        }
        //Get next item in PC's inventory
        oItemToTake = GetNextItemInInventory(oPC);
    }
    //Set sleep variable to false
    SetLocalInt(oPC,"rick_no_sleep_flag",FALSE);
    //Transition PC outside of inn
    AssignCommand(oPC,JumpToLocation(lLoc));
   }
}
