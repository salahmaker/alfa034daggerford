//::///////////////////////////////////////////////
//:: FileName angel_fedx_qustc
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/10/2004 2:03:02 AM
//:://////////////////////////////////////////////
void main()
{
	// Give the speaker some XP
	GiveXPToCreature(GetPCSpeaker(), 60);


	// Remove items from the player's inventory
	object oItemToTake;
	oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "ThePackage");
	if(GetIsObjectValid(oItemToTake) != 0)
		DestroyObject(oItemToTake);
}
