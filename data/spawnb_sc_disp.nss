//
// Spawn Banner Display Text
//
void main()
{
    object oSpawn = GetLocalObject(OBJECT_SELF, "ParentSpawn");
    object oPC = GetLastUsedBy();

    string sSpawnName = GetName(oSpawn);
    string sSpawnTag = GetTag(oSpawn);

    DelayCommand(0.0, FloatingTextStringOnCreature(sSpawnName, oPC));
    DelayCommand(1.0, FloatingTextStringOnCreature(sSpawnTag, oPC));
}
