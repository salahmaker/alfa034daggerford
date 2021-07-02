void main()
{
    TakeGoldFromCreature(5,GetPCSpeaker(), TRUE);

    object oWay = GetWaypointByTag("CarDFC");
    AssignCommand(GetPCSpeaker(),ActionJumpToObject(oWay,FALSE));

}

