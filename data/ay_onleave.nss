/******************************************************************
 * Name: alfa_onleave
 * Type: OnClientLeave
 * ---
 * Author: Modal
 * Date: 08/30/02
 * ---
 * This handles the module OnClientLeave event.
 * You can add custom code in the appropriate section, as well as
 * in alfa_userdef.
 ******************************************************************/

/* Includes */
//#include "alfa_include"

void main()
{
  //ALFA_OnClientLeave();
  object oPC = GetExitingObject();
  object oMod = GetModule();
  int iCurHP = GetCurrentHitPoints(oPC);
  /**************** Add Custom Code Here ***************/
  ExecuteScript("alfa_onleave", oPC);
  /*****************************************************/
  if(GetIsDM(oPC))
    return;


  SetCampaignInt("Location", "updated", 1, oPC);

  SetCampaignLocation("Location", "last", GetLocation(oPC), oPC);

  int iHP = GetLocalInt(oMod,"LastHP"+GetName(oPC)+GetPCPublicCDKey(oPC));

  if(iCurHP && iHP != iCurHP){
    SetLocalInt(oMod,"LastHP"+GetName(oPC)+GetPCPublicCDKey(oPC), GetCurrentHitPoints(oPC));
    SendMessageToAllDMs("Detected mismatch of player hit points and stored value.  Corrected stored hit points in database.");
  }
  if(GetLocalInt(oMod,"PlayerState"+GetName(oPC)+GetPCPublicCDKey(oPC)) != 0 && GetCurrentHitPoints(oPC) > 0 ){
    SendMessageToAllDMs("Detected player in dying state but postive hit points.  Corrected stored state in ay_onleave.");
    SetLocalInt(oMod,"PlayerState"+GetName(oPC)+GetPCPublicCDKey(oPC), 0);
  }
}

