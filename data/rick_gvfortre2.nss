//::///////////////////////////////////////////////
//:: FileName rick_givepatrolman
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
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "ElixirofLove" );
    DestroyObject(oItem);
    GiveXPToCreature(GetPCSpeaker(), 25);
    GiveGoldToCreature(GetPCSpeaker(), 20);
    SOS_SetPersistentInt(GetPCSpeaker(),"ElixirofLove1",1);


}
