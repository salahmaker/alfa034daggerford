//::///////////////////////////////////////////////
//:: FileName angel_panth_ck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/12/2005 10:40:43 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "BrotherhoodApprenticePin"))
		return FALSE;

	return TRUE;
}
