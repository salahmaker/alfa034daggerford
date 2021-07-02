void main()
{
    TakeGoldFromCreature(5,GetPCSpeaker(),TRUE);

    object oWay = GetWaypointByTag("CarMF");
    AssignCommand(GetPCSpeaker(),ActionJumpToObject(oWay,FALSE));
}

