/******************************************************************
 * Name: alfa_onrest
 * Type: OnPlayerRest
 * ---
 * Author: Modal
 * Date: 08/30/02
 * ---
 * This handles the module OnPlayerRest event.
 * You can add custom code in the appropriate section, as well as
 * in alfa_userdef.
 ******************************************************************/

/* Includes */
//#include "alfa_include"

void main()
{

  /**************** Add Custom Code Here ***************/
  object oPC = GetLastPCRested();

  ExecuteScript("alfa_onrest", oPC);

  SetCampaignInt("Location", "updated", 3, oPC);

  SetCampaignLocation("Location", "last", GetLocation(oPC), oPC);
  /*****************************************************/
}
