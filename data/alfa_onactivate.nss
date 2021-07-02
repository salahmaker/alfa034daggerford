/******************************************************************
 * Name: alfa_onactivate
 * Type: OnActivateItem
 * ---
 * Author: Modal
 * Date: 08/30/02
 * ---
 * This handles the module OnActivateItem event.
 * You can add custom code in the appropriate section, as well as
 * in alfa_userdef.
 ******************************************************************/

/* Includes */
#include "alfa_include"

void main()
{
  ALFA_OnActivateItem();

  /**************** Add Custom Code Here ***************/
  ExecuteScript("omega_onactivate",GetItemActivator());

  ExecuteScript("rick_items",GetItemActivator());
  ExecuteScript("rick_herbs",GetItemActivator());
  ExecuteScript("rick_pets",GetItemActivator());

  /*****************************************************/
}
