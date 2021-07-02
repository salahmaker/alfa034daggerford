//::///////////////////////////////////////////////
//:: FileName angel_olin_qust2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: angel_caller
//:: Created On: 8/8/2004 1:14:53 AM
//:://////////////////////////////////////////////

#include "nw_i0_tool"
#include "SOS_include"
#include "subraces"

void main()
{
    // Set Quest ID for Olin quest as completed
    SOS_SetPersistentInt(GetPCSpeaker(), "thieves_task_quest", 2);

}
