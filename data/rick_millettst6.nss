//::///////////////////////////////////////////////
//:: FileName rick_milletteroftesting
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:10:53 PM
//:://////////////////////////////////////////////

#include "nw_i0_tool"
#include "sos_include"
#include "subraces"

void main()
{
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "LetterofTesting5");
    if(GetIsObjectValid(oItemToTake) != 0)
    {
        DestroyObject(oItemToTake);
    }

    // Give the speaker a militia note
    CreateItemOnObject("letteroftesting6", GetPCSpeaker(), 1);
}
