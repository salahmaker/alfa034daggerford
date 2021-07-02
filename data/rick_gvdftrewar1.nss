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
    GiveGoldToCreature(GetPCSpeaker(), 20);
    GiveXPToCreature(GetPCSpeaker(), 80);
}
