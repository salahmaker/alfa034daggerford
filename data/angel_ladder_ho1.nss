//::///////////////////////////////////////////////
//:: Name angel_ladder_ho1
//:: FileName angel_ladder_ho1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
To allow the use a a ladder to get to the stage area in the Highwaymen's Order guildhouse
*/
//:://////////////////////////////////////////////
//:: Created By: angel_caller
//:: Created On:Mar 30, 2005 11:33PM
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(GetLastUsedBy(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_HighwaymenOrderStageArea"))));
}
