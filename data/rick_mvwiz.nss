void main()
{
    TakeGoldFromCreature(50,GetPCSpeaker(),TRUE);
    AssignCommand(GetPCSpeaker(),ActionJumpToLocation(GetLocation(GetWaypointByTag("ToWizardTower"))));
}

