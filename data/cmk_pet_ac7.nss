//::///////////////////////////////////////////////
//:: Henchman Death Script
//::
//:: NW_CH_AC7.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//::
//:: Created By:
//:: Modified by:   Brent, April 3 2002
//::                Removed delay in respawning
//::                the henchman - caused bugs
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 7, 2002
//::
//:: Modified By: U'lias (Shawn Marcil)
//:: Modified On: March 17, 2003
/*
    Modified for ALFA PW Project.

    - added Xp penalty from death of familiar
        (Xp Penalty = 200 * nClassLevels)
    - prevent Wiz/Sor overall total Xp from being less than 1
    - Wiz/Sor suffers full Xp penalty for failing saving throw
    - Wiz/Sor suffers half Xp penalty for succeeding saving throw
    - apply temporary knockdown effect to mimic shock of
        failing Fort saving throw due to familiar dying

*/

//:://////////////////////////////////////////////
//:: VFX Pass By: Preston W, On: June 20, 2001

#include "nw_i0_generic"
#include "nw_i0_plot"
#include "subraces"

int FORT_SAVING_THROW_DC = 15;

object oFamiliar = OBJECT_SELF; // familiar object

void BringBack()
{
    SetLocalObject(OBJECT_SELF,"NW_L_FORMERMASTER", GetMaster());
    // : REMINDER: The delay is here   for a reason
    DelayCommand(0.1, RemoveEffects(OBJECT_SELF));
    DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectResurrection(), OBJECT_SELF));
    DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectHeal(GetMaxHitPoints(OBJECT_SELF)), OBJECT_SELF));
    DelayCommand(5.1, SetIsDestroyable(TRUE, TRUE, TRUE));
    object oWay = GetObjectByTag("NW_DEATH_TEMPLE");
    if (GetIsObjectValid(oWay) == TRUE)
    {
        // * if in Source stone area, respawn at opening to area
        if (GetTag(GetArea(OBJECT_SELF)) == "M4Q1D2")
        {
            DelayCommand(0.2, JumpToObject(GetObjectByTag("M4QD07_ENTER"), FALSE));
        }
        else
            DelayCommand(0.2, JumpToObject(oWay, FALSE));
    }
    else
        DelayCommand(0.3, ActionSpeakString("UT: No place to go"));
}

/*
    Function: GetHighestArcaneCasterLevel

    Find the familiar's master's highest arcane caster level
    whether Sor or Wiz in case the PC has both classes.
*/
int GetHighestArcaneCasterLevel(object oMaster)
{
    int nSorcererLevels = GetLevelByClass(CLASS_TYPE_SORCERER, oMaster);
    int nWizardLevels = GetLevelByClass(CLASS_TYPE_WIZARD, oMaster);
    int nClassLevels;

    if (nSorcererLevels > nWizardLevels) nClassLevels = nSorcererLevels;
    else  nClassLevels = nWizardLevels;

    return nClassLevels;
}

void main()
{
    // * This is used by the advanced henchmen
    // * Let Brent know if it interferes with animal
    // * companions et cetera
    if (GetIsObjectValid(GetMaster()) == TRUE)
    {
       object oMe = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, GetMaster());
        if (oMe == OBJECT_SELF)
        {
            string sRef = GetResRef(oMe);
            object oPC = GetMaster();
            SetCommandable(FALSE);
            RemoveHenchman(oPC,oMe);
            sRef = "ALFAPET" + sRef;
            object oItem = GetItemPossessedBy(oPC,sRef);
            if(oItem != OBJECT_INVALID)
                DestroyObject(oItem);

 /*           SetPlotFlag(oMe, TRUE);
           SetAssociateState(NW_ASC_IS_BUSY, TRUE);
           AddJournalQuestEntry("Henchman", 99, GetMaster(), FALSE, FALSE, FALSE);
           SetIsDestroyable(FALSE, TRUE, TRUE);
           SetLocalInt(OBJECT_SELF, "NW_L_HEN_I_DIED", TRUE);
       //     RemoveHenchman(GetMaster());
           // effect eRaise = EffectResurrection();
            ClearAllActions();
            DelayCommand(0.5, ActionDoCommand(SetCommandable(TRUE)));
            DelayCommand(5.0, ActionDoCommand(SetAssociateState(NW_ASC_IS_BUSY, FALSE)));

            DelayCommand(5.0, SetPlotFlag(oMe, FALSE));

            BringBack();
            SetCommandable(FALSE);  */
        }
        else

/* -- Modified Script Starts Here -- */

        // * I am a familiar, apply Xp penalty to my master
        if(GetAssociate(ASSOCIATE_TYPE_FAMILIAR,GetMaster()) == OBJECT_SELF)
        {
            object oMaster = GetMaster(oFamiliar); // familiar's master object

            SendMessageToPC(oMaster, "Your familiar died!");

            // get the master's highest arcane caster level (Sor or Wiz)
            int nClassLevels = GetHighestArcaneCasterLevel(oMaster);
            int nXpValue = 200 * nClassLevels; // base Xp penalty
            int nPCTotalXP = GetXP(oMaster) + 1; // master's overall total Xp
            int nXpPenalty; // the final modified Xp penalty
            effect eKnockDown = EffectKnockdown(); // knockdown effect
            effect eDaze = EffectDazed(); // daze effect

            // check if Fortitude Saving Thow failed
            if (FortitudeSave(oMaster, FORT_SAVING_THROW_DC) == 0)
            {
                // the saving throw failed so assign full Xp penalty,
                // however, ensure that the master's total Xp doesn't fall below 1
                if (nPCTotalXP - nXpValue > 1) nXpPenalty = nXpValue;
                else nXpPenalty = nPCTotalXP - 1;

                // apply temporary knockdown effect to mimic shock of
                // failing saving throw due to familiar dying
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockDown, oMaster, 6.0f);
            }
            else // Fortitude Saving Thow succeeded
            {
                // the saving throw succeeded so assign half Xp penalty,
                // however, ensure that the master's total Xp doesn't fall below 1
                if (nPCTotalXP - (nXpValue/2) > 1) nXpPenalty = (nXpValue/2);
                else nXpPenalty = nPCTotalXP - 1;
            }
            //Deduct Xp penalty from total Xp
            SetXP(oMaster, nPCTotalXP - nXpPenalty);
        }
    }

/* -- Modified Script Ends Here -- */

}
