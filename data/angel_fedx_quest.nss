//::///////////////////////////////////////////////
//:: FileName angel_fedx_quest
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
    // Set Quest ID for Fedex quest
    SOS_SetPersistentInt(GetPCSpeaker(), "thieves_task_quest", 2);

}