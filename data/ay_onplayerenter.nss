/* Configuration options */
#include "alfa_options"

/* HC Death Functions */
#include "hc_inc_death"
#include "hc_inc_timecheck"

/* Subdual */
#include "alfa_subdual"

/*Morgue */
#include "mrg_include"

/* Constants */
#include "alfa_constants"

/* ALFA and Custom Item Processing */
#include "alfa_items"

/* persistent functions */
#include "alfa_charloc"
#include "sos_include"

/* Spell Tracking system */
#include "alfa_spelltrack"

/* Animal Companions */
#include "ac_include"

/* Familiar Persistency */
#include "pfp_inc"

#include "36_include_inc"
//#include "zel_xp_i"


void ALFA_CheckAnimations(object oPC)
{
    object oHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC);
    if( GetTag(oHide) != "alfa_pcskin")
    {
        oHide = CreateItemOnObject("alfa_pcskin", oPC);
        AssignCommand(oPC, ActionEquipItem(oHide, INVENTORY_SLOT_CARMOUR));
    }
}



void ALFA_OnClientEnter()
{
  object oPC = GetEnteringObject();
  location lExit;

  // All PrCs are disabled by default
  // In the future, we'll check for a persistent var (such as
  // "ALFA_AllowArcher" that would prevent these from being called
  // for individual PCs.  My intention is to put the ability to write
  // that var onto a player via the DM wand at some point.
  //  - Cereborn 09/01/03
  //
  // Hordes of the Underdark PrCs are added to the list
  // and disabled by defalt.
  //  - Murky 01/04/04
  //
  // PrCs have now been added to the DM-wand and been made available for activation.
  // Please check with current DM Guidelines for more information.
  //  - Murky 12/03/04
  //
  SetLocalInt(oPC, "X1_AllowArcher", 1);
  SetLocalInt(oPC, "X1_AllowAsasin", 1);
  SetLocalInt(oPC, "X1_AllowBlkGrd", 1);
  SetLocalInt(oPC, "X1_AllowHarper", 1);
  SetLocalInt(oPC, "X1_AllowShadow", 1);
  SetLocalInt(oPC, "X2_AllowWM", 1);
  SetLocalInt(oPC, "X2_AllowShiftr", 1);
  SetLocalInt(oPC, "X2_AllowPalema", 1);
  SetLocalInt(oPC, "X2_AllowDwDef", 1);
  SetLocalInt(oPC, "X2_AllowDrDis", 1);
  SetLocalInt(oPC, "X2_AllowDivcha", 1);

  /* Set up the weather and/or skies system for the player, if in use */
  if (gALFA_USE_GLOBAL_SKIES)
    {
    SetLocalInt(oPC, "alfa_play_weath", 1);
    }

  /*if ( gALFA_USE_GLOBAL_WEATHER || gALFA_USE_GLOBAL_SKIES )
  {
    ExecuteScript("alfa_weather", oPC);
  } */

  /* Handle new players */
  if ( GetXP( oPC ) < 1 && !GetIsDM( oPC ) ){
    CSM_ProcessNewPlayer( oPC );
    object oTarget;
    //location lTarget;
    oTarget = GetWaypointByTag("startmerchant");

    //lTarget = GetLocation(oTarget);

    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionJumpToObject(oTarget));




  }

  /* Kick out a PC on the "Banned" list */
  ExecuteScript( "csm_autoban", oPC );

  SendMessageToPC( oPC, LOGINMESSAGE );

  /* Remind DMs to set appropriate difficulty level */
  if ( GetIsDM( oPC ) == TRUE )
    CSM_RemindDMDifficulty( oPC );

  /* Prevent the XP/Level bug */
  CSM_XPInquisition( oPC );

  /* Validate player's server visa */
  ExecuteScript( "alfa_portal_in", OBJECT_SELF );

  /* Init subrace scripts */
  ExecuteScript( "sei_subraceinit", OBJECT_SELF );

  /* Check for dead players logging in */
  ALFA_PCDeadLogin( oPC );

  /* Clean up any player corpses being carried */
  ALFA_MORGUE_CheckCorpseEnter( oPC );

  /* Run HCR OnEnter */
  ExecuteScript( "hc_on_cl_enter", OBJECT_SELF );

  /* Run 1984 OnEnter */
  //ExecuteScript( "alfa_1984_enter", OBJECT_SELF );

  /* Log the character in from Central Authentication */
  SOS_PlayerLogin( oPC );

  /* Puts the character back to their last known location */
  //ALFA_LoadCharacterLocation( oPC );

  /* Begin the save location script monitor that will run */
  /*if ( gALFA_LOCATION_SAVE_TIMER )
  {
    ALFA_SaveCharacterLocationOnTimer( oPC );
  } */

  /* Do a character save for backup purposes */
  // ACR 1.18 this is marked off
  // ExportSingleCharacter( oPC );

  /* Remove all temp effects from items */

  ExecuteScript("alfa_tmp_eff_rem", oPC);

    /* Spell Tracking system */
  if (!GetIsDM(oPC))
    TrackSpellsOnEnter(oPC);

    /* Encumberance system */
  //  if (!GetIsDM(oPC))
  //    AssignCommand(oPC, ExecuteScript("alfa_gold_hb", OBJECT_SELF));

  /* Horse System */
 // ALFA_OnHorseOwnerEnter(GetEnteringObject());
   /* Animations and Maneuvers */
    DelayCommand(30.0f, ALFA_CheckAnimations(oPC));


  /* User Defined */
  SignalEvent( OBJECT_SELF, EventUserDefined(ALFA_EVENT_MODULE_ON_ENTER) );
}

void main()
{
    object oPC = GetEnteringObject();

 {
  ALFA_OnClientEnter();

  /**************** Add Custom Code Here ***************/
  ExecuteScript("eln_cliententer", OBJECT_SELF);

                   if( !GetIsDM(oPC) && GetIsPC(oPC) )
    {
        CreatePlayerAgent(oPC);
        ScanPCForCursedItems(oPC);
    }
//  ExecuteScript("alfa_rpxp_enter", (GetEnteringObject()));
  ExecuteScript("set_faction_rep", GetEnteringObject());
  /*****************************************************/
 }
 /*if(!GetIsDM(oPC))
 {
     DelayCommand(60.0f, ExecuteScript("zel_activity", oPC));
     DelayCommand(61.0f, SetRPQuality(oPC));
 }*/
}
