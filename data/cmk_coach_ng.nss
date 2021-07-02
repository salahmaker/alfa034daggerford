void main()
{
    TakeGoldFromCreature(2,GetPCSpeaker(),TRUE);
    object oWay = GetWaypointByTag("coach_ng");
    AssignCommand(GetPCSpeaker(),ActionJumpToObject(oWay,FALSE));
}
