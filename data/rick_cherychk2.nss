//::///////////////////////////////////////////////
//:: FileName rick_cherychk2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 4/15/2005 12:33:22 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
   // Make sure the PC speaker has these items in their inventory
   return HasItem(GetPCSpeaker(), "cherries") || HasItem(GetPCSpeaker(), "vgs_cherries");
}

