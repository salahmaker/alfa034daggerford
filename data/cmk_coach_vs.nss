void main()
{
    TakeGoldFromCreature(2,GetPCSpeaker(),TRUE);
    object oWay = GetWaypointByTag("coach_vs");
    AssignCommand(GetPCSpeaker(),ActionJumpToObject(oWay,FALSE));
}
