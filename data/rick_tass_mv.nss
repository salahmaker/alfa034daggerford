//::///////////////////////////////////////////////
//:: Name angel_ladder_dh1
//:: FileName angel_ladder_dh1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
To allow the use a a ladder to get to the sleeping area in 'The Dark Road' guildhouse
*/
//:://////////////////////////////////////////////
//:: Created By: angel_caller
//:: Created On:Jan 14, 2005 11:33PM
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(GetLastUsedBy(),ActionJumpToLocation(GetLocation(GetWaypointByTag("TowerTop"))));
}
