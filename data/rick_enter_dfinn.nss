#include "sos_include"

void main()
{
   object oNPC = GetObjectByTag("Messanger");
   object oPC = GetEnteringObject();

   if(GetIsPC(oPC))
   {
      SetLocalInt(oPC,"rick_no_sleep_flag",TRUE);
   }
/* Thieves'Brotherhood entry*/

    if(SOS_GetPersistentInt(GetEnteringObject(), "thieves_task_quest") == 5)
    {
        AssignCommand(oNPC,ClearAllActions());
        AssignCommand(oNPC,ActionMoveToObject(oPC));
        AssignCommand(oNPC,ActionStartConversation(oPC));
    }
}
