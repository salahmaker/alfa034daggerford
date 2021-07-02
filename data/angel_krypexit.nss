//::///////////////////////////////////////////////
//:: Name Kryptgarden door Exit s
//:: FileName angel_krypexit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script is used to search through a PC's inventory and have an NPC guard
    speak with them if they have any of the library books.
*/
//:://////////////////////////////////////////////
//:: Created By: Angel_Caller
//:: Created On: November 15, 2004
//:://////////////////////////////////////////////

#include "SOS_include"

void main()
{

   object oNPC = GetObjectByTag("HighwaymensOrderEliteGuard");
   object oPC = GetEnteringObject();
   object oItemToTake = GetFirstItemInInventory(oPC);
   object oStore = GetNearestObjectByTag("WayInnBar", oPC);
   object oDoor = GetNearestObjectByTag("KryptgardenInsideDoor", oNPC);
   location lLoc = GetLocation(GetTransitionTarget(OBJECT_SELF));
   int nBook = FALSE;
   SOS_SetPersistentInt(oPC, "KryptgardeBooks", 0);

   SetLocked(oDoor, FALSE);

   // Check if its a PC
   if(GetIsPC(oPC))
   {
    //Check all inventory items
    while(GetIsObjectValid(oItemToTake))
    {
    //See if the item is a inn key
    if(GetStringLeft(GetTag(oItemToTake),3) == "KL_")
        {
        nBook = TRUE;
        break;
        }
        //Get next item in PC's inventory
        oItemToTake = GetNextItemInInventory(oPC);
    }
    if(nBook == TRUE)
    {
            SOS_SetPersistentInt(oPC, "KryptgardeBooks", 1);
            ActionCloseDoor(oDoor);
            SetLocked(oDoor, TRUE);
            AssignCommand(oPC,ClearAllActions());
            AssignCommand(oNPC,ClearAllActions());
            AssignCommand(oNPC,ActionMoveToObject(oPC));
            AssignCommand(oNPC,ActionStartConversation(oPC));
    }
    else
    {
        SOS_SetPersistentInt(oPC, "KryptgardeBooks", 0);
    }
   }
}
