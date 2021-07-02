void main()
{
      object oPC = GetLastUsedBy();
      AssignCommand(GetLastUsedBy(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_AtTheShrine"))));
}
