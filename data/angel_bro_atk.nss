//::///////////////////////////////////////////////
//:: FileName angel_bro_atk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/29/2004 1:01:45 AM
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{

	// Set the faction to hate the player, then attack the player
	AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -100);
	DetermineCombatRound(GetPCSpeaker());
}
