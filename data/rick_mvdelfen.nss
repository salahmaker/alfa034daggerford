void main()
{
   object oPC = GetLastUsedBy();
   if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
      SpeakString("Delfen has warded this portal against evil. Begone!");
   else
   {
      SpeakString("You have passed Defen's Ward!");
      AssignCommand(GetLastUsedBy(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Delfen"))));
   }

}
