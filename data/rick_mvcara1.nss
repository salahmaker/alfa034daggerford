void main()
{
    TakeGoldFromCreature(50,GetPCSpeaker(),TRUE);
    AssignCommand(GetPCSpeaker(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Caravan1"))));
}

