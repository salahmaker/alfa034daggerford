//::///////////////////////////////////////////////
//:: FileName angel_ctoken_chk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/21/2005 2:33:42 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "Caravantoken"))
		return FALSE;

	return TRUE;
}
