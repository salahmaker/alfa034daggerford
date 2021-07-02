//::///////////////////////////////////////////////
//:: FileName angel_mvcara4
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/21/2005 2:39:12 PM
//:://////////////////////////////////////////////
void main()
{

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "Caravantoken");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    //Transport PC to Dragonspear caravan area
    AssignCommand(GetPCSpeaker(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Caravan2"))));
}
