 //:://////////////////////////////////////////////////
//:: ALFA Animal Companions
//:: ac_heartbeat
//:: Formerly X0_CH_HEN_HEART
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*

  Animal Companion-specific OnHeartbeat handler for XP1.
  Based on NW_CH_AC1 by Bioware.

 */
//:://////////////////////////////////////////////////
//:: Created By: Naomi Novik
//:: Created On: 01/05/2003
//:: Modified by Shawn "U'lias" Marcil for ALFA
//:: Modified Date: October 7, 2003
//:://////////////////////////////////////////////////

#include "X0_INC_HENAI"
#include "ac_include"

void main()
{
/***************** ALFA Code Start *****************/

    object oCompanion = OBJECT_SELF; // animal companion
    object oPC = GetMaster(oCompanion); // PC Druid
    string sCompanionHP;
    int nHitPoints = GetCurrentHitPoints(oCompanion); // current HPs of animal companion
    int nDruidLevel = AC_GetDruidLevel(oPC); // PC druid's level
    // unique DB record name
    string sString = GetName(oPC) + AC_GetItemString(GetResRef(oCompanion));
    // DB stored HP of animals companion
    int nDBHitPoints = GetCampaignInt("AC_Companion", sString, oPC);

    if (AC_DEBUG)
    {
        SendMessageToPC(oPC, "nHitPoints = " + IntToString(nHitPoints));
        SendMessageToPC(oPC, "sString = " + sString);
        SendMessageToPC(oPC, "nDBHitPoints = " + IntToString(nDBHitPoints));
    }

    // check if the animal companion's current hit points are different from what
    // was last stored in the database file
    if (nHitPoints != nDBHitPoints)
    {
        if (AC_DEBUG) SendMessageToPC(oPC, "Hit Points have been changed!");
        // replace the animal companion's HP data with their current HPs
        SetCampaignInt("AC_Companion", sString, nHitPoints, oPC);
    }

/***************** ALFA Code End *****************/

    //SpawnScriptDebugger();
    if(GetIsResting(GetMaster())){
      SetIsDestroyable(TRUE, FALSE, FALSE);
      RemoveHenchman(GetMaster(),OBJECT_SELF);
      DestroyObject(OBJECT_SELF);
    }





    if(!GetIsObjectValid(GetMaster()) && GetLocalInt(OBJECT_SELF, "crazy") == 0)
    {
        SetIsDestroyable(TRUE, FALSE, FALSE);
        SetImmortal(OBJECT_SELF, FALSE);
        SetPlotFlag(OBJECT_SELF, FALSE);
        DestroyObject(OBJECT_SELF);
    }


    // If the henchman is in dying mode, make sure
    // they are non commandable. Sometimes they seem to
    // 'slip' out of this mode
    int bDying = GetIsHenchmanDying();

    if (bDying == TRUE)
    {
        int bCommandable = GetCommandable();
        if (bCommandable == TRUE)
        {
            // lie down again
            ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,
                                          1.0, 65.0);
           SetCommandable(FALSE);
        }
    }

    // If we're dying or busy, we return
    // (without sending the user-defined event)
    if(GetAssociateState(NW_ASC_IS_BUSY) ||
       bDying)
        return;

    // * checks to see if a ranged weapon was being used
    // * if so, it equips it back
    if (GetIsInCombat() == FALSE)
    {        //   SpawnScriptDebugger();
        object oRight = GetLocalObject(OBJECT_SELF, "X0_L_RIGHTHAND");
        if (GetIsObjectValid(oRight) == TRUE)
        {    // * you always want to blank this value, if it not invalid
            SetLocalObject(OBJECT_SELF, "X0_L_RIGHTHAND", OBJECT_INVALID);
            if (GetWeaponRanged(oRight) == TRUE)
            {
                ClearAllActions();
                bkEquipRanged(OBJECT_INVALID, TRUE, TRUE);
                //ActionEquipItem(
                return;

            }
        }
    }

    if(!GetAssociateState(NW_ASC_IS_BUSY))
    {
        object oMaster = GetMaster();
        //Seek out and disable undisabled traps
        object oTrap = GetNearestTrapToObject();
        if (bkAttemptToDisarmTrap(oTrap) == TRUE) return ; // succesful trap found and disarmed

        if(GetIsObjectValid(oMaster) &&
            GetCurrentAction(OBJECT_SELF) != ACTION_FOLLOW &&
            GetCurrentAction(OBJECT_SELF) != ACTION_DISABLETRAP &&
            GetCurrentAction(OBJECT_SELF) != ACTION_OPENLOCK &&
            GetCurrentAction(OBJECT_SELF) != ACTION_REST &&
            GetCurrentAction(OBJECT_SELF) != ACTION_ATTACKOBJECT)
        {
            if(
               !GetIsObjectValid(GetAttackTarget()) &&
               !GetIsObjectValid(GetAttemptedSpellTarget()) &&
               !GetIsObjectValid(GetAttemptedAttackTarget()) &&
               !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN))
              )
            {
                if (GetIsObjectValid(oMaster) == TRUE)
                {
                    if(GetDistanceToObject(oMaster) > 6.0)
                    {
                        if(GetAssociateState(NW_ASC_HAVE_MASTER))
                        {
                            if(!GetIsFighting(OBJECT_SELF))
                            {
                                if(!GetAssociateState(NW_ASC_MODE_STAND_GROUND))
                                {
                                    if(GetDistanceToObject(GetMaster()) > GetFollowDistance())
                                    {
                                        ClearActions(CLEAR_NW_CH_AC1_49);
                                        if(GetAssociateState(NW_ASC_AGGRESSIVE_STEALTH) || GetAssociateState(NW_ASC_AGGRESSIVE_SEARCH))
                                        {
                                             if(GetAssociateState(NW_ASC_AGGRESSIVE_STEALTH))
                                             {
/* */                                                ActionUseSkill(SKILL_HIDE, OBJECT_SELF);
/* */                                                ActionUseSkill(SKILL_MOVE_SILENTLY,OBJECT_SELF);
                                             }
                                             if(GetAssociateState(NW_ASC_AGGRESSIVE_SEARCH))
                                             {
                                                ActionUseSkill(SKILL_SEARCH, OBJECT_SELF);
                                             }
                                             MyPrintString("GENERIC SCRIPT DEBUG STRING ********** " + "Assigning Force Follow Command with Search and/or Stealth");
                                             ActionForceFollowObject(oMaster, GetFollowDistance());
                                        }
                                        else
                                        {
                                             MyPrintString("GENERIC SCRIPT DEBUG STRING ********** " + "Assigning Force Follow Normal");
                                             ActionForceFollowObject(oMaster, GetFollowDistance());
                                             //ActionJumpToObject(GetMaster(), TRUE);
                                        }



                                    }
                                }
                            }
                        }
                    }
                }
                else if(!GetAssociateState(NW_ASC_MODE_STAND_GROUND))
                {
                    if(GetIsObjectValid(oMaster))
                    {
                        if(GetCurrentAction(oMaster) != ACTION_REST)
                        {
                            ClearActions(CLEAR_NW_CH_AC1_81);
                            if(GetAssociateState(NW_ASC_AGGRESSIVE_STEALTH) || GetAssociateState(NW_ASC_AGGRESSIVE_SEARCH))
                            {
                                 if(GetAssociateState(NW_ASC_AGGRESSIVE_STEALTH))
                                 {
/* */                                    ActionUseSkill(SKILL_HIDE, OBJECT_SELF);
/* */                                    ActionUseSkill(SKILL_MOVE_SILENTLY,OBJECT_SELF);
                                 }
                                 if(GetAssociateState(NW_ASC_AGGRESSIVE_SEARCH))
                                 {
                                    ActionUseSkill(SKILL_SEARCH, OBJECT_SELF);
                                 }
                                 MyPrintString("GENERIC SCRIPT DEBUG STRING ********** " + "Assigning Force Follow Command with Search and/or Stealth");
                                 ActionForceFollowObject(oMaster, GetFollowDistance());
                            }
                            else
                            {
                                 MyPrintString("GENERIC SCRIPT DEBUG STRING ********** " + "Assigning Force Follow Normal");
                                 ActionForceFollowObject(oMaster, GetFollowDistance());
                            }
                        }
                    }
                }
            }
            else if(!GetIsObjectValid(GetAttackTarget()) &&
               !GetIsObjectValid(GetAttemptedSpellTarget()) &&
               !GetIsObjectValid(GetAttemptedAttackTarget()) &&
               !GetAssociateState(NW_ASC_MODE_STAND_GROUND))
            {
                //DetermineCombatRound();
            }
        }
        if(GetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT))
        {
            SignalEvent(OBJECT_SELF, EventUserDefined(1001));
        }
    }
}


