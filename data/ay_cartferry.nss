void main()
{
    //TakeGoldFromCreature(2,GetPCSpeaker(),TRUE);
    object oWay = GetWaypointByTag(GetLocalString(OBJECT_SELF, "destination"));
    AssignCommand(GetPCSpeaker(),ActionJumpToObject(oWay,FALSE));
}
