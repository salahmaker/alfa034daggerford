//
// Camp Trigger Scripts
//
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
void DestroyCamp(object oCamp, float fCampDecay, int nSaveState);
//
//
void main()
{
    // Initialize Variables
    object oSpawned;
    string sObject;
    int iCount, nCampNumP, nCampNumC;

    // Retrieve Script
    int nCampTriggerScript = GetLocalInt(OBJECT_SELF, "CampTriggerScript");

    // Invalid Script
    if (nCampTriggerScript == -1)
    {
        return;
    }

//
// Only Make Modifications Between These Lines
// -------------------------------------------


    // Destroy Camp
    if (nCampTriggerScript == 0)
    {
        DestroyCamp(OBJECT_SELF, 0.0, FALSE);
    }
    //


// -------------------------------------------
// Only Make Modifications Between These Lines
//
}
