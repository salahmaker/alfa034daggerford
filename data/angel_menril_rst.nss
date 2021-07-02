//::///////////////////////////////////////////////
//:: FileName angel_mentor_st
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: angel_caller
//:: Created On: 8/8/2004 1:157:53 AM
//:://////////////////////////////////////////////

#include "nw_i0_tool"
#include "SOS_include"
#include "subraces"

void main()
{
    if (!(SOS_GetPersistentInt(GetPCSpeaker(), "thieves_task_quest") == 8))
    {
    // Set Quest ID for Mentor search
    SOS_SetPersistentInt(GetPCSpeaker(), "thieves_task_quest", 8);
    CreateItemOnObject("farrelsshipdrkey", GetPCSpeaker(), 1);
    }
}
