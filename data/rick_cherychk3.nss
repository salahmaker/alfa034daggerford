//::///////////////////////////////////////////////
//:: FileName rick_cherychk3
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 4/15/2005 2:38:49 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "vgs_cherries"))
		return FALSE;

	return TRUE;
}