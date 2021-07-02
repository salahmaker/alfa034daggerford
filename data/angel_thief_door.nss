//::///////////////////////////////////////////////
//:: Name
//:: FileName angel_thief_door
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Angel_Caller
//:: Created On: 6/25/2004 12:34:50 AM
//:://////////////////////////////////////////////
#include "sos_include"
#include "nw_i0_tool"

void main()
{
  object oPC = GetClickingObject();

  if (!GetIsPC(oPC)) return;

  if (SOS_GetPersistentInt(oPC, "Thief_Guild_Pledge") == 1)
  {
    ActionStartConversation(oPC, "", TRUE);
  }
  if((HasItem(oPC, "BrotherhoodPledgePin")) && (GetLevelByClass(CLASS_TYPE_ROGUE, GetClickingObject()) >= 1))
  {
    ActionStartConversation(oPC, "", TRUE);
  }
}
