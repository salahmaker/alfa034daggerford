void main()
{
    TakeGoldFromCreature(5,GetPCSpeaker(),TRUE);

    object oWay = GetWaypointByTag("WP_Caravan3");
    AssignCommand(GetPCSpeaker(),ActionJumpToObject(oWay,FALSE));



}

