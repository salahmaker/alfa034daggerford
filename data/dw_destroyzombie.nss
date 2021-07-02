#include "nw_i0_tool"

void main()
{
    object oDestroy = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD);
    // Give those who destroy the altar some XP
    RewardPartyXP(500, GetLastDamager());
    DestroyObject(oDestroy, 0.5);
    // Open exit door
    object oTarget;
    oTarget = GetObjectByTag("C4Exit");
    SetLocked(oTarget, FALSE);
    AssignCommand(oTarget, ActionOpenDoor(oTarget));

}
