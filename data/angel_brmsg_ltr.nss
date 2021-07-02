//::///////////////////////////////////////////////
//:: FileName angel_brmsg_ltr
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/29/2004 1:38:48 PM
//:://////////////////////////////////////////////
#include "SOS_include"

void main()
{
    // Give the speaker the Gunark's letter
    CreateItemOnObject("invitationtot001", GetPCSpeaker(), 1);
    SOS_SetPersistentInt(GetPCSpeaker(), "thieves_task_quest", 6);
    SetLocalInt(GetEnteringObject(), "Messanger", 0);
}
