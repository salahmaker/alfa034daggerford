/*
    Cast and get paid, heal
*/

#include "PRIEST"
#include "SUBRACES"

void main()
{
    object oSpeaker = GetPCSpeaker();

//  Compute cost
    int iCost = Priest_ComputeCost( 6, Priest_IsAlly( oSpeaker ) );

    ActionPauseConversation();
    if ( GetGold( oSpeaker ) >= iCost )
    {
        TakeGoldFromCreature( iCost, oSpeaker);

        ActionCastSpellAtObject( SPELL_HEAL, oSpeaker,METAMAGIC_ANY,TRUE );
        // Make sure all negative effects that should be removed are actually removed
        effect eBad = GetFirstEffect(oSpeaker);
        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_CURSE ||
                GetEffectType(eBad) == EFFECT_TYPE_DISEASE ||
                GetEffectType(eBad) == EFFECT_TYPE_POISON)
            {
              //Remove effect if it is negative.
              Subraces_SafeRemoveEffect(oSpeaker, eBad);
            }
            eBad = GetNextEffect(oSpeaker);
        }
    }
    else
    {
        ActionSpeakString( NOT_ENOUGH_GOLD );
        ActionPlayAnimation( ANIMATION_LOOPING_TALK_NORMAL, 1.0f, 3.0f );
    }
    ActionResumeConversation();





}
