//::///////////////////////////////////////////////
//:: FileName angel_olin_chk3
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:12:40 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "BrotherhoodPledgePin"))
		return FALSE;

	return TRUE;
}
