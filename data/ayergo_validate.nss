/*
 * Author: Modal
 * Created: November 27, 2002
 * ---
 * "Absolve" a player and allow him to return to a state acceptable by the
 * server. This will remove death tokens, visas, and warnings, and will
 * provide a fresh visa.
 */

/*
  Edited by Ranoulf March 12 2003 to deal with quarantine and
  the new documents struct.
*/

#include "alfa_portal_incl"

void main() {

//  these two lines from modals other wand scripts...
   // object oDM = GetLastSpeaker();
    object oPC = GetEnteringObject();//GetLocalObject( oDM, "dmwandtarget" );
    if(GetPCPlayerName(oPC) == "ayergovich" || GetPCPlayerName(oPC) == "Rick7475" || GetPCPlayerName(oPC) == "QRRCXUDW"){

//  The act of searching removes any extra of the three document types.
    struct documentation Docs = AP_GetDocumets(oPC);

//  The server on the old visa was alfa_xxx
    string sOldServer = AP_GetWord( GetTag(Docs.oVisa),2 );
    int iWasDead = GetIsObjectValid( Docs.oDeathCertificate );

    DestroyObject(Docs.oVisa);
    DestroyObject(Docs.oPass);
    DestroyObject(Docs.oDeathCertificate);

    AP_FreezeOff(oPC);

    object oVisa = AP_GiveVisa(oPC);

    if ( ! GetIsObjectValid(oVisa) ) {
        SendMessageToPC(oPC,"Unable to Create Visa");
        //SendMessageToPC(oDM,"Unable to Create Visa for player " + GetName(oPC));
    }

    else {
        SendMessageToPC(oPC,"You have been Normalized");

        //SendMessageToPC(oDM,GetName(oPC) + " has been Normalized");
        //SendMessageToPC(oDM,"The were formerly local to server " + sOldServer);
        //if (iWasDead) SendMessageToPC(oDM,"and were dead");
    }

//  from modal's original script
    SetLocalInt( oPC, "VISADROP_WARN", 0 );
    SetLocalInt( oPC, "TOKENDROP_WARN", 0 );
}

}










/*

#include "alfa_include"

void main()
{
  object oDM = GetLastSpeaker();
  object oPC = GetLocalObject( oDM, "dmwandtarget" );

  // Clear out all Visas/Death tokens
  object oItem = GetFirstItemInInventory( oPC );

  while ( oItem != OBJECT_INVALID )
  {
    if ( AP_GetIsVisa( oItem )
      || GetTag( oItem ) == "ALFADeathToken" )
      DestroyObject( oItem );
    oItem = GetNextItemInInventory( oPC );
  }

  // Reset warnings
  SetLocalInt( oPC, "VISADROP_WARN", 0 );
  SetLocalInt( oPC, "TOKENDROP_WARN", 0 );

  // Provide a good visa
  CreateItemOnObject( GetModuleName(), oPC );
}
