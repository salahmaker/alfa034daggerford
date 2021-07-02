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

    if( GetItemPossessedBy(GetPCSpeaker(),"LordBonebreaksSkull") != OBJECT_INVALID){
       object oItem = GetItemPossessedBy(GetPCSpeaker(), "LordBonebreaksSkull" );
       DestroyObject(oItem);
       GiveXPToCreature(GetPCSpeaker(), 100);
       GiveGoldToCreature(GetPCSpeaker(), 500);

    }

    if( GetItemPossessedBy(GetPCSpeaker(),"IronhammersHead") != OBJECT_INVALID){
       object oItem = GetItemPossessedBy(GetPCSpeaker(), "IronhammersHead" );
       DestroyObject(oItem);
       GiveXPToCreature(GetPCSpeaker(), 100);
       GiveGoldToCreature(GetPCSpeaker(), 500);

    }

    if( GetItemPossessedBy(GetPCSpeaker(),"GreentoothsHead") != OBJECT_INVALID){
       object oItem = GetItemPossessedBy(GetPCSpeaker(), "GreentoothsHead" );
       DestroyObject(oItem);
       GiveXPToCreature(GetPCSpeaker(), 100);
       GiveGoldToCreature(GetPCSpeaker(), 500);

    }

    if( GetItemPossessedBy(GetPCSpeaker(),"SlytheHead") != OBJECT_INVALID){
       object oItem = GetItemPossessedBy(GetPCSpeaker(), "SlytheHead" );
       DestroyObject(oItem);
       GiveXPToCreature(GetPCSpeaker(), 100);
       GiveGoldToCreature(GetPCSpeaker(), 500);

    }


}
