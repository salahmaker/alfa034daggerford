//::///////////////////////////////////////////////
//:: FileName rick_test5
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/26/2004 2:46:11 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "letteroftesting5"))
		return FALSE;

	return TRUE;
}