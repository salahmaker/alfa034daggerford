//::///////////////////////////////////////////////
//:: FileName rick_giveorder for spirits
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:10:53 PM
//:://////////////////////////////////////////////

#include "nw_i0_tool"
#include "SOS_include"
#include "subraces"

void main()
{
    // Give the speaker an order form
    CreateItemOnObject("barrelofcheese", GetPCSpeaker(), 1);
    SOS_SetPersistentInt(GetPCSpeaker(), "cheesebox_level_1", 1);

}
