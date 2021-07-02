// this is the on enter script if a trigger that
// encompasses the NPC who will be initiating dialouge.
// Make sure to replace "NPC_TALKER" with the actual tag of the NPC
#include "sos_include"

void main()
{
  object oNPC = GetObjectByTag("Delin");
  object oPC = GetEnteringObject();

  if(GetIsPC(oPC) &&
  SOS_GetPersistentInt(oPC,"Dlg_Init_" + GetTag(oNPC)) == FALSE &&
  !IsInConversation(oNPC) && (GetLevelByClass(CLASS_TYPE_ROGUE, oPC) >= 1))
  {
    AssignCommand(oPC,ClearAllActions());
    AssignCommand(oNPC,ClearAllActions());
    AssignCommand(oNPC,ActionMoveToObject(oPC));
    AssignCommand(oNPC,ActionStartConversation(oPC));
  }
}

