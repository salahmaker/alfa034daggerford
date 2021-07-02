void main()
{
    TakeGoldFromCreature(2,GetPCSpeaker(),TRUE);
    object oWay = GetWaypointByTag("coach_td");
    AssignCommand(GetPCSpeaker(),ActionJumpToObject(oWay,FALSE));
}
