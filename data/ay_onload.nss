/******************************************************************
 * Name: alfa_onload
 * Type: OnModuleLoad
 * ---
 * Author: Modal
 * Date: 08/30/02
 * ---
 * This handles the module OnModuleLoad event.
 * You can add custom code in the appropriate section, as well as
 * in alfa_userdef.
 ******************************************************************/

/* Includes */
//#include "alfa_include"
#include "x2_inc_switches"
void main()
{
  //ALFA_OnModuleLoad();
  ExecuteScript("alfa_onload",OBJECT_SELF);
  SetLocalString(GetModule(), "X2_S_UD_SPELLSCRIPT", "spell_override");
  SetModuleOverrideSpellscript("spell_override");
  ExecuteScript("ay_henchmen",OBJECT_SELF);
  //SetMaxHenchmen(5);

  /**************** Add Custom Code Here ***************/
   // ExecuteScript("eln_modload", OBJECT_SELF);
 //SetLocalInt((GetModule()), "#Heartbeats", 0);
 //SetLocalString(GetModule(), "X2_S_UD_SPELLSCRIPT", "spell_override");
  /*****************************************************/
}
