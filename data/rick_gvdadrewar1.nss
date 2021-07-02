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
    // Give the hierloom and exp
    // tunic
    CreateItemOnObject("fancyjewelbrooch", GetPCSpeaker(), 1);
    GiveXPToCreature(GetPCSpeaker(), 50);
    SOS_SetPersistentInt(GetPCSpeaker(),"finddad_level_1",3);


}
