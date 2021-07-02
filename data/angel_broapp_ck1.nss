//::///////////////////////////////////////////////
//:: FileName angel_broplg_ck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:12:40 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"
#include "spawn_main"

void main()
{
    // Check PC's inventory for Brotherhood Apprentice Pin
    if(HasItem(GetEnteringObject(), "BrotherhoodApprenticePin"))
        Spawn();
}
