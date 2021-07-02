//::///////////////////////////////////////////////
//:: FileName angel_mvcara1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/21/2005 2:37:35 PM
//:://////////////////////////////////////////////
void main()
{

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "Caravantoken");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    //transport PC to Daggerford Caravan area
    AssignCommand(GetPCSpeaker(),ActionJumpToLocation(GetLocation(GetWaypointByTag("CarWD"))));
}
