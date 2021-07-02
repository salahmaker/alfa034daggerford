void main()
{
      object oPC = GetLastUsedBy();
      if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
         SpeakString("This spring is warded against your kind!");
     else
     {
        SpeakString("You may pass the ward to Eldath's Springs.");
        AssignCommand(GetLastUsedBy(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_AtTheSpring"))));
     }
}
