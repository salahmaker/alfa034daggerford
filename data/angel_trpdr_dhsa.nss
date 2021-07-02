//::///////////////////////////////////////////////
//:: Name angel_trpdr_dhsa
//:: FileName angel_trpdr_dhsa
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
To allow the use of trap door to get to the main area in 'The Dark Road' guildhouse
*/
//:://////////////////////////////////////////////
//:: Created By: angel_caller
//:: Created On:Jan 14, 2005 11:33PM
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(GetLastUsedBy(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_DarkHouseMainLadder"))));
}
