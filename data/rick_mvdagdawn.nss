void main()
{
    TakeGoldFromCreature(150,GetPCSpeaker(),TRUE);
    AssignCommand(GetPCSpeaker(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_DagDawnCaravan"))));
}

