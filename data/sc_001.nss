//::///////////////////////////////////////////////
//:: FileName sc_001
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/16/2004 2:30:35 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "quest") != 0))
		return FALSE;

	return TRUE;
}
