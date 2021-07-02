//::///////////////////////////////////////////////
//:: Name PRIEST_AT_RAISE
//:://////////////////////////////////////////////
/*
    Cast raise dead on a corpse.
    Copied from Modal's mrg_at_crp_res
    Added cost and removed healing.
*/
//:://////////////////////////////////////////////
//:: Created By: Evaine
//:: Created On:
//:://////////////////////////////////////////////

#include "mrg_include"
#include "priest"

void main()
{
  object oCleric = GetLastSpeaker();
  object oPCCarry = GetPCSpeaker();
  object oPCDead,
         oUndertaker,
         oRecord = GetObjectByTag( ALFA_OBJ_MORGUE_RECORD_TAG );
  object oCorpseToken = OBJECT_SELF;
  string sCorpseID;

  oCorpseToken = ALFA_MORGUE_GetPCHasCorpse( oPCCarry );

  sCorpseID = GetLocalString( oCorpseToken, ALFA_PC_CORPSE_ID );

  if ( ALFA_MORGUE_GetCorpseDecayed( sCorpseID ) == TRUE )
  {
    SendMessageToPC( oPCCarry, "The corpse has decayed for far too long for this to be possible." );
    return;
  }

  oPCDead = ALFA_GetPCByName( sCorpseID );
  SetLocalInt( oRecord, sCorpseID, ALFA_FLAG_PC_RESURRECTED );

  ActionPauseConversation();

  int iCost = Priest_ComputeCost( 5, Priest_IsAlly( oPCCarry ) );
  iCost = iCost + 500; //add in cost of material component
  iCost = FloatToInt(iCost * 1.5f); //multiply by rarity factor

  // Stop if PC doesn't have enough gold
  if ( GetGold( oPCCarry ) < iCost )
  {
        ActionSpeakString( NOT_ENOUGH_GOLD );
        ActionPlayAnimation( ANIMATION_LOOPING_TALK_NORMAL, 1.0f, 3.0f );
        ActionResumeConversation();
        return;
  }

  TakeGoldFromCreature( iCost, oPCCarry, TRUE );

  // Add effects
  ActionCastFakeSpellAtObject( SPELL_RAISE_DEAD, oPCCarry );
  effect eVisual = EffectVisualEffect( VFX_IMP_RAISE_DEAD );
  ActionDoCommand( ApplyEffectToObject( DURATION_TYPE_INSTANT, eVisual, oPCCarry ) );
  ActionResumeConversation();

  /* Is dead PC offline? */
  if ( oPCDead == OBJECT_INVALID )
  {
    SetLocalLocation( oRecord, sCorpseID, GetLocation( oPCCarry ) );
    DestroyObject( oCorpseToken );
    return;
  }

  /* Dead PC is online - proceed! */
  /* PC has been killed < 10 sec. ago */
  if ( GetTag( GetArea( oPCDead ) ) != ALFA_AREA_MORGUE_TAG )
  {
    DelayCommand( 11.0, ALFA_MORGUE_RestorePC( oPCDead, FALSE ) );
    DelayCommand( 11.0, AssignCommand( oPCDead, JumpToLocation( GetLocation( oPCCarry ) ) ) );
    DestroyObject( oCorpseToken );
  }
  else
  {
    ALFA_MORGUE_RestorePC( oPCDead, FALSE );
    AssignCommand( oPCDead, JumpToLocation( GetLocation( oPCCarry ) ) );
    DestroyObject( oCorpseToken );
  }
}
