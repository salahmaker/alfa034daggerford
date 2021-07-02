void main()
{
    TakeGoldFromCreature(5,GetPCSpeaker(),TRUE);
    object oWay = GetWaypointByTag("CarDF");
    AssignCommand(GetPCSpeaker(),ActionJumpToObject(oWay,FALSE));



}

