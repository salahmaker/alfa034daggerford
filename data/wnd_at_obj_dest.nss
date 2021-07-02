/******************************************************************
 * File: wnd_at_obj_dest
 * Name: ALFA Wand: Destroy Object?
 * Type: Conversation (Action Taken)
 * ---
 * Author: Camille Monnier (Modal)
 * Date: 07/17/02
 * ---
 * This script destroys the item being targeted by the DM Wand.
 ******************************************************************/

#include "wnd_constants"

void main()
{
  object oPC = GetPCSpeaker();
  object oTarget;

  oTarget = GetLocalObject( oPC, ALFA_DMWAND_TARGET );

  DestroyObject( oTarget );
}
