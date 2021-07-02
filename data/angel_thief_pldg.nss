//::///////////////////////////////////////////////
//:: FileName angel_thief_pldg
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/24/2004 11:58:11 PM
//:://////////////////////////////////////////////
#include "sos_include"

void main()
{
    // Give the speaker the items
    CreateItemOnObject("brotherhoodpledg", GetPCSpeaker(), 1);
    SOS_SetPersistentInt(GetPCSpeaker(), "Thief_Guild_Pledge", 0);

}
