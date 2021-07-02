//::///////////////////////////////////////////////
//:: Default On Heartbeat
//:: NW_C2_DEFAULT1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will have people perform default
    animations.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 23, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void Timeout(object oPC)
{
    if(IsInConversation(OBJECT_SELF) && IsInConversation(oPC))
    {
 //       ChangeFaction(OBJECT_SELF,GetObjectByTag("faction_enemyofthestate"));
 // change to hostile so guards will respond
         ChangeFaction(OBJECT_SELF, GetObjectByTag("faction_hostile"));
       SpeakString("I don't have time for people stalling!");
        SetIsTemporaryEnemy(OBJECT_SELF,oPC);
        SetIsTemporaryEnemy(oPC,OBJECT_SELF);
        AssignCommand(OBJECT_SELF,ActionAttack(oPC));
    }
}

void main()
{

    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF);

    if((oPC != OBJECT_INVALID) && (!GetIsInCombat(OBJECT_SELF)) && (GetDistanceBetween(OBJECT_SELF,oPC) < 12.0) && GetObjectSeen(oPC) && !GetIsInCombat(oPC) && ((GetTag(GetItemInSlot(INVENTORY_SLOT_RIGHTRING,oPC)) != "TymoraRing") && (GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTRING,oPC)) != "TymoraRing")))
    {
        if((!IsInConversation(oPC)) && (!IsInConversation(OBJECT_SELF)))
        {
            if((GetGold(oPC) > 0))
            {
                ClearAllActions();
                ActionStartConversation(oPC,"cmk_rob");
                DelayCommand(20.0,Timeout(oPC));
            }
        }
        else if(!IsInConversation(OBJECT_SELF))
        {
            ActionForceMoveToObject(oPC,TRUE);
        }
    }
    else if((GetIsInCombat(OBJECT_SELF)) && (GetLocalInt(OBJECT_SELF,"cmk_thief_active") == TRUE))
        SpeakString("GUARDSKILLME",TALKVOLUME_SILENT_TALK);

    if(GetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY))
    {
        if(TalentAdvancedBuff(40.0))
        {
            SetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY, FALSE);
            return;
        }
    }

    if(GetSpawnInCondition(NW_FLAG_DAY_NIGHT_POSTING))
    {
        int nDay = FALSE;
        if(GetIsDay() || GetIsDawn())
        {
            nDay = TRUE;
        }
        if(GetLocalInt(OBJECT_SELF, "NW_GENERIC_DAY_NIGHT") != nDay)
        {
            if(nDay == TRUE)
            {
                SetLocalInt(OBJECT_SELF, "NW_GENERIC_DAY_NIGHT", TRUE);
            }
            else
            {
                SetLocalInt(OBJECT_SELF, "NW_GENERIC_DAY_NIGHT", FALSE);
            }
            WalkWayPoints();
        }
    }

    if(!GetHasEffect(EFFECT_TYPE_SLEEP))
    {
        if(!GetIsPostOrWalking())
        {
            if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                if(!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
                {
                    if(!GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL) && !IsInConversation(OBJECT_SELF))
                    {
                        if(GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS) || GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS_AVIAN))
                        {
                            PlayMobileAmbientAnimations();
                        }
                        else if(GetIsEncounterCreature() &&
                        !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
                        {
                            PlayMobileAmbientAnimations();
                        }
                        else if(GetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS) &&
                           !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
                        {
                            PlayImmobileAmbientAnimations();
                        }
                    }
                    else
                    {
                        DetermineSpecialBehavior();
                    }
                }
                else
                {
                    //DetermineCombatRound();
                }
            }
        }
    }
    else
    {
        if(GetSpawnInCondition(NW_FLAG_SLEEPING_AT_NIGHT))
        {
            effect eVis = EffectVisualEffect(VFX_IMP_SLEEP);
            if(d10() > 6)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
            }
        }
    }
    if(GetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1001));
    }

}
