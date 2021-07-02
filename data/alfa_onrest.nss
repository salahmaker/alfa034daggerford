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
#include "alfa_include"

void main()
{
     object oPC = GetLastPCRested();
    int iSleep = GetLocalInt(oPC,"rick_no_sleep_flag");

    if(GetIsPC(oPC))
    {
        if(iSleep == FALSE)
        {
            ALFA_OnRest();
        }
        else if((iSleep == TRUE) && (GetLastRestEventType() == REST_EVENTTYPE_REST_STARTED))
        {
            AssignCommand(oPC,ClearAllActions());
            FloatingTextStringOnCreature("You can't sleep here.  Get a room.",oPC,FALSE);
        }
        else
            AssignCommand(oPC,ClearAllActions());
    }
}
