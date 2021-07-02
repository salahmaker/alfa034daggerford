void main()
{
    TakeGoldFromCreature(2,GetPCSpeaker(),TRUE);
    object oWay = GetWaypointByTag("coach_aq");
    AssignCommand(GetPCSpeaker(),ActionJumpToObject(oWay,FALSE));
}
