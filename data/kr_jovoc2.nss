//::///////////////////////////////////////////////
//:: Default On Damaged
//:: NW_C2_DEFAULT6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    if(!GetFleeToExit())
    {
        if(!GetSpawnInCondition(NW_FLAG_SET_WARNINGS))
        {
            if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
                {
                    DetermineSpecialBehavior(GetLastDamager());
                }
                else if(GetIsObjectValid(GetLastDamager()))
                {
                    DetermineCombatRound();
                    if(!GetIsFighting(OBJECT_SELF))
                    {
                        object oTarget = GetLastDamager();
                        if(!GetObjectSeen(oTarget) && GetArea(OBJECT_SELF) == GetArea(oTarget))
                        {
                            ActionMoveToLocation(GetLocation(oTarget), TRUE);
                            ActionDoCommand(DetermineCombatRound());
                        }
                    }
                }
            }
            else if (!GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                object oTarget = GetAttackTarget();
                if(!GetIsObjectValid(oTarget))
                {
                    oTarget = GetAttemptedAttackTarget();
                }
                object oAttacker = GetLastHostileActor();
                if (GetIsObjectValid(oAttacker) && oTarget != oAttacker && GetIsEnemy(oAttacker) &&
                   (GetTotalDamageDealt() > (GetMaxHitPoints(OBJECT_SELF) / 4) ||
                    (GetHitDice(oAttacker) - 2) > GetHitDice(oTarget) ) )
                {
                    DetermineCombatRound(oAttacker);
                }
            }
        }
    }
    if(GetSpawnInCondition(NW_FLAG_DAMAGED_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1006));
    }
     //this part is new, should simulate Aura of Retribution of this creature
     object oPC = GetLastDamager();
     int nDamage = (GetMaxHitPoints(OBJECT_SELF)- GetCurrentHitPoints(OBJECT_SELF))/2;
     effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_NORMAL);
     if (GetDistanceToObject(oPC) < 10.0)
     {
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDamage, oPC, 0.5);
     ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DESTRUCTION), GetLocation(oPC));
     }
}
