//::///////////////////////////////////////////////
//:: FileName testchry
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 4/15/2005 2:32:31 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "cherries"))
		return FALSE;
	if(!HasItem(GetPCSpeaker(), "vgs_cherries"))
		return FALSE;

	return TRUE;
}
