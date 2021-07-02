//::///////////////////////////////////////////////
//:: FileName angel_higwymn_ck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/22/2004 1:42:50 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "HighwaymenPin"))
		return FALSE;

	return TRUE;
}
