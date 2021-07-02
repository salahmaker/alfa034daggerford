/*
    Cast and get paid, restoration
*/

#include "PRIEST"

void main()
{
    object oSpeaker = GetPCSpeaker();

//  Compute cost
    int iCost = Priest_ComputeCost( 4, Priest_IsAlly( oSpeaker ) );
    iCost = iCost + 100; //material component cost

    ActionPauseConversation();
    if ( GetGold( oSpeaker ) >= iCost )
    {
        TakeGoldFromCreature( iCost, oSpeaker);

        ActionCastSpellAtObject( SPELL_RESTORATION, oSpeaker,METAMAGIC_ANY,TRUE );
    }
    else
    {
        ActionSpeakString( NOT_ENOUGH_GOLD );
        ActionPlayAnimation( ANIMATION_LOOPING_TALK_NORMAL, 1.0f, 3.0f );
    }
    ActionResumeConversation();
}
