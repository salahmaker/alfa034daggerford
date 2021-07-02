//::///////////////////////////////////////////////
//:: General Treasure Spawn Script
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in general purpose treasure, usable
    by all classes.
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   February 26 2001
//:://////////////////////////////////////////////

void main()

{
int iBrother = 0;
object oPC = GetLastOpenedBy();

if (!GetIsPC(oPC)) return;

if (GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC)) == "034_Power_angel")
   iBrother = 1;

if (GetTag(GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC)) == "034_Power_angel")
   iBrother = 1;

if (GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC)) == "034_Assassination_angel")
   iBrother = 1;

if (GetTag(GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC)) == "034_Assassination_angel")
   iBrother = 1;

if (GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC)) == "034_Greed_angel")
   iBrother = 1;

if (GetTag(GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC)) == "034_Greed_angel")
   iBrother = 1;

if (GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC)) == "034_Seduction_angel")
   iBrother = 1;

if (GetTag(GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC)) == "034_Seduction_angel")
   iBrother = 1;

if (iBrother == 0)
    return;

object oTarget;
location lTarget;
oTarget = GetWaypointByTag("WP_Brotherhood");

lTarget = GetLocation(oTarget);

//only do the jump if the location is valid.
//though not flawless, we just check if it is in a valid area.
//the script will stop if the location isn't valid - meaning that
//nothing put after the teleport will fire either.
//the current location won't be stored, either

if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

AssignCommand(oPC, ClearAllActions());

AssignCommand(oPC, ActionJumpToLocation(lTarget));

}
