//::///////////////////////////////////////////////
//:: Flesh to Stone
//:: x0_s0_fleshsto
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
//:: The target freezes in place, standing helpless.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent Knowles
//:: Created On: October 16, 2002
//:://////////////////////////////////////////////
#include "X0_I0_SPELLS"
#include "x2_inc_spellhook"

void main()
{

/*
  Spellcast Hook Code
  Added 2003-06-20 by Georg
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more

*/

    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook
 //Zelknolf's spell save DC and caster level fixes.
    int iSaveDC = ExecuteScriptAndReturnInt("alfa_savedc", OBJECT_SELF);
    int iCasterLevel = ExecuteScriptAndReturnInt("alfa_casterlevel", OBJECT_SELF);

    //Declare major variables
    object oTarget = GetSpellTargetObject();

    if (MyResistSpell(OBJECT_SELF,oTarget) <1)
    {
       int nPower = iCasterLevel;
       object oSource = OBJECT_SELF;
       int nSpellID = GetSpellId();
       int nFortSaveDC = iSaveDC;
        if(!GetIsReactionTypeFriendly(oTarget))
        {
            // * exit if creature is immune to petrification
            if (spellsIsImmuneToPetrification(oTarget) == TRUE)
            {
                return;
            }
            float fDifficulty = 0.0;
            int bIsPC = GetIsPC(oTarget);
            int bShowPopup = FALSE;

            // * calculate Duration based on difficulty settings
            int nGameDiff = GetGameDifficulty();
            switch (nGameDiff)
            {
                case GAME_DIFFICULTY_VERY_EASY:
                case GAME_DIFFICULTY_EASY:
                case GAME_DIFFICULTY_NORMAL:
                        fDifficulty = RoundsToSeconds(nPower); // One Round per hit-die or caster level
                    break;
                case GAME_DIFFICULTY_CORE_RULES:
                case GAME_DIFFICULTY_DIFFICULT:
                    bShowPopup = TRUE;
                break;
            }

            int nSaveDC = nFortSaveDC;
            effect ePetrify = EffectPetrify();

            effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);

            effect eLink = EffectLinkEffects(eDur, ePetrify);

                // Let target know the negative spell has been cast
                SignalEvent(oTarget,
                            EventSpellCastAt(OBJECT_SELF, nSpellID));
                            //SpeakString(IntToString(nSpellID));

                // Do a fortitude save check
                if (!MySavingThrow(SAVING_THROW_FORT, oTarget, nSaveDC))
                {
                    // Save failed; apply paralyze effect and VFX impact

                    /// * The duration is permanent against NPCs but only temporary against PCs
                    if (bIsPC == TRUE)
                    {
                        if (bShowPopup == TRUE)
                        {
                            // * under hardcore rules or higher, this is an instant death
                            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget);
                            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_ICESKIN), oTarget);
                            //DelayCommand(2.75, PopUpDeathGUIPanel(oTarget, FALSE , TRUE, 40579));
                            // if in hardcore, treat the player as an NPC
                            bIsPC = FALSE;
                            //fDifficulty = TurnsToSeconds(nPower); // One turn per hit-die
                        }
                        else
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDifficulty);
                    }
                    else
                    {
                        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget);

                        //----------------------------------------------------------
                        // GZ: Fix for henchmen statues haunting you when changing
                        //     areas. Henchmen are now kicked from the party if
                        //     petrified.
                        //----------------------------------------------------------
                        if (GetAssociateType(oTarget) == ASSOCIATE_TYPE_HENCHMAN)
                        {
                            FireHenchman(GetMaster(oTarget),oTarget);
                        }

                    }
                    // April 2003: Clearing actions to kick them out of conversation when petrified
                    AssignCommand(oTarget, ClearAllActions(TRUE));
                }
           }
    }
}


