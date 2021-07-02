//::///////////////////////////////////////////////
//:: Name angel_trpdr_dh2
//:: FileName angel_trpdr_dh2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
To allow the use of trap door to get to the pit area in 'The Dark Road' guildhouse
*/
//:://////////////////////////////////////////////
//:: Created By: angel_caller
//:: Created On:Jan 14, 2005 11:33PM
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(GetLastUsedBy(),ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_DarkHousePit2"))));
    DelayCommand(18.0, ActionCloseDoor(OBJECT_SELF));
    SetLocked(OBJECT_SELF, TRUE);
}
