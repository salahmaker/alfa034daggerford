//::///////////////////////////////////////////////
//:: FileName angel_hgwltr_chk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/7/2004 2:09:56 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "LetterToDante"))
		return FALSE;

	return TRUE;
}
