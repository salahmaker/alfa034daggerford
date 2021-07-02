//::///////////////////////////////////////////////
//:: Default On Heartbeat
//:: NW_C2_DEFAULT1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will have people perform default
    animations.
*/
//:://////////////////////////////////////////////
//:: Created By: Richard Johnson
//:: Created On: Jan 23, 2006
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
void main()
{
   object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF);
   if((oPC != OBJECT_INVALID) && GetObjectSeen(oPC) && (GetTag(GetItemInSlot(INVENTORY_SLOT_NECK, oPC)) != "TiamatHolySymbol") )
    {
       ClearAllActions();
       ActionForceMoveToObject(oPC,TRUE);
    }
}
