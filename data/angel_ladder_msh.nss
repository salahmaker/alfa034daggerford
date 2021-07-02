//::///////////////////////////////////////////////
//:: Name angel_ladder_msh
//:: FileName angel_ladder_msh
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
To allow the use a a ladder to get to the kitchen area in Menril's house
*/
//:://////////////////////////////////////////////
//:: Created By: angel_caller
//:: Created On:Jan 14, 2005 11:33PM
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(GetLastUsedBy(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_MenrilKitchen"))));
}
