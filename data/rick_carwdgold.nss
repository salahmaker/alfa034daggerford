void main()
{
    TakeGoldFromCreature(5,GetPCSpeaker(),TRUE);

    object oWay = GetWaypointByTag("CARWD");
    AssignCommand(GetPCSpeaker(),ActionJumpToObject(oWay,FALSE));


}

