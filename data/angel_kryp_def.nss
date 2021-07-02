//::///////////////////////////////////////////////
//:: FileName angel_kryp_def
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/16/2004 1:08:35 PM
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{

	// Set the faction to hate the player, then attack the player
	AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -100);
	DetermineCombatRound(GetPCSpeaker());
}
