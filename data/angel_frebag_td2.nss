//::///////////////////////////////////////////////
//:: Name angel_frebag_td2
//:: FileName angel_frebag_td2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
To allow the use of a trapdoor to get to the lower level
*/
//:://////////////////////////////////////////////
//:: Created By: angel_caller
//:: Created On:Jan 18, 2005 11:33PM
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(GetLastUsedBy(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Freebag_Start3"))));
}
