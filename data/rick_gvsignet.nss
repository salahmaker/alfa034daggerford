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


    object oItem = GetFirstItemInInventory(GetPCSpeaker());
    while(oItem != OBJECT_INVALID)
    {
        if(GetTag(oItem) == "oldnoblefamilysignetpendant")
        {
            DestroyObject(oItem);
           if(GetHitDice(GetPCSpeaker()) < 8)
               GiveXPToCreature(GetPCSpeaker(),15);
           GiveGoldToCreature(GetPCSpeaker(),15);

        }
        else if(GetTag(oItem) == "oldnoblefamilysignetring")
        {
            DestroyObject(oItem);
            if(GetHitDice(GetPCSpeaker()) < 8)
               GiveXPToCreature(GetPCSpeaker(),20);
            GiveGoldToCreature(GetPCSpeaker(),20);
        }
        oItem = GetNextItemInInventory(GetPCSpeaker());

    }

}
