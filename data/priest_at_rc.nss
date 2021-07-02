/*
    Cast and get paid, remove curse
*/

#include "PRIEST"

void main()
{
    object oSpeaker = GetPCSpeaker();

//  Compute cost
    int iCost = Priest_ComputeCost( 3, Priest_IsAlly( oSpeaker ) );

    ActionPauseConversation();
    if ( GetGold( oSpeaker ) >= iCost )
    {
        TakeGoldFromCreature( iCost, oSpeaker);

        ActionCastSpellAtObject( SPELL_REMOVE_CURSE, oSpeaker,METAMAGIC_ANY,TRUE );
    }
    else
    {
        ActionSpeakString( NOT_ENOUGH_GOLD );
        ActionPlayAnimation( ANIMATION_LOOPING_TALK_NORMAL, 1.0f, 3.0f );
    }
    ActionResumeConversation();
}

