// This will return the NPC to a starting position
// if he attempts to leave the trigger.
// You must replace "NPC_TALKER" with the tag of the NPC.
// You must also have a waypoint with the tag "WP_RETURN_" + NPC's Tag.
// This should be placed in the spot the NPC starts at.
void main()
{
  string sTag = "Delin";
  object oExit = GetExitingObject();
  if(GetTag(oExit) == sTag)
  {
    AssignCommand(oExit,ClearAllActions());
    AssignCommand(oExit,ActionMoveToObject(GetNearestObjectByTag("WP_RETURN_" + sTag)));
  }
}

