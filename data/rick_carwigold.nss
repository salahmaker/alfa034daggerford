void main()
{
    TakeGoldFromCreature(5,GetPCSpeaker(),TRUE);
    object oWay = GetWaypointByTag("CarWI");
    AssignCommand(GetPCSpeaker(),ActionJumpToObject(oWay,FALSE));

}

