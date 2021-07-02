//::///////////////////////////////////////////////
//:: Name angel_ladder_cpt
//:: FileName angel_ladder_cpt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
To allow the use a a ladder to get out of Forgotten Crypt
*/
//:://////////////////////////////////////////////
//:: Created By: angel_caller
//:: Created On:Jan 14, 2005 11:33PM
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(GetLastUsedBy(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_OutsideForgottenCrypt"))));
}
