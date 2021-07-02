void main()
{
    TakeGoldFromCreature(5,GetPCSpeaker(),TRUE);


    object oWay = GetWaypointByTag("CarMT");
    AssignCommand(GetPCSpeaker(),ActionJumpToObject(oWay,FALSE));
}

