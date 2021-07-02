//
// Patrol Scripts
//
#include "spawn_functions"
//
object GetChildByTag(object oSpawn, string sChildTag);
object GetChildByNumber(object oSpawn, int nChildNum);
object GetSpawnByID(int nSpawnID);
void DeactivateSpawn(object oSpawn);
void DeactivateSpawnsByTag(string sSpawnTag);
void DeactivateAllSpawns();
void DespawnChildren(object oSpawn);
void DespawnChildrenByTag(object oSpawn, string sSpawnTag);
//
//
void main()
{
    // Retrieve Script Number
    int nPatrolScript = GetLocalInt(OBJECT_SELF, "PatrolScript");

    // Retrieve Stop Information
    int nStopNumber = GetLocalInt(OBJECT_SELF, "PR_NEXTSTOP");
    object oStop = GetLocalObject(OBJECT_SELF, "PR_SN" + PadIntToString(nStopNumber, 2));

    // Invalid Script
    if (nPatrolScript == -1)
    {
        return;
    }

//
// Only Make Modifications Between These Lines
// -------------------------------------------


    // Script 00
    if (nPatrolScript == 0)
    {
        ActionDoCommand(SpeakString("Example!"));
    }
    //

    // Turn Off Lights
    if (nPatrolScript == 7)
    {
        object oLight = GetNearestObjectByTag("Light", oStop);
        if ((GetIsDay() == TRUE && GetPlaceableIllumination(oLight) == TRUE)
         || (GetIsNight() == TRUE && GetPlaceableIllumination(oLight) == FALSE))
        {
            ActionDoCommand(DoPlaceableObjectAction(oLight, PLACEABLE_ACTION_USE));
        }
    }
    //

    // Trap-Setting Rogue
    if (nPatrolScript == 1)
    {
        object oTrap = GetNearestTrapToObject();
        if (oTrap == OBJECT_INVALID || GetDistanceToObject(oTrap) > 5.0)
        {
            // Create a Trap Kit
            object oTrapKit = CreateItemOnObject("NW_IT_TRAP001", OBJECT_SELF, 1);
            // Set Trap
            SignalEvent(GetModule(), EventActivateItem(oTrapKit, GetLocation(OBJECT_SELF)));
        }
    }
    //


// -------------------------------------------
// Only Make Modifications Between These Lines
//

}
